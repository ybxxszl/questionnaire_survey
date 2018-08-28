package com.biz.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.biz.QuestionnaireBiz;
import com.dao.DesignCheckboxMapper;
import com.dao.DesignCheckboxOptionMapper;
import com.dao.DesignSingleMapper;
import com.dao.DesignSingleOptionMapper;
import com.dao.DesignTempletIndexMapper;
import com.dao.DesignTempletMapper;
import com.dao.DesignTextMapper;
import com.tool.HTMLControl;
import com.vo.DesignCheckbox;
import com.vo.DesignCheckboxOption;
import com.vo.DesignSingle;
import com.vo.DesignSingleOption;
import com.vo.DesignTemplet;
import com.vo.DesignTempletIndex;
import com.vo.DesignText;
import com.vo.PageBean;

@Service
public class QuestionnaireBizimpl implements QuestionnaireBiz {

	@Autowired
	private DesignTempletMapper designTempletMapper;
	
	@Autowired
	private DesignTempletIndexMapper designTempletIndexMapper;
	
	@Autowired
	private DesignSingleMapper designSingleMapper;
	
	@Autowired
	private DesignSingleOptionMapper designSingleOptionMapper;
	
	@Autowired
	private DesignCheckboxMapper designCheckboxMapper;
	
	@Autowired
	private DesignCheckboxOptionMapper designCheckboxOptionMapper;
	
	@Autowired
	private DesignTextMapper designTextMapper;
	
	private HTMLControl htmlControl = new HTMLControl();
	
	private DesignTemplet designTemplet = new DesignTemplet();
	private DesignTempletIndex designTempletIndex = new DesignTempletIndex();
	private DesignSingle designSingle = new DesignSingle();
	private DesignSingleOption designSingleOption = new DesignSingleOption();
	private DesignCheckbox designCheckbox = new DesignCheckbox();
	private DesignCheckboxOption designCheckboxOption = new DesignCheckboxOption();
	private DesignText designText = new DesignText();
	
	/**
	 * 存储设计模板
	 */
	@Override
	public void insertQuestionnaire(
			String userId,
			String designTempletName,
			String[] single_question,
			String[] single_answer_A, String[] single_answer_B,
			String[] single_answer_C, String[] single_answer_D,
			String[] check_question,
			String[] check_answer_A, String[] check_answer_B,
			String[] check_answer_C, String[] check_answer_D,
			String[] check_answer_E, String[] check_answer_F,
			String[] text_question
	) {
		// TODO Auto-generated method stub
		System.out.println("迟来的biz:insertQuestionnaire请求。。。");
		
		Date date = new Date();
		
		String designTempletId = getUUID();
		
		designTemplet.setDesignTempletId(designTempletId);
		designTemplet.setDesignTempletName(designTempletName);
		designTemplet.setState(1);
		designTemplet.setFinishTime(date);
		designTemplet.setUserId(userId);
		
		designTempletMapper.insert(designTemplet);//存储设计问卷表
		
		
		for (int i = 1; i < single_question.length; i++) {
			
			String designSingleId = getUUID();
			String designSingleContent = single_question[i];
			
			designSingle.setDesignSingleId(designSingleId);
			designSingle.setDesignSingleContent(designSingleContent);
			
			designSingleMapper.insert(designSingle);//存储设计单选表
			
			
			if(!single_answer_A[i].equals("-")) {
				
				insertDesignSingleOption(1, designSingleId, single_answer_A[i]);
				
			}
			
			if(!single_answer_B[i].equals("-")) {
				
				insertDesignSingleOption(2, designSingleId, single_answer_B[i]);
				
			}
			
			if(!single_answer_C[i].equals("-")) {
				
				insertDesignSingleOption(3, designSingleId, single_answer_C[i]);
				
			}
			
			if(!single_answer_D[i].equals("-")) {
				
				insertDesignSingleOption(4, designSingleId, single_answer_D[i]);
				
			}
			
			
			insertDesignTempletIndex(1, i, designTempletId, designSingleId);
			
		}
		
		System.out.println("单选题存储完成");
		
		
		
		
		for (int i = 1; i < check_question.length; i++) {
			
			String designCheckboxId = getUUID();
			String designCheckboxContent = check_question[i];
			
			designCheckbox.setDesignCheckboxId(designCheckboxId);
			designCheckbox.setDesignCheckboxContent(designCheckboxContent);
			
			designCheckboxMapper.insert(designCheckbox);//存设计多选表
			
			
			if(!check_answer_A[i].equals("-")) {
				
				insertDesignCheckboxOption(1, designCheckboxId, check_answer_A[i]);
				
			}
			
			if(!check_answer_B[i].equals("-")) {
							
				insertDesignCheckboxOption(2, designCheckboxId, check_answer_B[i]);
				
			}
						
			if(!check_answer_C[i].equals("-")) {
				
				insertDesignCheckboxOption(3, designCheckboxId, check_answer_C[i]);
				
			}
			
			if(!check_answer_D[i].equals("-")) {
				
				insertDesignCheckboxOption(4, designCheckboxId, check_answer_D[i]);
				
			}
			
			if(!check_answer_E[i].equals("-")) {
				
				insertDesignCheckboxOption(5, designCheckboxId, check_answer_E[i]);
				
			}
			
			if(!check_answer_F[i].equals("-")) {
				
				insertDesignCheckboxOption(6, designCheckboxId, check_answer_F[i]);
				
			}
			
			
			insertDesignTempletIndex(2, i, designTempletId, designCheckboxId);
			
		}
		
		System.out.println("多选题存储完成");
		
		
		
		
		for (int i = 1; i < text_question.length; i++) {
			
			String designTextId = getUUID();
			String designTextContent = text_question[i];
			
			designText.setDesignTextId(designTextId);
			designText.setDesignTextContent(designTextContent);
			
			designTextMapper.insert(designText);//存储设计文本表
			
			
			insertDesignTempletIndex(3, i, designTempletId, designTextId);
			
		}
		
		System.out.println("文本题存储完成");
		
	}


	private void insertDesignSingleOption(int designSingleOrder, String designSingleId, String designSingleOptionContent) {
		// TODO Auto-generated method stub
		designSingleOption.setDesignSingleOptionId(getUUID());
		designSingleOption.setDesignSingleId(designSingleId);
		designSingleOption.setDesignSingleOrder(designSingleOrder);
		designSingleOption.setDesignSingleOptionContent(designSingleOptionContent);
		
		designSingleOptionMapper.insert(designSingleOption);
		
	}//存储字典单选选项表
	
	
	private void insertDesignCheckboxOption(int designCheckboxOrder, String designCheckboxId, String designCheckboxOptionContent) {
		// TODO Auto-generated method stub
		designCheckboxOption.setDesignCheckboxOptionId(getUUID());
		designCheckboxOption.setDesignCheckboxId(designCheckboxId);
		designCheckboxOption.setDesignCheckboxOrder(designCheckboxOrder);
		designCheckboxOption.setDesignCheckboxOptionContent(designCheckboxOptionContent);
		
		designCheckboxOptionMapper.insert(designCheckboxOption);
		
	}//存储字典多选选项表
	
	
	private void insertDesignTempletIndex(int designTempletIndexSign, int designTempletIndexOrder, String designTempletId, String designExerciseId) {
		// TODO Auto-generated method stub
		designTempletIndex.setDesignTempletIndexId(getUUID());
		designTempletIndex.setDesignTempletIndexSign(designTempletIndexSign);
		designTempletIndex.setDesignTempletIndexOrder(designTempletIndexOrder);
		designTempletIndex.setDesignTempletId(designTempletId);
		designTempletIndex.setDesignExerciseId(designExerciseId);
		
		designTempletIndexMapper.insert(designTempletIndex);
		
	}//存储字典模板索引表
	
	public String getUUID() {
		
		UUID uuid = UUID.randomUUID();//获取UUID
		String temp = uuid.toString();
		
		return temp;
		
	}//获取字符串类型的UUID
	
	/**
	 * 获取PageBean
	 */
	@Override
	public PageBean getPageBean(String userId, int page) {
		// TODO Auto-generated method stub
		System.out.println("迟来的biz:getPageBean请求。。。");
		
		com.vo.DesignTempletExample example = new com.vo.DesignTempletExample();
		com.vo.DesignTempletExample.Criteria criteria = example.createCriteria();
		
		criteria.andUserIdEqualTo(userId);
		
		int totalItem = designTempletMapper.countByExample(example);//获取总条数
		
		PageBean pageBean = new PageBean();//保存PageBean
		
		pageBean.setPage(page);
		pageBean.setTotalItem(totalItem);
		pageBean.setTotalPage();
		
		return pageBean;
	}

	/**
	 * 加载用户设计问卷列表
	 */
	@Override
	public List<DesignTemplet> showQuestionnaireList(PageBean pageBean, String userId) {
		// TODO Auto-generated method stub
		System.out.println("迟来的biz:showQuestionnaireList请求。。。");
		
		int start = (pageBean.getPage() - 1) * pageBean.getItem();//内容开始
		int end = pageBean.getTotalItem() < pageBean.getPage() * pageBean.getItem() ? pageBean.getTotalItem() : pageBean.getPage() * pageBean.getItem();//内容结束
		
		System.out.println("内容开始:" + start + "    " + "内容结束:" + end);
		
//		com.vo.DesignTempletExample example = new com.vo.DesignTempletExample();
//		com.vo.DesignTempletExample.Criteria criteria = example.createCriteria();
//		
//		criteria.andUserIdEqualTo(userId);
//		
//		List<DesignTemplet> list = designTempletMapper.selectByExample(example);//获取对应userId的问卷
		
		List<DesignTemplet> list = designTempletMapper.selectByuserIdOrderByfinishTimeOrderBystartRecoveryTimeOrderByendRecoveryTime(userId);
		
		List<DesignTemplet> l = new ArrayList<DesignTemplet>();
		
		for (int i = start; i < end; i++) {
			l.add(list.get(i));//获取每页显示内容
		}
		
		return l;
	}

	/**
	 * 修改问卷回收状态
	 */
	@Override
	public DesignTemplet changeState(String designTempletId, int state, HttpServletRequest request) {
		// TODO Auto-generated method stub
		System.out.println("迟来的biz:changeState请求。。。");
		
		Date date = new Date();
		
		DesignTemplet designTemplet = designTempletMapper.selectByPrimaryKey(designTempletId);
		
		if(state == 2) {
			
			String link = "questionnaire-" + designTempletId;
			
			htmlControl.getHTML("http://localhost:8080/questionnaire_survey/generateQuestionnaire.action?designTempletId=" + designTempletId, link, request);//生成HTML并且返回访问路径
			
			designTemplet.setState(2);
			designTemplet.setStartRecoveryTime(date);
			designTemplet.setLink(link);//存储访问路径//存储HTML文件名
		} else if(state == 3) {
			designTemplet.setState(3);
			designTemplet.setEndRecoveryTime(null);
		} else if(state == 4) {
			designTemplet.setState(4);
			designTemplet.setEndRecoveryTime(date);
		}//修改问卷当前状态及开始回收时间和结束回收时间
		
		designTempletMapper.updateByPrimaryKey(designTemplet);
		
		DesignTemplet d = designTempletMapper.selectByPrimaryKey(designTempletId);
		
		return d;
		
	}

	/**
	 * 获取设计问卷
	 */
	@Override
	public DesignTemplet getDesignTemplet(String designTempletId) {
		// TODO Auto-generated method stub
		System.out.println("迟来的biz:getDesignTemplet请求。。。");
		
		DesignTemplet designTemplet = designTempletMapper.selectByPrimaryKey(designTempletId);
		
		return designTemplet;
	}

	/**
	 * 获取设计问卷索引
	 */
	@Override
	public List<DesignTempletIndex> getDesignTempletIndexList(String designTempletId) {
		// TODO Auto-generated method stub
		System.out.println("迟来的biz:getDesignTempletIndexList请求。。。");
		
		List<DesignTempletIndex> list = designTempletIndexMapper.selectByDesignTempletIndexIdOrderByDesignTempletIndexSignDesignTempletIndexOrder(designTempletId);//获取对应ID排序后的问卷索引
		
		return list;
	}


	@Override
	public DesignSingle getDesignSingle(String designExerciseId) {
		// TODO Auto-generated method stub
		System.out.println("迟来的biz:getDesignSingle请求。。。");
		
		DesignSingle designSingle = designSingleMapper.selectByPrimaryKey(designExerciseId);
		
		return designSingle;
	}


	@Override
	public DesignCheckbox getDesignCheckbox(String designExerciseId) {
		// TODO Auto-generated method stub
		System.out.println("迟来的biz:getDesignCheckbox请求。。。");
		
		DesignCheckbox designCheckbox = designCheckboxMapper.selectByPrimaryKey(designExerciseId);
		
		return designCheckbox;
	}


	@Override
	public DesignText getDesignText(String designExerciseId) {
		// TODO Auto-generated method stub
		System.out.println("迟来的biz:getDesignText请求。。。");
		
		DesignText designText = designTextMapper.selectByPrimaryKey(designExerciseId);
		
		return designText;
	}


	@Override
	public List<DesignSingleOption> getDesignSingleOption(String designSingleId) {
		// TODO Auto-generated method stub
		System.out.println("迟来的biz:getDesignSingleOption请求。。。");
		
		List<DesignSingleOption> list = designSingleOptionMapper.selectBydesignSingleIdOrderbydesignSingleOrder(designSingleId);
		
		return list;
	}


	@Override
	public List<DesignCheckboxOption> getDesignCheckboxOption(
			String designCheckboxId) {
		// TODO Auto-generated method stub
		System.out.println("迟来的biz:getDesignCheckboxOption请求。。。");
		
		List<DesignCheckboxOption> list = designCheckboxOptionMapper.selectBydesignCheckboxIdOrderbydesignCheckboxOrder(designCheckboxId);
		
		return list;
	}


	/**
	 * 删除问卷
	 */
	@Override
	public void deleteQuestionnaire(String designTempletId) {
		// TODO Auto-generated method stub
		System.out.println("迟来的biz:deleteQuestionnaire请求。。。");
		
		int deleteDesignSingleNum = 0;//统计删除单选题数量
		int deleteDesignCheckboxNum = 0;//统计删除多选题数量
		int deleteDesignTextNum = 0;//统计删除文本题数量
		
		com.vo.DesignTempletIndexExample designTempletIndexExample = new com.vo.DesignTempletIndexExample();
		com.vo.DesignTempletIndexExample.Criteria designTempletIndexExampleCriteria = designTempletIndexExample.createCriteria();
		designTempletIndexExampleCriteria.andDesignTempletIdEqualTo(designTempletId);//根据模板ID查找模板索引
		
		List<DesignTempletIndex> designTempletIndexList = designTempletIndexMapper.selectByExample(designTempletIndexExample);//获取字典模板索引
		
		for (DesignTempletIndex designTempletIndex : designTempletIndexList) {//根据designExerciseId删除单选题、多选题、文本题
			
			com.vo.DesignSingleOptionExample designSingleOptionExample = new com.vo.DesignSingleOptionExample();
			com.vo.DesignSingleOptionExample.Criteria designSingleOptionExampleCriteria = designSingleOptionExample.createCriteria();
			designSingleOptionExampleCriteria.andDesignSingleIdEqualTo(designTempletIndex.getDesignExerciseId());//根据designSingleId删除单选题选项
			
			com.vo.DesignCheckboxOptionExample designCheckboxOptionExample = new com.vo.DesignCheckboxOptionExample();
			com.vo.DesignCheckboxOptionExample.Criteria designCheckboxOptionExampleCriteria = designCheckboxOptionExample.createCriteria();
			designCheckboxOptionExampleCriteria.andDesignCheckboxIdEqualTo(designTempletIndex.getDesignExerciseId());//根据designCheckboxId删除多选题选项
			
			designSingleOptionMapper.deleteByExample(designSingleOptionExample);//删除单选题选项
			
			designCheckboxOptionMapper.deleteByExample(designCheckboxOptionExample);//删除多选题选项
			
			deleteDesignSingleNum =+ designSingleMapper.deleteByPrimaryKey(designTempletIndex.getDesignExerciseId());//删除单选题
			
			deleteDesignCheckboxNum =+ designCheckboxMapper.deleteByPrimaryKey(designTempletIndex.getDesignExerciseId());//删除多选题
			
			deleteDesignTextNum =+ designTextMapper.deleteByPrimaryKey(designTempletIndex.getDesignExerciseId());//删除文本题
			
		}
		
		System.out.println("删除单选题数量：" + deleteDesignSingleNum);
		System.out.println("删除多选题数量：" + deleteDesignCheckboxNum);
		System.out.println("删除文本题数量：" + deleteDesignTextNum);
		
		designTempletIndexMapper.deleteByExample(designTempletIndexExample);//删除字典模板索引
		
		designTempletMapper.deleteByPrimaryKey(designTempletId);//删除字典模板
		
	}

}