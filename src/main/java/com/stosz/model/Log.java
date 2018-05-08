package com.stosz.model;

import java.time.LocalDateTime;

/**
 * @author liufeng
 * @version [1.0 , 2017/9/11]
 */
public class Log {
    private Integer id;
    /**
     * 注册对象id
     */
    private Integer register_id;

    private Integer app_id;
    /**
     * 记录日志错误信息
     */
    private String stack;

    private LocalDateTime create_time;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getRegister_id() {
        return register_id;
    }

    public void setRegister_id(Integer register_id) {
        this.register_id = register_id;
    }

    public Integer getApp_id() {
        return app_id;
    }

    public void setApp_id(Integer app_id) {
        this.app_id = app_id;
    }

    public String getStack() {
        return stack;
    }

    public void setStack(String stack) {
        this.stack = stack;
    }

    public LocalDateTime getCreate_time() {
        return create_time;
    }

    public void setCreate_time(LocalDateTime create_time) {
        this.create_time = create_time;
    }

    @Override
    public String toString() {
        return "Log{" +
                "id=" + id +
                ", register_id=" + register_id +
                ", app_id=" + app_id +
                ", stack='" + stack + '\'' +
                ", create_time=" + create_time +
                '}';
    }
}
