package com.biz.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.biz.CountBiz;
import com.dao.CheckboxAnswerCountMapper;
import com.dao.SingleAnswerCountMapper;
import com.dao.TextAnswerMapper;
import com.vo.CheckboxAnswerCount;
import com.vo.DesignCheckboxOption;
import com.vo.DesignSingleOption;
import com.vo.DesignText;
import com.vo.SingleAnswerCount;
import com.vo.TextAnswer;

@Service
public class CountBizimpl implements CountBiz {

	@Autowired
	private SingleAnswerCountMapper singleAnswerCountMapper;
	
	@Autowired
	private CheckboxAnswerCountMapper checkboxAnswerCountMapper;
	
	@Autowired
	private TextAnswerMapper textAnswerMapper;
	
	@Override
	public void countSingleAnswer(String designSingleOptionId) {
		// TODO Auto-generated method stub
		System.out.println("迟来的biz：countSingleAnswer请求。。。");
		
		com.vo.SingleAnswerCountExample example = new com.vo.SingleAnswerCountExample();
		com.vo.SingleAnswerCountExample.Criteria criteria = example.createCriteria();
		
		criteria.andDesignSingleOptionIdEqualTo(designSingleOptionId);
		
		List<SingleAnswerCount> singleAnswerCountList = (List<SingleAnswerCount>) singleAnswerCountMapper.selectByExample(example);
		
		if(singleAnswerCountList.size() == 0) {
			
			SingleAnswerCount count = new SingleAnswerCount();
			
			count.setSingleAnswerCountId(getUUID());
			count.setSingleAnswerCount(1);
			count.setDesignSingleOptionId(designSingleOptionId);
			
			singleAnswerCountMapper.insert(count);
			
		} else {
			
			SingleAnswerCount singleAnswerCount = singleAnswerCountList.get(0);
			
			Integer temp = singleAnswerCount.getSingleAnswerCount();
			
			temp++;
			
			singleAnswerCount.setSingleAnswerCount(temp);
			
			singleAnswerCountMapper.updateByPrimaryKey(singleAnswerCount);
			
		}
		
	}

	@Override
	public void countCheckboxAnswer(String designCheckboxOptionId) {
		// TODO Auto-generated method stub
		System.out.println("迟来的biz：countCheckboxAnswer请求。。。");

		com.vo.CheckboxAnswerCountExample example = new com.vo.CheckboxAnswerCountExample();
		com.vo.CheckboxAnswerCountExample.Criteria criteria = example.createCriteria();
		
		criteria.andDesignCheckboxOptionIdEqualTo(designCheckboxOptionId);
		
		List<CheckboxAnswerCount> checkboxAnswerCountList = (List<CheckboxAnswerCount>) checkboxAnswerCountMapper.selectByExample(example);
		
		if(checkboxAnswerCountList.size() == 0) {
			
			CheckboxAnswerCount count = new CheckboxAnswerCount();
			
			count.setCheckboxAnswerCountId(getUUID());
			count.setCheckboxAnswerCount(1);
			count.setDesignCheckboxOptionId(designCheckboxOptionId);
			
			checkboxAnswerCountMapper.insert(count);
			
		} else {
			
			CheckboxAnswerCount checkboxAnswerCount = checkboxAnswerCountList.get(0);
			
			Integer temp = checkboxAnswerCount.getCheckboxAnswerCount();
			
			temp++;
			
			checkboxAnswerCount.setCheckboxAnswerCount(temp);
			
			checkboxAnswerCountMapper.updateByPrimaryKey(checkboxAnswerCount);
			
		}
		
	}

	@Override
	public void addTextAnswer(String designExerciseId, String textAnswerContent) {
		// TODO Auto-generated method stub
		System.out.println("迟来的biz：addTextAnswer请求。。。");
		
		TextAnswer textAnswer = new TextAnswer();
		
		textAnswer.setTextAnswerId(getUUID());
		textAnswer.setTextAnswerContent(textAnswerContent);
		textAnswer.setDesignTextId(designExerciseId);
		
		textAnswerMapper.insert(textAnswer);
		
	}

	private String getUUID() {
		// TODO Auto-generated method stub
		
		UUID uuid = UUID.randomUUID();
		
		String temp = uuid.toString();
		
		return temp;
		
	}

	@Override
	public List<SingleAnswerCount> getSingleAnswerCount(
			List<DesignSingleOption> designSingleOptionList) {
		// TODO Auto-generated method stub
		System.out.println("迟来的biz：getSingleAnswerCount请求。。。");
		
		List<String> list = new ArrayList<String>();
		
		for (DesignSingleOption designSingleOption : designSingleOptionList) {
			list.add(designSingleOption.getDesignSingleOptionId());
		}
		
		com.vo.SingleAnswerCountExample example = new com.vo.SingleAnswerCountExample();
		com.vo.SingleAnswerCountExample.Criteria criteria = example.createCriteria();
		
		criteria.andDesignSingleOptionIdIn(list);
		
		List<SingleAnswerCount> singleAnswerCountList = singleAnswerCountMapper.selectByExample(example);
		
		return singleAnswerCountList;
	}

	@Override
	public List<CheckboxAnswerCount> getCheckboxAnswerCount(
			List<DesignCheckboxOption> designCheckboxOptionList) {
		// TODO Auto-generated method stub
		System.out.println("迟来的biz：getCheckboxAnswerCount请求。。。");
		
		List<String> list = new ArrayList<String>();
		
		for (DesignCheckboxOption designCheckboxOption : designCheckboxOptionList) {
			list.add(designCheckboxOption.getDesignCheckboxOptionId());
		}
		
		com.vo.CheckboxAnswerCountExample example = new com.vo.CheckboxAnswerCountExample();
		com.vo.CheckboxAnswerCountExample.Criteria criteria = example.createCriteria();
		
		criteria.andDesignCheckboxOptionIdIn(list);
		
		List<CheckboxAnswerCount> checkboxAnswerCountList = checkboxAnswerCountMapper.selectByExample(example);
		
		return checkboxAnswerCountList;
		
	}

	@Override
	public List<TextAnswer> getTextAnswer(List<DesignText> designTextList) {
		// TODO Auto-generated method stub
		System.out.println("迟来的biz：getTextAnswer请求。。。");
		
		List<String> list = new ArrayList<String>();
		
		for (DesignText designText : designTextList) {
			list.add(designText.getDesignTextId());
		}
		
		com.vo.TextAnswerExample example = new com.vo.TextAnswerExample();
		com.vo.TextAnswerExample.Criteria criteria = example.createCriteria();
		
		criteria.andDesignTextIdIn(list);
		
		List<TextAnswer> textAnswerList = textAnswerMapper.selectByExample(example);
		
		return textAnswerList;
		
	}

}
