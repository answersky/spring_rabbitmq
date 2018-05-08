package com.stosz.mapper;

import com.stosz.model.RegisterInfo;
import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

import java.util.List;

import static org.junit.Assert.*;

/**
 * @author liufeng
 * @version [1.0 , 2017/9/11]
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:config/application.xml"})
public class RegisterInfoMapperTest {
    @Resource
    private RegisterInfoMapper registerInfoMapper;

    @Test
    public void insert() throws Exception {
        RegisterInfo registerInfo=new RegisterInfo();
        registerInfo.setSource_app("pc");
        registerInfo.setObject_type("productZone");
        registerInfo.setObject_id(1);
        int i=registerInfoMapper.insert(registerInfo);
        System.out.println("插入状态："+i);
    }

    @Test
    public void update() throws Exception {
        RegisterInfo registerInfo=new RegisterInfo();
        registerInfo.setId(1);
        registerInfo.setState("-1");
        int i=registerInfoMapper.update(registerInfo);
        System.out.println("修改状态："+i);
    }

    @Test
    public void findRegisterInfos() throws Exception {
        List<RegisterInfo> list=registerInfoMapper.findRegisterInfos("pc","product","1",10);
        System.out.println(list);
    }

}