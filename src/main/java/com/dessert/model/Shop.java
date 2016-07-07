package com.dessert.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.sql.Date;

/**
 * Created by cristph on 2016/3/17.
 */

@Entity
@Table(name = "shop")
public class Shop {

    @Id
    private int shopid;
    private String shopname;
    private String shopauth;
    private String contact;
    private String address;
    private Date opendate;
    private String shoppic;

    public int getShopid() {
        return shopid;
    }

    public void setShopid(int shopid) {
        this.shopid = shopid;
    }

    public String getShopname() {
        return shopname;
    }

    public void setShopname(String shopname) {
        this.shopname = shopname;
    }

    public String getShopauth() {
        return shopauth;
    }

    public void setShopauth(String shopauth) {
        this.shopauth = shopauth;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getOpendate() {
        return opendate;
    }

    public void setOpendate(Date opendate) {
        this.opendate = opendate;
    }

    public String getShoppic() {
        return shoppic;
    }

    public void setShoppic(String shoppic) {
        this.shoppic = shoppic;
    }
}
