package com.stosz.service;

/**
 * @author liufeng
 * @version [1.0 , 2017/9/11]
 */
public interface IRegisterInfoService {
    /**
     * 注册对象
     * @param source_app
     * @param object_type
     * @param object_id
     * @return
     */
    int registerObj(String source_app,String object_type,Integer object_id);
}
