package com.stosz.mapper;

import com.stosz.model.RegisterInfo;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.util.Assert;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * @author liufeng
 * @version [1.0 , 2017/9/11]
 */
@Repository
public class RegisterInfoMapper {
    @Resource
    private JdbcTemplate jdbcTemplate;

    //新增注册对象
    public int insert(RegisterInfo registerInfo){
        Assert.notNull(registerInfo, "registerInfo is null");
        int num=jdbcTemplate.update("insert into register_info (source_app,object_type,object_id,state,state_time) VALUES (?,?,?,?,?)"
                ,registerInfo.getSource_app(),registerInfo.getObject_type(),registerInfo.getObject_id(),"1",new Date());
        return num;
    }

    //修改
    public int update(RegisterInfo registerInfo){
        Assert.notNull(registerInfo, "registerInfo is null");
        int num=jdbcTemplate.update("update register_info set state=?,state_time=? where id=?",registerInfo.getState(),new Date(),registerInfo.getId());
        return num;
    }

    //查询
    public List<RegisterInfo> findRegisterInfos(String source_app,String object_type,String state,int limit){
        List<RegisterInfo> registerInfos=jdbcTemplate.query("select * from register_info where source_app=? and object_type=? and (state=? or state=?) limit ?",new Object[]{source_app,object_type,state,"-"+state,limit},new BeanPropertyRowMapper(RegisterInfo.class));
        return registerInfos;
    }

}
