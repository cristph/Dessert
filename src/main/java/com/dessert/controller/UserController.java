package com.dessert.controller;

import com.dessert.model.User;
import com.dessert.model.Vip;
import com.dessert.service.UserService;
import com.dessert.service.VipService;
import com.dessert.util.Constant;
import com.dessert.util.VerifyCodeUtil;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.subject.Subject;
import org.hibernate.Session;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.sql.Date;
import java.util.Random;

/**
 * Created by cristph on 2016/2/16.
 */

@Controller
public class UserController {

    @Resource
    private UserService userService;

    @Resource
    private VipService vipService;

    @RequestMapping("/login/route")
    public String loginRoute(RedirectAttributes redirectAttributes){
        System.out.println("///////////////////in route");
        Subject subject=SecurityUtils.getSubject();
        if(subject.hasRole(Constant.auth_vip)){
//            redirectAttributes.addAttribute("category","cake");
            return "redirect:/viewshoplist";
        }else if(subject.hasRole(Constant.auth_administrator)){
            return "redirect:/shoplist";
        }else if(subject.hasRole(Constant.auth_waiter_sp)){
            redirectAttributes.addAttribute("picpath","");
            return "redirect:/addGoodProject";
        }else if(subject.hasRole(Constant.auth_manager)){
            return "redirect:/permitplan";
        }else if(subject.hasRole(Constant.auth_waiter_cm)){
            return "redirect:/sell";
        }
        return "auth/login";
    }

    @RequestMapping("/login")
    public String goToLogin(){
        return "auth/login";
    }

    @ResponseBody
    @RequestMapping(value = "/login/post",method = RequestMethod.POST)
    public String loginPost(@RequestParam("email")String email,
                            @RequestParam("password")String password){

        UsernamePasswordToken token = new UsernamePasswordToken(email, password);
        token.setRememberMe(true);
//        System.out.println("为了验证登录用户而封装的token为" + ReflectionToStringBuilder.toString(token, ToStringStyle.MULTI_LINE_STYLE));

        Subject currentUser = SecurityUtils.getSubject();
        try {
            //login(token)之后会调用MyRealm.doGetAuthenticationInfo()方法
            System.out.println("对用户[" + email + "]进行登录验证..验证开始");
            currentUser.login(token);
            System.out.println("对用户[" + email + "]进行登录验证..验证通过");
        }catch(UnknownAccountException uae){
            System.out.println("对用户[" + email + "]进行登录验证..验证未通过,未知账户");
            return "Unknown Account!";
        }
        //验证是否登录成功
        if(currentUser.isAuthenticated()){
            System.out.println("用户[" + email + "]登录认证通过(这里可以进行一些认证通过后的一些系统参数初始化操作)");
            return "Login Success";
        }else{
            token.clear();
            return "Unknown Error";
        }
    }

    @RequestMapping("/register")
    public String goToRegister(){
        return "auth/register";
    }

    @RequestMapping("/register/getVerifyCodeImage")
    public void getVerifyCodeImage(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //设置页面不缓存
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
        String verifyCode = VerifyCodeUtil.generateTextCode(VerifyCodeUtil.TYPE_NUM_ONLY, 4, null);
        //将验证码放到HttpSession里面
        request.getSession().setAttribute("verifyCode", verifyCode);
        System.out.println("本次生成的验证码为[" + verifyCode + "],已存放到HttpSession中");
        //设置输出的内容的类型为JPEG图像
        response.setContentType("image/jpeg");
        BufferedImage bufferedImage = VerifyCodeUtil.generateImageCode(verifyCode, 90, 30, 3, true, Color.WHITE, Color.BLACK, null);
        //写给浏览器
        ImageIO.write(bufferedImage, "JPEG", response.getOutputStream());
    }

    @ResponseBody
    @RequestMapping(value = "/register/post",method = RequestMethod.POST)
    public String registerPost(HttpServletRequest request,
                               @RequestParam("username")String username,
                               @RequestParam("email")String email,
                               @RequestParam("password")String password,
                               @RequestParam("validationCode")String submitCode){

        String checkEmail=userService.checkEmail(email);
        if(checkEmail=="exist"){
            return "Email Exists";
        }

        //获取HttpSession中的验证码
        String verifyCode = (String)request.getSession().getAttribute("verifyCode");
        System.out.println("用户[" + username + "]登录时输入的验证码为[" + submitCode + "],HttpSession中的验证码为[" + verifyCode + "]");

        //验证验证码
        if (StringUtils.isEmpty(submitCode) ){
            return "verifyCode empty!";
        }
        if (!StringUtils.equals(verifyCode, submitCode.toLowerCase())){
            return "verifyCode wrong!";
        }

        //若验证码正确
        User user=new User();
        user.setEmail(email);
        user.setUsername(username);
        user.setPassword(password);
        user.setAuth(Constant.auth_vip);
        user.setVid(generateCardId(email));

        user.setSex(0);
        user.setAddress("");
        user.setBirth(new Date(System.currentTimeMillis()));
        user.setSelfintro("");
        user.setContact("");

        System.out.println("------------------to add "+user.toString()+" -------------------");

        String res=userService.addUser(user);

        System.out.println("---------------------res: "+res+" -----------------------");

        return res;
    }


    @RequestMapping("/setting")
    public String userSetting(Model model){
        Subject currentUser=SecurityUtils.getSubject();
        String uname=(String)currentUser.getPrincipal();
        System.out.println("uname: "+uname);
        User user=userService.findByEmail(uname);
        model.addAttribute("user",user);
        return "user/setting";
    }

    @ResponseBody
    @RequestMapping("/savesetting")
    public String postSetting(@RequestParam("name")String username,
                              @RequestParam("sex")int sex,
                              @RequestParam("address")String address,
                              @RequestParam("birth")Date birth,
                              @RequestParam("selfintro")String selfintro,
                              @RequestParam("contact")String contact){

        System.out.println("been posted>>>>>>>>>>>>>>>>>>>>>"+username+"|"+sex+"|"+address+"|"+birth+"|"+selfintro+"|"+contact+"|");
        Subject subject=SecurityUtils.getSubject();
        String email=(String)subject.getPrincipal();
        User user=new User();
        user.setEmail(email);
        user.setUsername(username);
        user.setSex(sex);
        user.setAddress(address);
        user.setBirth(birth);
        user.setSelfintro(selfintro);
        user.setContact(contact);
        String res=userService.update(user);
        if(res!=null){
            System.out.println(">>>>>>>>>>>>>>>>>>>>>>>update fininsh");
            return "Success";
        }
        return "Fail";
    }

    @RequestMapping("/resetpswd")
    public String resetpswdView() {
        return "user/resetpswd";
    }

    @ResponseBody
    @RequestMapping("/resetpswd/post")
    public String resetpswd(@RequestParam("originPswd")String originPswd,
                            @RequestParam("newPswd")String newPswd){
        System.out.println(originPswd+"|"+newPswd);
        Subject subject=SecurityUtils.getSubject();
        String email=(String)subject.getPrincipal();
        String res=userService.resetPswd(email,originPswd,newPswd);
        if(res==null){
            return Constant.unknown_error;
        }
        return res;
    }

    private String  generateCardId(String email){
        Random random=new Random();
        StringBuffer sb=new StringBuffer();
        for(int i=0;i<7;i++){
            int number=random.nextInt(62);
            sb.append(Constant.random_string.charAt(number));
        }
        String vid=sb.toString();
        Vip vip=vipService.find(vid);
        if(vip==null){
            vip=new Vip();
            vip.setVid(vid);
            vip.setSignindate(new Date(System.currentTimeMillis()));
            vip.setDiscount(0);
            vip.setMoney(0);
            vip.setScore(0);
            vip.setChargemoney(0);
            vip.setLevel(0);
            vip.setVipstate(Constant.vip_state_not_active);
            vip.setEmail(email);
            vip.setDeadline(new Date(System.currentTimeMillis()));
            String res=vipService.add(vip);
            if(res.equals(Constant.method_exceute_success)){
                return vid;
            }else{
                return generateCardId(email);
            }
        }else{
            return generateCardId(email);
        }
    }

    @RequestMapping("logout")
    public String logout(){
        SecurityUtils.getSubject().logout();
        return "redirect:/login";
    }

}


