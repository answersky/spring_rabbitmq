package com.stosz.mq;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

import static org.junit.Assert.*;

/**
 * @author liufeng
 * @version [1.0 , 2017/9/30]
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:config/application.xml"})
public class MessageProducerTest {
    @Resource
    private MessageProducer messageProducer;

    @Test
    public void sendMessage() throws Exception {
        messageProducer.sendMessage("hello ,i am a new user");
    }

}