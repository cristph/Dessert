package com.dessert.controller;

import com.dessert.model.Shop;
import com.dessert.model.User;
import com.dessert.model.Waiter;
import com.dessert.service.ShopService;
import com.dessert.service.WaiterService;
import com.dessert.util.Constant;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import java.sql.Date;
import java.util.List;

/**
 * Created by cristph on 2016/3/18.
 */

@Controller
public class ShopController {

    @Resource
    ShopService shopService;

    @Resource
    WaiterService waiterService;

    @RequestMapping("/viewshoplist")
    public String getshoplist(Model model){
        List<Shop> list=shopService.getShops();
        model.addAttribute("list",list);
        return "shop/shopview";
    }


    @RequestMapping("/shoplist")
    public String shopView(Model model){
        List<Shop> list=shopService.getShops();
        model.addAttribute("list",list);
        return "shop/shoplist";
    }

    @RequestMapping("/addshop")
    public String addshop(){
        return "shop/addshop";
    }

    @ResponseBody
    @RequestMapping("/openshop")
    public String openShop(@RequestParam("shopname")String shopname,
                           @RequestParam("address")String address,
                           @RequestParam("contact")String contact){
        Shop shop=new Shop();
        shop.setShopname(shopname);
        shop.setAddress(address);
        shop.setContact(contact);
        shop.setOpendate(new Date(System.currentTimeMillis()));
        shop.setShopauth(Constant.shop_cm);
        shop.setShoppic("/upload/甜品工房.jpg");
        String res=shopService.add(shop);
        return res;
    }

    @RequestMapping("delshop")
    public String delshop(@RequestParam("shopid")int shopid){
        String res=shopService.del(shopid);
        if(res.equals(Constant.method_exceute_success)){
            return "redirect:/shoplist";
        }else{
            return "redirect:/shoplist";
        }
    }

    @RequestMapping("/editshop")
    public String editshoop(@RequestParam("shopid")int shopid,
                            @RequestParam("shopauth")String shopauth,
                            Model model){
        List<User> list=waiterService.getWaiters(shopid);
        model.addAttribute("list",list);
        model.addAttribute("shopauth",shopauth);
        model.addAttribute("shopid",shopid);
        return "shop/waiterlist";
    }

    @RequestMapping("/addwaiter")
    public String addwauter(@RequestParam("shopid")int shopid,
                            @RequestParam("shopauth")String shopauth,
                            Model model){
        model.addAttribute("shopauth",shopauth);
        model.addAttribute("shopid",shopid);
        return "shop/addwaiter";
    }

    @ResponseBody
    @RequestMapping("/createwaiter")
    public String createshop(@RequestParam("email")String email,
                             @RequestParam("name")String username,
                             @RequestParam("sex")int sex,
                             @RequestParam("address")String address,
                             @RequestParam("birth")Date birth,
                             @RequestParam("selfintro")String selfintro,
                             @RequestParam("contact")String contact,
                             @RequestParam("pswd")String pswd,
                             @RequestParam("shopid")int shopid,
                             @RequestParam("shopauth")String shopauth){

        User user=new User();
        user.setUsername(username);
        user.setSex(sex);
        user.setAddress(address);
        user.setSelfintro(selfintro);
        user.setContact(contact);
        user.setPassword(pswd);
        if(shopauth.equals(Constant.shop_sp)){
            user.setAuth(Constant.auth_waiter_sp);
        }else{
            user.setAuth(Constant.auth_waiter_cm);
        }
        user.setVid("none");
        user.setEmail(email);
        user.setBirth(birth);

        String res=waiterService.createWaiter(user,shopid);
        return res;
    }

    @RequestMapping("delwaiter")
    public String delWaiter(@RequestParam("wemail")String wemail,
                            @RequestParam("shopid")int shopid,
                            @RequestParam("shopauth")String shopauth,
                            RedirectAttributes redirectAttributes){
        waiterService.delWaiter(wemail);
        redirectAttributes.addAttribute("shopid",shopid);
        redirectAttributes.addAttribute("shopauth",shopauth);
        return "redirect:/editshop";
    }

}
