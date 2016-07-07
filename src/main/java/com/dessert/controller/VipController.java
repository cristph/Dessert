package com.dessert.controller;

import com.dessert.model.*;
import com.dessert.service.BankService;
import com.dessert.service.ShopService;
import com.dessert.service.StoreService;
import com.dessert.service.VipService;
import com.dessert.util.Constant;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by cristph on 2016/3/13.
 */

@Controller
public class VipController {

    @Resource
    ShopService shopService;

    @Resource
    VipService vipService;

    @Resource
    BankService bankService;

    @Resource
    StoreService storeService;

    @RequestMapping("/vipinfo")
    public String vipinfoView(Model model){

        Subject subject= SecurityUtils.getSubject();
        String email=(String)subject.getPrincipal();

        Vip vip=vipService.findByEmail(email);
        if(vip!=null){
            model.addAttribute("vip",vip);
        }else{
            vip=new Vip();
            model.addAttribute("vip",vip);
        }
        return "vip/vipinfo";
    }

    @ResponseBody
    @RequestMapping("/invokevip")
    public String invokevip(@RequestParam("money")double money,
                            @RequestParam("bid")int bid,
                            @RequestParam("pswd")String pswd){
        String res=bankService.getMoney(bid,pswd,money);
        if(res.equals(Constant.method_exceute_success)){
            Subject subject=SecurityUtils.getSubject();
            String email=(String)subject.getPrincipal();
            res=vipService.invokeVip(email,money);
            bankService.addChargeRecord(email,money);
            return res;
        }else{
            return res;
        }
    }

    @ResponseBody
    @RequestMapping("/chargevip")
    public String chargevip(@RequestParam("money")double money,
                            @RequestParam("bid")int bid,
                            @RequestParam("pswd")String pswd){
        String res=bankService.getMoney(bid,pswd,money);
        if(res.equals(Constant.method_exceute_success)){
            Subject subject=SecurityUtils.getSubject();
            String email=(String)subject.getPrincipal();
            res=vipService.chargeMoney(email,money);
            bankService.addChargeRecord(email,money);
            return res;
        }else{
            return res;
        }
    }

    @RequestMapping("/chargerecord")
    public String chargerecordView(Model model){
        Subject subject=SecurityUtils.getSubject();
        String email=(String)subject.getPrincipal();
        List<Chargerecord> list=bankService.getChargeRecord(email);
        model.addAttribute("list",list);
        return "vip/chargerecord";
    }

    @RequestMapping("/buyrecord")
    public String buyrecord(Model model){
        Subject subject=SecurityUtils.getSubject();
        String email=(String)subject.getPrincipal();

        //订单集合
        List<Saleorder> list=storeService.getOrders(email);

        //view所使用的订单列表
        ArrayList<Order> orderlist=new ArrayList<Order>();

        if(list==null||list.size()==0){
            model.addAttribute("orderlist",orderlist);
            return "vip/buyRecord";
        }

        //遍历订单集合
        for(Saleorder saleorder:list){
            int soid=saleorder.getSoid();

            List<Sorderitem> sorderitemList=storeService.getOrderItems(soid);
            List<ShoppingCartItem> itemList=new ArrayList<ShoppingCartItem>() ;

            //加入订单购买项
            for(Sorderitem sorderitem:sorderitemList){
                int gid=sorderitem.getGid();
                Good good=storeService.find(gid);
                ShoppingCartItem shoppingCartItem=new ShoppingCartItem();
                shoppingCartItem.setGood(good);
                shoppingCartItem.setSorderitem(sorderitem);
                itemList.add(shoppingCartItem);
            }
            Order order=new Order();
            order.setSaleorder(saleorder);
            order.setShop(shopService.getShop(saleorder.getShopid()));
            order.setShoppingCartItemArrayList(itemList);
            orderlist.add(order);
        }

        model.addAttribute("orderlist",orderlist);
        return "vip/buyRecord";
    }

}
