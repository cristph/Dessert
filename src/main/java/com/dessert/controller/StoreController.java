package com.dessert.controller;

import com.dessert.model.*;
import com.dessert.service.*;
import com.dessert.util.Constant;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by cristph on 2016/3/14.
 */

@Controller
public class StoreController {

    @Resource
    ShopService shopService;

    @Resource
    StoreService storeService;

    @Resource
    VipService vipService;

    @Resource
    UserService userService;

    @RequestMapping("/store")
    public String storeView(@RequestParam("category")String category,
                            @RequestParam("shopid")int shopid,
                            Model model) {
        List<SaleGood> list=storeService.getSaleGoods(category,shopid);
        model.addAttribute("list",list);

        Subject currentUser= SecurityUtils.getSubject();
        Session session=currentUser.getSession();
        session.setAttribute("shopid",shopid);
        return "store/store";
    }

    @RequestMapping("/goodinfo")
    public String goodinfoView(@RequestParam("sgid")int sgid,
                               Model model){
        SaleGood salegood=storeService.getSG(sgid);
//        Good good=storeService.find(salegood.getGid());

        model.addAttribute("salegood",salegood);
//        model.addAttribute("good",good);
        return "store/goodinfo";
    }


    @ResponseBody
    @RequestMapping(value = "/shoppingcart/add",method = RequestMethod.POST)
    public String addshoppingcart(@RequestParam("sgid")int sgid,
                                   @RequestParam("amount")int amount){

        Subject currentUser= SecurityUtils.getSubject();
        Session session=currentUser.getSession();

        //取得对应产品的购买项
        SaleGood saleGood=storeService.getSG(sgid);
        Sorderitem sorderitem=new Sorderitem();
        sorderitem.setGid(saleGood.getGid());
        sorderitem.setQty(amount);
        sorderitem.setSgid(sgid);
        sorderitem.setTprice(saleGood.getPrice()*amount);

        //将购买项加入购物车session
        List<Sorderitem> shoppingcart= (List<Sorderitem>) session.getAttribute("shoppingcart");
        if(shoppingcart==null){
            shoppingcart=new ArrayList<Sorderitem>();
            shoppingcart.add(sorderitem);
            session.setAttribute("shoppingcart",shoppingcart);
        }else{
            boolean exist=false;
            for(Sorderitem item1:shoppingcart){
                if(item1.getSgid()==sgid){
                    item1.setQty(item1.getQty()+amount);
                    item1.setTprice(item1.getTprice()+sorderitem.getTprice());
                    exist=true;
                }
            }
            if(!exist){
                shoppingcart.add(sorderitem);
            }
            session.setAttribute("shoppingcart",shoppingcart);
        }

        Object total_price_o= session.getAttribute("total_price");
        if(total_price_o==null){
            session.setAttribute("total_price",sorderitem.getTprice());
        }else {
            double total_price=(Double)total_price_o;
            total_price+=sorderitem.getTprice();
            session.setAttribute("total_price",total_price);
        }
        return Constant.method_exceute_success;
    }

    @RequestMapping("/shoppingcart")
    public String shoppingcartView(Model model){
        Subject currentUser= SecurityUtils.getSubject();
        Session session=currentUser.getSession();
        List<Sorderitem> shoppingcart= (List<Sorderitem>) session.getAttribute("shoppingcart");

        List<ShoppingCartItem> list=new ArrayList<>();
        for(Sorderitem sorderitem:shoppingcart){
            Good good=storeService.find(sorderitem.getGid());
            ShoppingCartItem shoppingCartItem=new ShoppingCartItem();
            shoppingCartItem.setSorderitem(sorderitem);
            shoppingCartItem.setGood(good);
            list.add(shoppingCartItem);
        }

        if(shoppingcart!=null){
            model.addAttribute("shoppingcart",list);
        }

        Object total_price_o= session.getAttribute("total_price");
        if(total_price_o!=null){
            double total_price=(Double)total_price_o;
            model.addAttribute("total_price",total_price);
        }else{
            model.addAttribute("total_price",0);
        }

        Vip vip=vipService.findByEmail((String)currentUser.getPrincipal());
        model.addAttribute("vid",vip.getVid());

        return "store/shoppingcart";
    }


    @ResponseBody
    @RequestMapping(value = "/shoppingcart/buy",method = RequestMethod.POST)
    public String Salebuy(@RequestParam("money")double money,
                          @RequestParam("pswd")String pswd){
        Subject currentUser= SecurityUtils.getSubject();
        Session session=currentUser.getSession();

        String email=(String)currentUser.getPrincipal();
        User user=userService.checkPswd(email,pswd);
        String res="";
        if(user==null){
            return Constant.query_id_or_pswd_error;
        }else{
            res=vipService.buy(email,money);
            if(res.equals(Constant.vip_state_not_active)){
                return res;
            }
            if(res.equals(Constant.account_money_not_enough)){
                return res;
            }
        }

        if(res.equals(Constant.method_exceute_success)){

            List<Sorderitem> shoppingcart= (List<Sorderitem>) session.getAttribute("shoppingcart");
//            System.out.println("///////////////////////////////////////");
//            System.out.println("shoppingcart Size:"+shoppingcart.size());

            Saleorder saleorder=new Saleorder();
            saleorder.setEmail(email);
            saleorder.setOnline("online");
            saleorder.setWemail("none");
            saleorder.setPayway("card");
            double total_price= (Double) session.getAttribute("total_price");
            saleorder.setTotalprice(total_price);
            int shopid=(Integer)session.getAttribute("shopid");
            saleorder.setShopid(shopid);
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            saleorder.setTime(df.format(new Date()));

            res=storeService.addSaleRecord(saleorder,shoppingcart);

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
