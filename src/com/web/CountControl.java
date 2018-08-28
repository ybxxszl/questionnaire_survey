package com.web;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.biz.CountBiz;

import net.sf.json.JSONArray;

@Controller
public class CountControl {
	
	@Autowired
	private CountBiz countBiz;
	
//	@RequestMapping(value = "/countQuestionnaire")
//	public void countQuestionnaire(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model, String designTempletId) {
//
//		System.out.println("迟来的web:countQuestionnaire请求。。。");
//
//		System.out.println("提交的问卷ID：" + designTempletId);
//		
//		DesignTemplet designTemplet = questionnaireBiz.getDesignTemplet(designTempletId);
//		
//		if(designTemplet.getState() == 2 || designTemplet.getState() == 3) {
//			
//			System.out.println("问卷调查结果将被记录");
//			
//			List<DesignTempletIndex> designTempletIndexList = questionnaireBiz.getDesignTempletIndexList(designTempletId);// 获取对应ID排序后的问卷索引
//
//			//调用方法统计
//			for (DesignTempletIndex designTempletIndex : designTempletIndexList) {
//				
//				if(designTempletIndex.getDesignTempletIndexSign() == 1) {
//					
//					String designSingleOptionId = request.getParameter("single-" + designTempletIndex.getDesignExerciseId());//统计单选答案
//					
//					countBiz.countSingleAnswer(designSingleOptionId);
//					
//				}
//				
//				if(designTempletIndex.getDesignTempletIndexSign() == 2) {
//					
//					String designCheckboxOptionId = request.getParameter("checkbox-" + designTempletIndex.getDesignExerciseId());//统计多选答案
//					
//					countBiz.countCheckboxAnswer(designCheckboxOptionId);
//					
//				}
//				
//				if(designTempletIndex.getDesignTempletIndexSign() == 3) {
//					
//					String textAnswerContent = request.getParameter("text-" + designTempletIndex.getDesignExerciseId());//增加文本答案
//					
//					countBiz.addTextAnswer(designTempletIndex.getDesignExerciseId(), textAnswerContent);
//					
//				}
//				
//			}
//			
//		} else {
//			
//			System.out.println("问卷调查结果将被遗弃，由于问卷状态为结束回收状态！！！");
//			
//		}
//
//	}
	
	@RequestMapping(value = "/countQuestionnaire")
	public void countQuestionnaire(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model, String [] single, String [] checkbox, String text) {

		System.out.println("迟来的web:countQuestionnaire请求。。。");
		
//		System.out.println("single:");
		for (String s : single) {
//			System.out.println(s.toString());
			countBiz.countSingleAnswer(s.toString());
		}
//		System.out.println("checkbox:");
		for (String s : checkbox) {
//			System.out.println(s.toString());
			countBiz.countCheckboxAnswer(s.toString());
		}
		

		try {
			JSONArray array = JSONArray.fromObject(URLDecoder.decode(text, "UTF-8"));//JSON解析
//			System.out.println("text:");
			for (int i = 0; i < array.size(); i++) {
				System.out.println("key:" + array.getJSONObject(i).getString("key"));
				System.out.println("value:" + array.getJSONObject(i).getString("value"));
				countBiz.addTextAnswer(array.getJSONObject(i).getString("key"), array.getJSONObject(i).getString("value"));
			}
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			System.out.println("不支持的编码异常");
			e.printStackTrace();
		}

	}

}
