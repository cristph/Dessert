package com.dessert.model;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Date;

/**
 * Created by cristph on 2016/2/16.
 */

@Table(name="user")
@Entity
public class User implements Serializable{

    @Id
    private int uid;
    private String email;
    private String username;
    private String password;
    private String auth;
    private int sex; // 默认0为未知；1表示男，2表示女
    private Date birth;
    private String address;
    private String vid;
    private String selfintro;
    private String contact;

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAuth() {
        return auth;
    }

    public void setAuth(String auth) {
        this.auth = auth;
    }

    public Date getBirth() {
        return birth;
    }

    public void setBirth(Date birth) {
        this.birth = birth;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getVid() {
        return vid;
    }

    public void setVid(String vid) {
        this.vid = vid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getSex() {
        return sex;
    }

    public void setSex(int sex) {
        this.sex = sex;
    }

    public String getSelfintro() {
        return selfintro;
    }

    public void setSelfintro(String selfintro) {
        this.selfintro = selfintro;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    @Override
    public String toString() {
        return "User [ \nemail : " + this.email + "\nusername : " + this.username
                + "\npassword : " + this.password + "\nauth : " + this.auth+ "\nvid : " + this.vid
                + " ]";
    }
}
