package com.format;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.core.convert.converter.Converter;

public class DataConvert implements Converter<String, Date>{

	@Override
	public Date convert(String time) {
		
		Date date = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		try {
			if(time != null && time != ""){
				date = sdf.parse(time);
			}
		} catch (ParseException e) {
			System.out.println("日期转换异常");
			e.printStackTrace();
		}
		
		return date;
		
	}

}
