package com.stosz.model;

import java.time.LocalDateTime;
import java.util.Date;

/**
 * @author liufeng
 * @version [1.0 , 2017/9/11]
 * 同步中心注册对象
 */
public class RegisterInfo {
    private Integer id;
    /**
     * 注册的app
     */
    private String source_app;

    /**
     * 注册app中的对象
     */
    private String object_type;

    /**
     * 注册对象的id
     */
    private Integer object_id;

    /**
     * 当前注册对象的状态
     */
    private String state;

    /**
     * 时间
     */
    private Date state_time;

    /**
     * 其他app向同步中心获取对象信息失败的次数
     */
    private Integer fetch_count;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSource_app() {
        return source_app;
    }

    public void setSource_app(String source_app) {
        this.source_app = source_app;
    }

    public String getObject_type() {
        return object_type;
    }

    public void setObject_type(String object_type) {
        this.object_type = object_type;
    }

    public Integer getObject_id() {
        return object_id;
    }

    public void setObject_id(Integer object_id) {
        this.object_id = object_id;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public Date getState_time() {
        return state_time;
    }

    public void setState_time(Date state_time) {
        this.state_time = state_time;
    }

    public Integer getFetch_count() {
        return fetch_count;
    }

    public void setFetch_count(Integer fetch_count) {
        this.fetch_count = fetch_count;
    }

    @Override
    public String toString() {
        return "RegisterInfo{" +
                "id=" + id +
                ", source_app='" + source_app + '\'' +
                ", object_type='" + object_type + '\'' +
                ", object_id=" + object_id +
                ", state='" + state + '\'' +
                ", state_time=" + state_time +
                ", fetch_count=" + fetch_count +
                '}';
    }
}
