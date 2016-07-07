package com.dessert.controller;

import com.dessert.model.Pager;
import com.dessert.util.ExportUtils;
import com.dessert.util.PagerPropertyUtils;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by cristph on 2016/6/13.
 */

@Controller
@RequestMapping("/grid")
public class ExportController {

    /**
     * 执行导出
     * @param gridPager Pager对象
     * @param request 请求对象
     * @param response 响应对象
     * @throws Exception
     */
    @RequestMapping(value="/export", method= RequestMethod.POST)
    public void export(String gridPager, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Pager pager = PagerPropertyUtils.copy(JSONObject.fromObject(gridPager));
        ExportUtils.export(request, response, pager);
    }
}
