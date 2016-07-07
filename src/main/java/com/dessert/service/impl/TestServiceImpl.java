package com.dessert.service.impl;

import com.dessert.dao.TestDao;
import com.dessert.service.TestService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by cristph on 2016/6/5.
 */
@Service("Test")
public class TestServiceImpl implements TestService {

    @Resource
    TestDao testDao;

    public String getRecord(){
        return testDao.getRecord();
    }
}
