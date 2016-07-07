package com.dessert.realm;

import com.dessert.model.User;
import com.dessert.service.UserService;
import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;

import javax.annotation.Resource;

/**
 * Created by cristph on 2016/2/18.
 */
public class MyRealm extends AuthorizingRealm {

    @Resource
    private UserService userService;


    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals){
        //获取当前登录的用户名,等价于(String)principals.fromRealm(this.getName()).iterator().next()
        String currentUsername = (String)super.getAvailablePrincipal(principals);
        User user = userService.findByEmail(currentUsername);
        if(user != null){
            String auth=user.getAuth();
            SimpleAuthorizationInfo simpleAuthorInfo = new SimpleAuthorizationInfo();
            simpleAuthorInfo.addRole(auth);

            System.out.println("已为用户["+currentUsername+"]赋予了["+auth+"]角色");
            return simpleAuthorInfo;
        }

        //若该方法什么都不做直接返回null的话,就会导致任何用户访问/admin/listUser.jsp时都会自动跳转到unauthorizedUrl指定的地址
        //详见applicationContext.xml中的<bean id="shiroFilter">的配置
        return null;
    }


    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken) throws AuthenticationException {

        UsernamePasswordToken token = (UsernamePasswordToken)authcToken;
//        System.out.println("验证当前Subject时获取到token为" + ReflectionToStringBuilder.toString(token, ToStringStyle.MULTI_LINE_STYLE));

//        User user = userService.findByEmail(token.getUsername());
//        if(user == null) {
//            throw new UnknownAccountException();//没找到帐号
//        }
//
//        System.out.println("email:"+token.getUsername());
//        System.out.println("pswd:"+String.valueOf(token.getPassword()));
//        user=userService.checkPswd(token.getUsername(),String.valueOf(token.getPassword()));
//        if(user==null){
//            throw new IncorrectCredentialsException();//密码错误
//        }


        String email=token.getUsername();
        String pswd=String.valueOf(token.getPassword());
        boolean sign=userService.login(email,pswd);
        if(!sign){
            throw new UnknownAccountException();//没找到帐号
        }

        AuthenticationInfo authcInfo = new SimpleAuthenticationInfo(email,pswd,this.getName());
//        this.setSession("currentUser",user.getEmail());
//        this.setSession("currentUid",user.getUid());
        return authcInfo;
    }


    private void setSession(Object key, Object value){
        Subject currentUser = SecurityUtils.getSubject();
        if(null != currentUser){
            Session session = currentUser.getSession();
            System.out.println("Session默认超时时间为[" + session.getTimeout() + "]毫秒");
            if(null != session){
                session.setAttribute(key, value);
            }
        }
    }
}
