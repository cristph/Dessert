package com.dessert.controller;

import com.dessert.dao.OLAPDao;
import com.dessert.model.RFM;
import com.dessert.model.Shop;
import com.dessert.service.OLAPService;
import com.dessert.service.ShopService;
import com.dessert.service.TestService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by cristph on 2016/6/5.
 */
@Controller
public class TestController {

    @Resource
    TestService testService;

    @Resource
    ShopService shopService;

    @Resource
    OLAPService olapService;

    @Resource
    OLAPDao olapDao;

    @RequestMapping("ar")
    public String getar(){
        String str=olapDao.getAprioriData("C:/Users/cristph/Desktop/test.arff",0.7,20);
        System.out.print(str);
        return "";
    }

//    @RequestMapping("tr")
//    public String gettr(){
//        String str=olapDao.getClusterData("C:/Users/cristph/Desktop/test_t.arff",4);
//        System.out.print(str);
//        return "";
//    }

    @RequestMapping("/kk")
    public String getKK(){
        String str=olapDao.getGoodPredicate("AKf_Cake");
        System.out.println(str);
        return "";
    }

    @RequestMapping("/ww")
    public String ww(){
        olapDao.writeData();
        return "";
    }

    @RequestMapping("/rfm")
    public String rfmTest(){
        ArrayList<ArrayList<RFM>> arrayLists=olapDao.generateRFM();
        for(ArrayList<RFM> list:arrayLists){
            String str=cal(list);
            System.out.println(list.get(0).getDescription()+","+str);
        }
        return "";
    }

    private String cal(ArrayList<RFM> list){
        int days=0;
        int times=0;
        double money=0;
        for (RFM rfm:list){
            days+=rfm.getDays();
            times+=rfm.getTimes();
            money+=rfm.getMoney();
        }
        int size=list.size();
        double avgDays=(double)days/size;
        double avgTimes=(double)times/size;
        double avgMoney=money/size;
        String str="size:"+size+"\ndays:"+days+",times:"+times+"money:"+money+"\navgDays:"+avgDays+",avgTimes:"+avgTimes+"avgMoney:"+avgMoney;
        return str;
    }

    @RequestMapping("/test")
    public String test(Model model){
        String tmp= testService.getRecord();
        System.out.println("get A Producct:"+tmp);

        List<Shop> list=shopService.getShops();
        model.addAttribute("list",list);
        return "shop/shoplist";
    }
}
