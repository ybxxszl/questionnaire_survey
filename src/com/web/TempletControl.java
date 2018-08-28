package com.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.biz.TempletBiz;
import com.vo.DictCheckbox;
import com.vo.DictCheckboxOption;
import com.vo.DictSingle;
import com.vo.DictSingleOption;
import com.vo.DictTemplet;
import com.vo.DictTempletIndex;
import com.vo.DictText;
import com.vo.PageBean;
import com.vo.Sort;

@Controller
public class TempletControl {
	
	@Autowired
	private TempletBiz templetBiz;
	
	/**
	 * 获取模板分类和字典模板
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @param sortId
	 * @param page
	 * @return
	 */
	@RequestMapping(value = "/showTempletList")
	public String showTempletList(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model, String sortId, int page) {
		
		System.out.println("迟来的web:showTempletList请求。。。");
		
		System.out.println("选择分类：" + sortId + "  选择页：" + page);
		
		PageBean pageBean = templetBiz.getPageBean(sortId, page);//获取PageBean
		
		System.out.println("PageBean:" + pageBean.toString());
		
		List<DictTemplet> DictTempletList = templetBiz.getTempletList(pageBean, sortId);//获取内容DictTempletIndexList
		
		System.out.println("DictTempletList:");
		for (DictTemplet d : DictTempletList) {
			System.out.println(d.toString());
		}
		
		List<Sort> SortList = templetBiz.getSortList();//获取问卷调查分类列表
		
		System.out.println("SortList:");
		for (Sort s : SortList) {
			System.out.println(s.toString());
		}
		
		session.setAttribute("PageBean", pageBean);
		session.setAttribute("DictTempletList", DictTempletList);
		session.setAttribute("SortList", SortList);
		session.setAttribute("SortId", sortId);//传回当前分类id
		
		return "showTemplet.jsp";
		
	}
	
	/**
	 * ajax获取模板分类和字典模板
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @param sortId
	 * @param page
	 * @return
	 */
	@RequestMapping(value = "/showTempletList_ajax")
	@ResponseBody
	public List<DictTemplet> showTempletList_ajax(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model, String sortId, int page) {
		
		System.out.println("迟来的web:showTempletList_ajax请求。。。");
		
		System.out.println("ajax选择分类：" + sortId + "  ajax选择页：" + page);
		
		PageBean pageBean = templetBiz.getPageBean(sortId, page);//获取PageBean
		
		System.out.println("PageBean:" + pageBean.toString());
		
		List<DictTemplet> DictTempletList = templetBiz.getTempletList(pageBean, sortId);//获取内容DictTempletIndexList
		
		System.out.println("DictTempletList:");
		for (DictTemplet d : DictTempletList) {
			System.out.println(d.toString());
		}
		
		session.setAttribute("PageBean", pageBean);
		
		return DictTempletList;
		
	}
	
	/**
	 * 展示字典模板内容
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @param dictTempletId
	 * @param dictTempletName
	 * @return
	 */
	@RequestMapping(value = "/showTemplet")
	public String showTemplet(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model, String dictTempletId) {
		
		System.out.println("迟来的web:showTemplet请求。。。");
		
		System.out.println("展示的字典模板ID：" + dictTempletId);
		
		DictTemplet dictTemplet = templetBiz.getDictTemplet(dictTempletId);
		
		String dictTempletName = dictTemplet.getDictTempletName();//获取字典模板名称
		
		System.out.println("展示的字典模板名称：" + dictTempletName);
		
		session.setAttribute("dictTempletName", dictTempletName);
		
		List<DictTempletIndex> dictTempletIndexList = templetBiz.getDictTempletIndexList(dictTempletId);//获取对应ID排序后的模板索引
		
		System.out.println("模板索引：");
		for (DictTempletIndex d : dictTempletIndexList) {
			System.out.println(d.toString());
		}
		
		List<DictSingle> dictSingleList = new ArrayList<DictSingle>();//存储单选题内容
		List<DictCheckbox> dictCheckboxList = new ArrayList<DictCheckbox>();//存储多选题内容
		List<DictText> dictTextList = new ArrayList<DictText>();//存储文本题内容
		
		for (int i = 0; i < dictTempletIndexList.size(); i++) {
			
			int dictTempletIndexSign = dictTempletIndexList.get(i).getDictTempletIndexSign();
			String dictExerciseId = dictTempletIndexList.get(i).getDictExerciseId();
			
			if(dictTempletIndexSign == 1){//判断为单选题
				
				DictSingle dictSingle = templetBiz.getDictSingle(dictExerciseId);//获取单选题内容
				dictSingleList.add(dictSingle);
				
			}
			if(dictTempletIndexSign == 2){//判断为多选题
				
				DictCheckbox dictCheckbox = templetBiz.getDictCheckbox(dictExerciseId);//获取多选题内容
				dictCheckboxList.add(dictCheckbox);
				
			}
			if(dictTempletIndexSign == 3){//判断为文本题
				
				DictText dictText = templetBiz.getDictText(dictExerciseId);//获取文本题内容
				dictTextList.add(dictText);
				
			}
			
		}
		
		if(dictSingleList.size() > 0) {
			System.out.println("共" + dictSingleList.size() + "道单选题，选项分别为：");
			for (DictSingle d : dictSingleList) {
				System.out.println(d.toString());
			}
		}
		
		if(dictCheckboxList.size() > 0) {
			System.out.println("共" + dictCheckboxList.size() + "道多选题，选项分别为：");
			for (DictCheckbox d : dictCheckboxList) {
				System.out.println(d.toString());
			}
		}
		
		if(dictTextList.size() > 0) {
			System.out.println("共" + dictTextList.size() + "道文本题，选项分别为：");
			for (DictText d : dictTextList) {
				System.out.println(d.toString());
			}
		}
		
		session.setAttribute("dictSingleList", dictSingleList);
		session.setAttribute("dictCheckboxList", dictCheckboxList);
		session.setAttribute("dictTextList", dictTextList);
		
		List<DictSingleOption> dictSingleOptionList = new ArrayList<DictSingleOption>();//存储单选题选项内容
		List<DictCheckboxOption> dictCheckboxOptionList = new ArrayList<DictCheckboxOption>();//存储多选题选项内容
		
		for (int i = 0; i < dictSingleList.size(); i++) {
			
			String dictSingleId = dictSingleList.get(i).getDictSingleId();
			
			List<DictSingleOption> list = templetBiz.getDictSingleOption(dictSingleId);
			
			dictSingleOptionList.addAll(list);
			
		}
		
		for (int i = 0; i < dictCheckboxList.size(); i++) {
			
			String dictCheckboxId = dictCheckboxList.get(i).getDictCheckboxId();
			
			List<DictCheckboxOption> list = templetBiz.getDictCheckboxOption(dictCheckboxId);
			
			dictCheckboxOptionList.addAll(list);
			
		}
		
		session.setAttribute("dictSingleOptionList", dictSingleOptionList);
		session.setAttribute("dictCheckboxOptionList", dictCheckboxOptionList);
		
		return "designtempletquestionnaire.jsp";
		
	}
	
	/**
	 * ajax展示字典模板内容
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @param dictTempletId
	 * @param dictTempletName
	 * @return
	 */
	@RequestMapping(value = "/showTemplet_ajax")
	@ResponseBody
	public JSONArray showTemplet_ajax(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model, String dictTempletId) {
		
		System.out.println("迟来的web:showTemplet请求。。。");
		
		System.out.println("展示的字典模板ID：" + dictTempletId);
		
		DictTemplet dictTemplet = templetBiz.getDictTemplet(dictTempletId);
		
		String dictTempletName = dictTemplet.getDictTempletName();//获取字典模板名称
		
		System.out.println("展示的字典模板名称：" + dictTempletName);
		
//		session.setAttribute("dictTempletName", dictTempletName);
		
		List<DictTempletIndex> dictTempletIndexList = templetBiz.getDictTempletIndexList(dictTempletId);//获取对应ID排序后的模板索引
		
		System.out.println("模板索引：");
		for (DictTempletIndex d : dictTempletIndexList) {
			System.out.println(d.toString());
		}
		
		List<DictSingle> dictSingleList = new ArrayList<DictSingle>();//存储单选题内容
		List<DictCheckbox> dictCheckboxList = new ArrayList<DictCheckbox>();//存储多选题内容
		List<DictText> dictTextList = new ArrayList<DictText>();//存储文本题内容
		
		for (int i = 0; i < dictTempletIndexList.size(); i++) {
			
			int DictTempletIndexSign = dictTempletIndexList.get(i).getDictTempletIndexSign();
			String dictExerciseId = dictTempletIndexList.get(i).getDictExerciseId();
			
			if(DictTempletIndexSign == 1){//判断为单选题
				
				DictSingle dictSingle = templetBiz.getDictSingle(dictExerciseId);//获取单选题内容
				dictSingleList.add(dictSingle);
				
			}
			if(DictTempletIndexSign == 2){//判断为多选题
				
				DictCheckbox dictCheckbox = templetBiz.getDictCheckbox(dictExerciseId);//获取多选题内容
				dictCheckboxList.add(dictCheckbox);
				
			}
			if(DictTempletIndexSign == 3){//判断为文本题
				
				DictText dictText = templetBiz.getDictText(dictExerciseId);//获取文本题内容
				dictTextList.add(dictText);
				
			}
			
		}
		
		if(dictSingleList.size() > 0) {
			System.out.println("共" + dictSingleList.size() + "道单选题，选项分别为：");
			for (DictSingle d : dictSingleList) {
				System.out.println(d.toString());
			}
		}
		
		if(dictCheckboxList.size() > 0) {
			System.out.println("共" + dictCheckboxList.size() + "道多选题，选项分别为：");
			for (DictCheckbox d : dictCheckboxList) {
				System.out.println(d.toString());
			}
		}
		
		if(dictTextList.size() > 0) {
			System.out.println("共" + dictTextList.size() + "道文本题，选项分别为：");
			for (DictText d : dictTextList) {
				System.out.println(d.toString());
			}
		}
		
//		session.setAttribute("dictSingleList", dictSingleList);
//		session.setAttribute("dictCheckboxList", dictCheckboxList);
//		session.setAttribute("dictTextList", dictTextList);
		
		List<DictSingleOption> dictSingleOptionList = new ArrayList<DictSingleOption>();//存储单选题选项内容
		List<DictCheckboxOption> dictCheckboxOptionList = new ArrayList<DictCheckboxOption>();//存储多选题选项内容
		
		for (int i = 0; i < dictSingleList.size(); i++) {
			
			String dictSingleId = dictSingleList.get(i).getDictSingleId();
			
			List<DictSingleOption> list = templetBiz.getDictSingleOption(dictSingleId);
			
			dictSingleOptionList.addAll(list);
			
		}
		
		for (int i = 0; i < dictCheckboxList.size(); i++) {
			
			String dictCheckboxId = dictCheckboxList.get(i).getDictCheckboxId();
			
			List<DictCheckboxOption> list = templetBiz.getDictCheckboxOption(dictCheckboxId);
			
			dictCheckboxOptionList.addAll(list);
			
		}
		
//		session.setAttribute("dictSingleOptionList", dictSingleOptionList);
//		session.setAttribute("dictCheckboxOptionList", dictCheckboxOptionList);
		
		JSONArray jsonArray = new JSONArray();//问卷
		
		JSONObject jsonObject = new JSONObject();;//问卷选项
		
		int n = 1;
		
		for (int i = 0; i < dictSingleList.size(); i++) {
			
			jsonObject.put("option", n++ + "、" + dictSingleList.get(i).getDictSingleContent());//添加单个JSON对象
			
			jsonArray.add(jsonObject);//添加JSON字符串
			
		}
		
		for (int i = 0; i < dictCheckboxList.size(); i++) {
			
			jsonObject.put("option", n++ + "、" + dictCheckboxList.get(i).getDictCheckboxContent());//添加单个JSON对象
			
			jsonArray.add(jsonObject);//添加JSON字符串
			
		}
		
		for (int i = 0; i < dictTextList.size(); i++) {
			
			jsonObject.put("option", n++ + "、" + dictTextList.get(i).getDictTextContent());//添加单个JSON对象
			
			jsonArray.add(jsonObject);//添加JSON字符串
			
		}
		
		System.out.println("JSON问卷：" + jsonArray.toString());
		
		return jsonArray;
		
	}
	
	/**
	 * 为ajax分页获取分类列表
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/getSort")
	public String showSort(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model) {
		
		System.out.println("迟来的web:getSort请求。。。");
		
		List<Sort> list = templetBiz.getSort();
		
		session.setAttribute("sort", list);
		
		return "showtemplet.jsp";
		
	}
	
	/**
	 * 为ajax分页获取分页的总页数
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @param sortId
	 * @return
	 */
	@RequestMapping(value = "/getPaging")
	@ResponseBody
	public int getPaging(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model, String sortId) {
		
		System.out.println("迟来的web:getPaging请求。。。");
		
		int totalPage = templetBiz.getPaging(sortId);
		
		return totalPage;
		
	}
	
	/**
	 * 为ajax分页获取分页的内容
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @param sortId
	 * @param page
	 * @return
	 */
	@RequestMapping(value = "/getPage")
	@ResponseBody
	public List<DictTemplet> getPage(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model, String sortId, int page) {
		
		System.out.println("迟来的web:getPage请求。。。");
		
		List<DictTemplet> list = templetBiz.getPage(sortId, page);
		
		return list;
		
	}

}
