package com.dessert.controller;

import com.dessert.service.OLAPService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import javax.annotation.Resource;
import javax.xml.ws.Response;

/**
 * Created by cristph on 2016/6/9.
 */

@Controller
public class OLAPController {

    @Resource
    OLAPService olapService;

    @RequestMapping("managerOLAP")
    public String getManagerOLAPView(){
        return "bi/managerOLAP";
    }

    @RequestMapping("multipleAnalysis")
    public String getMultipleAnalysisView(){
        return "bi/multipleAnalysis";
    }

    @ResponseBody
    @RequestMapping(value="/multipleAnalysisData")
    public String getMultipleAnalysisData(@RequestParam("pro")String pro){
        String str=olapService.getMutipleAnalysisData();
//        System.out.println(str);
        return str;
    }

    @ResponseBody
    @RequestMapping("/historyData")
    public String getHistoryData(){
        String str=olapService.getHistoryData();
//        System.out.println(str);
        return str;
    }

    @ResponseBody
    @RequestMapping("/historyOnlineData")
    public String getHistoryOnlineData(){
        String str=olapService.getOnlineHistoryData();
//        System.out.println(str);
        return str;
    }

    @RequestMapping("/compareAnalysis")
    public String getCompareAnalysis(){
        return "bi/compareAnalysis";
    }

    @ResponseBody
    @RequestMapping("/applyHistogramSetting")
    public String applyHistogramSetting(@RequestParam("measureValue")String measureValue,
                                        @RequestParam("compareValue")String compareValue){
        String str=olapService.getHistogramData(measureValue,compareValue);
//        System.out.println(str);
        return str;
    }

    @ResponseBody
    @RequestMapping("/applyMultipleHistogramSetting")
    public String applyMultipleHistogramSetting(@RequestParam("measureValue")String measureValue,
                                                @RequestParam("compareValue")String compareValue,
                                                    @RequestParam("CompareCategory1")String CompareCategory1,
                                                @RequestParam("CompareCategory2")String CompareCategory2){
        String str=olapService.getMultipleHistogramSetting(measureValue,compareValue,CompareCategory1,CompareCategory2);
//        System.out.println(str);
        return str;
    }


    @ResponseBody
    @RequestMapping("/getPieData")
    public String getPieData(@RequestParam("inner")String inner,
                             @RequestParam("outer")String outer,
                             @RequestParam("measureValue")String measureValue){
        String str=olapService.getPieData(inner,outer,measureValue);
//        System.out.println(str);
        return str;
    }

    @RequestMapping("/getRFM")
    public String getRFMView(){
        return "bi/customerAnalysis";
    }

    @ResponseBody
    @RequestMapping("/getRFMData")
    public String getRFMData(){
        String str=olapService.getRFMPieData("");
//        System.out.println(str);
        return str;
    }

    @ResponseBody
    @RequestMapping("/getGridData")
    public String getGridData(@RequestParam("category")String category){
        String str=olapService.getGridData(category);
//        System.out.println(str);
        return str;
    }

    @ResponseBody
    @RequestMapping("/getCategoryData")
    public String getCategoryData(){
        String str=olapService.getCategoryData();
        return str;
    }

    @ResponseBody
    @RequestMapping("/getSelectedData")
    public String getSelectedData(@RequestParam("customer")String customer){
        String str=olapService.getSelectedData(customer);
        return str;
    }

    @ResponseBody
    @RequestMapping("/getPlanHistogramData")
    public String getPlanHistogramData(@RequestParam("timeinterval")String timeinterval,
                                       @RequestParam("measure")String measure){
        String str=olapService.getPlanHistogramData(timeinterval,measure);
//        System.out.println(str);
        return str;
    }

    @ResponseBody
    @RequestMapping("/getPredicateData")
    public String getPredicateData(@RequestParam("good")String good){
        String str=olapService.getGoodPredicate(good);
        return str;
    }

    @RequestMapping("/saleManageView")
    public String getSaleManageData(){
        return "bi/SaleManage";
    }

    @ResponseBody
    @RequestMapping("/saleManage")
    public String getSaleManageData(@RequestParam("confidence")double confidence,
                                    @RequestParam("rulesNum")int rulesNum){
        long a=System.currentTimeMillis();
        String str=olapService.getAprioriData("C:/Users/cristph/Desktop/Apriori_"+a+".arff",confidence,rulesNum);
        return str;
    }

    @ResponseBody
    @RequestMapping("/getClusterData")
    public String getClusterData(@RequestParam("seed")int seed,
                                 @RequestParam("clusterNum")int clusterNum){
        long a=System.currentTimeMillis();
        String str=olapService.getClusterData("C:/Users/cristph/Desktop/Kmeans_"+a+".arff",seed,clusterNum);
        return str;
    }
}
