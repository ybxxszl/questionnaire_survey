package com.tool;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.methods.GetMethod;

public class HTMLControl {
	
	/**
	 * 生成HTML
	 * @param url 需要转换的访问路径
	 * @param name 转换后的文件名
	 * @return
	 */
    public String getHTML(String address, String fileName, HttpServletRequest request) {
    	
    	System.out.println("转换HTML");
    	System.out.println("需要转换的地址：" + address + " 转换后的文件名：" + fileName);
    	
    	String filePath = request.getSession().getServletContext().getRealPath("") + File.separator;
    	String extension = ".html";
    	
    	String url = filePath + fileName + extension;//保存的文件的全路径
    	
        HttpClient client = new HttpClient();
        GetMethod getMethod = new GetMethod(address);
        
        try {
        	
            client.executeMethod(getMethod);
            
            File file = new File(filePath);
            
            if(!file.exists()) {
            	file.mkdirs();
            }
            
            Writer out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(new File(url)), "UTF-8"));
            
            out.write(getMethod.getResponseBodyAsString());
            
            out.flush();
            
            out.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return url;
        
    }

}
