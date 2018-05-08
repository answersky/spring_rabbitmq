package com.stosz.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by liuf on 2016/7/9.
 */
@Controller
public class IndexController {
    private static Logger logger = Logger.getLogger(IndexController.class);

    @RequestMapping("index")
    public String index(Model model){
        logger.error("123");
        return "home/index";
    }

    @RequestMapping("element")
    public String element(Model model){
        logger.error("123");
        return "element/element";
    }
}
