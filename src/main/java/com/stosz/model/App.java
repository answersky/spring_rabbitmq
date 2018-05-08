package com.stosz.model;

/**
 * @author liufeng
 * @version [1.0 , 2017/9/11]
 */
public class App {
    private String name;
    private String host;
    private String object_type;
    private String url;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getHost() {
        return host;
    }

    public void setHost(String host) {
        this.host = host;
    }

    public String getObject_type() {
        return object_type;
    }

    public void setObject_type(String object_type) {
        this.object_type = object_type;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    @Override
    public String toString() {
        return "App{" +
                "name='" + name + '\'' +
                ", host='" + host + '\'' +
                ", object_type='" + object_type + '\'' +
                ", url='" + url + '\'' +
                '}';
    }
}
