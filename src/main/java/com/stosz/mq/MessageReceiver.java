package com.stosz.mq;

import org.springframework.amqp.core.Message;
import org.springframework.amqp.core.MessageListener;

import javax.annotation.Resource;

/**
 * @author liufeng
 * @version [1.0 , 2017/9/30]
 */
public class MessageReceiver implements MessageListener{

    @Override
    public void onMessage(Message message) {
        System.out.println("收到消息："+message);
        System.out.println("收到消息："+new String(message.getBody()));
        System.out.println("收到消息："+message.getMessageProperties());
    }
}
