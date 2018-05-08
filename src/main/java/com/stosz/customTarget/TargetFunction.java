package com.stosz.customTarget;

/**
 * @author liufeng
 * @version [1.0 , 2017/9/14]
 */
public class TargetFunction {

    public static Boolean validatePermission(String keyword){
        if(keyword.equals("123")){
            return true;
        }
        return false;
    }

}
