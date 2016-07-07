package com.dessert.controller;

import com.dessert.model.*;
import com.dessert.service.*;
import com.dessert.util.Constant;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by cristph on 2016/3/17.
 */
@Controller
public class WaiterController {

    @Resource
    WaiterService waiterService;

    @Resource
    ShopService shopService;

    @Resource
    StoreService storeService;

    @Resource
    UserService userService;

    @Resource
    VipService vipService;


    @RequestMapping("addPlanShop")
    public String addPlanShop(@RequestParam("shopid") int shopid,
                              Model model){
        Shop shop=shopService.getShop(shopid);
        Subject currentUser= SecurityUtils.getSubject();
        Session session=currentUser.getSession();
        session.setAttribute("planShop",shop);

        List<Good> goodList=waiterService.getProductList("all");
        List<Shop> shopList=shopService.getShops();
        model.addAttribute("goodList",goodList);
        model.addAttribute("shopList",shopList);
        return "sale/saleproject";
    }


    @RequestMapping("/addGoodProject")
    public String addGoodProject(@RequestParam("picpath")String picpath,
                                 Model model){
        model.addAttribute("picpath",picpath);
        List<Good> goodList=waiterService.getProductList("all");
        List<Shop> shopList=shopService.getShops();
        model.addAttribute("goodList",goodList);
        model.addAttribute("shopList",shopList);
        return "sale/saleproject";
    }

    @ResponseBody
    @RequestMapping("/postProduct")
    public String addProduct(@RequestParam("picpath")String picpath,
                             @RequestParam("name")String name,
                             @RequestParam("description")String description,
                             @RequestParam("price")double price,
                             @RequestParam("category")String category){
        Good good=new Good();
        good.setPrice(price);
        good.setDescription(description);
        good.setPic(picpath);
        good.setGname(name);
        good.setCategory(category);

        waiterService.addProduct(good);
        return Constant.method_exceute_success;
    }

    @RequestMapping("/addProductView")
    public String ProductList(@RequestParam("picpath")String picpath,
                              Model model){
        model.addAttribute("picpath",picpath);
        return "sale/addProduct";
    }

    @ResponseBody
    @RequestMapping("/createPlanProduct")
    public String createPlanProduct(@RequestParam("gid") int gid,
                                    @RequestParam("deadline")String deadline,
                                    @RequestParam("beginDate")String beginDate,
                                    @RequestParam("num")int num,
                                    @RequestParam("price")double price){
        Good good=shopService.getGood(gid);
        SaleGood saleGood=new SaleGood();
        saleGood.setGid(gid);
        saleGood.setGname(good.getGname());
        saleGood.setCategory(good.getCategory());
        saleGood.setDescription(good.getDescription());
        saleGood.setPic(good.getPic());
        saleGood.setNum(num);
        saleGood.setPrice(price);
        saleGood.setBeginDate(beginDate);
        saleGood.setDeadline(deadline);

        Subject currentUser= SecurityUtils.getSubject();
        Session session=currentUser.getSession();

        ArrayList<SaleGood> productPlanArrayList=(ArrayList<SaleGood>)session.getAttribute("productPlanArrayList");
        if(productPlanArrayList==null){
            productPlanArrayList=new ArrayList<SaleGood>();
        }
        productPlanArrayList.add(saleGood);
        session.setAttribute("productPlanArrayList",productPlanArrayList);
        return Constant.method_exceute_success;
    }


    @RequestMapping("/productList")
    public String ProductList(Model model){
        List<Good> goodList=waiterService.getProductList("all");
        model.addAttribute("goodList",goodList);
        return "sale/productList";
    }

    @RequestMapping("/postPlan")
    public String postPan(Model model){
        ProductPlanList productPlanList=new ProductPlanList();
        Subject currentUser= SecurityUtils.getSubject();
        Session session=currentUser.getSession();
        ArrayList<SaleGood> productPlanArrayList=(ArrayList<SaleGood>)session.getAttribute("productPlanArrayList");
        String wemail=(String) currentUser.getPrincipal();
        int shopid=((Shop)session.getAttribute("planShop")).getShopid();
        productPlanList.setEmail(wemail);
        productPlanList.setSaleGoodArrayList(productPlanArrayList);
        productPlanList.setShopid(shopid);

        shopService.addProductPlan(productPlanList);

        session.removeAttribute("productPlanArrayList");
        session.removeAttribute("planShop");
        List<ProductPlanList> list=shopService.getProductPlan();
        model.addAttribute("list",list);
        return "sale/saleList";
    }

    @RequestMapping("saleplanlist")
    public String planlist(Model model){
//        Subject subject=SecurityUtils.getSubject();
//        String wemail=(String)subject.getPrincipal();
        List<ProductPlanList> list=shopService.getProductPlan();
        model.addAttribute("list",list);
        return "sale/saleList";
    }

    @RequestMapping("permitplan")
    public String permitplan(Model model){
        List<ProductPlanList> list=shopService.getProductPlan();
        model.addAttribute("list",list);
        return "sale/permitplan";
    }

    @RequestMapping("permit")
    public String permit(@RequestParam("planid")int planid){
        shopService.permit(planid);
        return "redirect:/permitplan";
    }

    @RequestMapping("sell")
    public String sell(Model model){
        return "shop/sell";
    }

    @RequestMapping("sellgood")
    public String good(@RequestParam("sgid")int sgid,
                       @RequestParam("num")int num,
                       Model model){

        SaleGood saleGood=storeService.getSG(sgid);
        Good good=storeService.find(saleGood.getGid());

        ShoppingCartItem shoppingCartItem=new ShoppingCartItem();
        shoppingCartItem.setGood(good);
        Sorderitem sorderitem=new Sorderitem();
        sorderitem.setGid(saleGood.getGid());
        sorderitem.setQty(num);
        sorderitem.setTprice(saleGood.getPrice()*num);
        sorderitem.setSgid(sgid);
        shoppingCartItem.setSorderitem(sorderitem);

        Subject currentUser= SecurityUtils.getSubject();
        Session session=currentUser.getSession();
        session.setAttribute("item",shoppingCartItem);

        model.addAttribute("item",shoppingCartItem);
        return "shop/sellcart";
    }

    @ResponseBody
    @RequestMapping("/sellpost")
    public String postsell(@RequestParam("money")double money,
                           @RequestParam("pswd")String pswd,
                           @RequestParam("vid")String vid){
        Subject currentUser= SecurityUtils.getSubject();
        Session session=currentUser.getSession();
        String wemail=(String)currentUser.getPrincipal();

        User user=userService.checkVipPswd(vid,pswd);
        String userEmail=user.getEmail();
        String res="";
        if(user==null){
            return Constant.query_id_or_pswd_error;
        }else{
            res=vipService.buy(userEmail,money);
            if(res.equals(Constant.vip_state_not_active)){
                return res;
            }
            if(res.equals(Constant.account_money_not_enough)){
                return res;
            }
        }

        if(res.equals(Constant.method_exceute_success)){

            ShoppingCartItem item=(ShoppingCartItem) session.getAttribute("item");
            List<Sorderitem> list=new ArrayList<>();
            list.add(item.getSorderitem());

            Saleorder saleorder=new Saleorder();
            saleorder.setEmail(userEmail);
            saleorder.setWemail(wemail);
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            saleorder.setTime(df.format(new java.util.Date()));
            saleorder.setShopid(waiterService.getshopid(wemail));
            saleorder.setOnline("offline");
            saleorder.setPayway("card");
            saleorder.setTotalprice(item.getSorderitem().getTprice());

            res=storeService.addSaleRecord(saleorder,list);

            if(session.getAttribute("shoppingcart")!=null){
                session.removeAttribute("shoppingcart");
            }
            if(session.getAttribute("total_price")!=null){
                session.removeAttribute("total_price");
            }

            return res;
        }else{
            return Constant.method_execute_fail;
        }
    }

}
