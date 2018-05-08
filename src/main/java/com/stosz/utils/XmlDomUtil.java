package com.stosz.utils;

import com.stosz.model.App;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * @author liufeng
 * @version [1.0 , 2017/9/11]
 * 解析xml
 */
public class XmlDomUtil {
    public static void main(String[] args) {
        Map<String,String> map=findHostAndUrl("erp","productZone");
        System.out.println(map);
    }

    public static List<App> loadXmlInfo(){
        List<App> xmlInfos=new ArrayList<>();
        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
        try {
            File f = new File(XmlDomUtil.class.getResource("/config/app.xml").getFile());
            System.out.println(f.getPath());
            DocumentBuilder db = dbf.newDocumentBuilder();
            Document document = db.parse(f.getPath());
            NodeList appList = document.getElementsByTagName("app");
            for(int i=0;i<appList.getLength();i++){
                App app=new App();
                Node node=appList.item(i);
                NodeList attrs = node.getChildNodes();
                for(int j=0;j<attrs.getLength();j++){
                    if(attrs.item(j) instanceof Element){
                        String key=attrs.item(j).getNodeName();
                        String value=attrs.item(j).getTextContent();
                        if("name".equals(key)){
                            app.setName(value);
                        }
                        if("host".equals(key)){
                            app.setHost(value);
                        }
                        if("items".equals(key)){
                            NodeList items=attrs.item(j).getChildNodes();
                            findItems(app,items);
                        }
                    }
                }
                xmlInfos.add(app);
            }
        } catch (ParserConfigurationException e) {
            e.printStackTrace();
        } catch (SAXException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return xmlInfos;
    }

    private static void findItems(App app,NodeList nodeList){
        for(int k=0;k<nodeList.getLength();k++){
            NodeList attrs = nodeList.item(k).getChildNodes();
            for(int j=0;j<attrs.getLength();j++){
                if(attrs.item(j) instanceof Element){
                    String key=attrs.item(j).getNodeName();
                    String value=attrs.item(j).getTextContent();
                    if("object_type".equals(key)){
                        app.setObject_type(value);
                    }
                    if("url".equals(key)){
                        app.setUrl(value);
                    }
                }
            }
        }
    }

    public static Map<String,String> findHostAndUrl(String appName,String object_type){
        List<App> appList=loadXmlInfo();
        Map<String,String> map=new LinkedHashMap<>();
        if(appList.size()>0){
            for(App app:appList){
                String name=app.getName();
                String obj=app.getObject_type();
                if(appName.equals(name)){
                    map.put("host",app.getHost());
                    if(object_type.equals(obj)){
                        map.put("url",app.getUrl());
                    }
                }
            }
        }
        return map;
    }
}
