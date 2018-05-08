package com.stosz.mq;

import org.springframework.amqp.core.AmqpTemplate;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @author liufeng
 * @version [1.0 , 2017/9/30]
 */
@Service
public class MessageProducer {

    @Resource(name = "myAmqpTemplate")
    private AmqpTemplate amqpTemplate;

    public void sendMessage(Object message){
        amqpTemplate.convertAndSend("hello",message);
    }

}
