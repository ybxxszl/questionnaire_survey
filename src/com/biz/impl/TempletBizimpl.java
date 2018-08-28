package com.biz.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.biz.TempletBiz;
import com.dao.DictCheckboxMapper;
import com.dao.DictCheckboxOptionMapper;
import com.dao.DictSingleMapper;
import com.dao.DictSingleOptionMapper;
import com.dao.DictTempletIndexMapper;
import com.dao.DictTempletMapper;
import com.dao.DictTextMapper;
import com.dao.SortMapper;
import com.vo.DictCheckbox;
import com.vo.DictCheckboxOption;
import com.vo.DictSingle;
import com.vo.DictSingleOption;
import com.vo.DictTemplet;
import com.vo.DictTempletIndex;
import com.vo.DictText;
import com.vo.PageBean;
import com.vo.Sort;

@Service
public class TempletBizimpl implements TempletBiz {

	@Autowired
	private SortMapper sortMapper;
	
	@Autowired
	private DictTempletMapper dictTempletMapper;
	
	@Autowired
	private DictTempletIndexMapper dictTempletIndexMapper;
	
	@Autowired
	private DictSingleMapper dictSingleMapper;
	
	@Autowired
	private DictSingleOptionMapper dictSingleOptionMapper;
	
	@Autowired
	private DictCheckboxMapper dictCheckboxMapper;
	
	@Autowired
	private DictCheckboxOptionMapper dictCheckboxOptionMapper;
	
	@Autowired
	private DictTextMapper dictTextMapper;
	
	int item = 10;//ajax分页的每页条数
	
	/**
	 * 加载全部问卷调查分类
	 */
	@Override
	public List<Sort> getSortList() {
		// TODO Auto-generated method stub
		System.out.println("迟来的biz:getSortList请求。。。");
		
		List<Sort> list = sortMapper.selectByExample(new com.vo.SortExample());//获取全部问卷调查分类
		
		return list;
	}

	public String getUUID() {
		
		UUID uuid = UUID.randomUUID();//获取UUID
		String temp = uuid.toString();
		
		return temp;
		
	}//获取字符串类型的UUID

	/**
	 * 获取PageBean
	 */
	@Override
	public PageBean getPageBean(String sortId, int page) {
		// TODO Auto-generated method stub
		System.out.println("迟来的biz:getPageBean请求。。。");
		
		com.vo.DictTempletExample example = new com.vo.DictTempletExample();
		com.vo.DictTempletExample.Criteria criteria = example.createCriteria();
		
		criteria.andSortIdEqualTo(sortId);//获取对应分类下模板条数
		
		int totalItem = dictTempletMapper.countByExample(example);//获取总条数
		
		PageBean pageBean = new PageBean();//保存PageBean
		
		pageBean.setPage(page);
		pageBean.setTotalItem(totalItem);
		pageBean.setTotalPage();
		
		return pageBean;
	}

	/**
	 * 获取内容TemplateList
	 */
	@Override
	public List<DictTemplet> getTempletList(PageBean pageBean, String sortId) {
		// TODO Auto-generated method stub
		System.out.println("迟来的biz:getTempletList请求。。。");
		
		int start = (pageBean.getPage() - 1) * pageBean.getItem();//内容开始
		int end = pageBean.getTotalItem() < pageBean.getPage() * pageBean.getItem() ? pageBean.getTotalItem() : pageBean.getPage() * pageBean.getItem();//内容结束
		
		System.out.println("内容开始:" + start + "    " + "内容结束:" + end);
		
		com.vo.DictTempletExample example = new com.vo.DictTempletExample();
		com.vo.DictTempletExample.Criteria criteria = example.createCriteria();
		
		criteria.andSortIdEqualTo(sortId);//获取对应分类下模板内容
		
		List<DictTemplet> list = dictTempletMapper.selectByExample(example);//获取全部内容
		
		List<DictTemplet> l = new ArrayList<DictTemplet>();
		for (int i = start; i < end; i++) {
			l.add(list.get(i));//获取每页显示内容
		}
		
		return l;
	}

	/**
	 * 获取字典模板名称
	 */
	@Override
	public DictTemplet getDictTemplet(String dictTempletId) {
		// TODO Auto-generated method stub
		System.out.println("迟来的biz:getDictTemplet请求。。。");
		
		DictTemplet dictTemplet = dictTempletMapper.selectByPrimaryKey(dictTempletId);
		
		return dictTemplet;
	}

	/**
	 * 获取字典模板索引
	 */
	@Override
	public List<DictTempletIndex> getDictTempletIndexList(String dictTempletId) {
		// TODO Auto-generated method stub
		System.out.println("迟来的biz:getDictTempletIndexList请求。。。");
		
		List<DictTempletIndex> list = dictTempletIndexMapper.selectByDictTempletIndexIdOrderByDictTempletIndexSignDictTempletIndexOrder(dictTempletId);//获取对应ID排序后的模板索引
		
		return list;
	}

	/**
	 * 获取字典模板单选题
	 */
	@Override
	public DictSingle getDictSingle(String dictExerciseId) {
		// TODO Auto-generated method stub
		System.out.println("迟来的biz:getDictSingle请求。。。");
		
		DictSingle dictSingle = dictSingleMapper.selectByPrimaryKey(dictExerciseId);
		
		return dictSingle;
	}

	/**
	 * 获取字典模板多选题
	 */
	@Override
	public DictCheckbox getDictCheckbox(String dictExerciseId) {
		// TODO Auto-generated method stub
		System.out.println("迟来的biz:getDictCheckbox请求。。。");
		
		DictCheckbox dictCheckbox = dictCheckboxMapper.selectByPrimaryKey(dictExerciseId);
		
		return dictCheckbox;
	}

	/**
	 * 获取字典模板文本题
	 */
	@Override
	public DictText getDictText(String dictExerciseId) {
		// TODO Auto-generated method stub
		System.out.println("迟来的biz:getDictText请求。。。");
		
		DictText dictText = dictTextMapper.selectByPrimaryKey(dictExerciseId);
		
		return dictText;
	}

	/**
	 * 获取字典模板单选题选项
	 */
	@Override
	public List<DictSingleOption> getDictSingleOption(String dictSingleId) {
		// TODO Auto-generated method stub
		System.out.println("迟来的biz:getDictSingleOption请求。。。");
		
		List<DictSingleOption> list = dictSingleOptionMapper.selectBydictSingleIdOrderbydictSingleOrder(dictSingleId);
		
		return list;
	}

	/**
	 * 获取字典模板多选题选项
	 */
	@Override
	public List<DictCheckboxOption> getDictCheckboxOption(String dictCheckboxId) {
		// TODO Auto-generated method stub
		System.out.println("迟来的biz:getDictCheckboxOption请求。。。");
		
		List<DictCheckboxOption> list = dictCheckboxOptionMapper.selectBydictCheckboxIdOrderbydictCheckboxOrder(dictCheckboxId);
		
		return list;
	}
	
	/**
	 * 为ajax分页获取分类列表
	 */
	@Override
	public List<Sort> getSort() {
		// TODO Auto-generated method stub
		System.out.println("迟来的biz:getSort请求。。。");
		
		List<Sort> list = sortMapper.selectByExample(new com.vo.SortExample());
		
		return list;
	}

	/**
	 * 为ajax分页获取分页的总页数
	 */
	@Override
	public int getPaging(String sortId) {
		// TODO Auto-generated method stub
		System.out.println("迟来的biz:getPage请求。。。");
		
		com.vo.DictTempletExample example = new com.vo.DictTempletExample();
		com.vo.DictTempletExample.Criteria criteria = example.createCriteria();
		
		criteria.andSortIdEqualTo(sortId);
		
		int totalItem = dictTempletMapper.countByExample(example);
		
		int totalPage = totalItem / item;
		int temp = totalItem % item;
		
		if(temp > 0) {
			totalPage++;
		}
		
		return totalPage;
	}

	/**
	 * 为ajax分页获取分页的内容
	 */
	@Override
	public List<DictTemplet> getPage(String sortId, int page) {
		// TODO Auto-generated method stub
		System.out.println("迟来的biz:getPage请求。。。");
		
		com.vo.DictTempletExample example = new com.vo.DictTempletExample();
		com.vo.DictTempletExample.Criteria criteria = example.createCriteria();
		
		criteria.andSortIdEqualTo(sortId);
		
		int totalItem = dictTempletMapper.countByExample(example);
		
		int start = (page - 1) * item;//内容开始
		int end = totalItem < page * item ? totalItem : page * item;//内容结束
		
		System.out.println("内容开始:" + start + "    " + "内容结束:" + end);
		
		List<DictTemplet> list = dictTempletMapper.selectByExample(example);//获取全部内容
		
		List<DictTemplet> l = new ArrayList<DictTemplet>();
		for (int i = start; i < end; i++) {
			l.add(list.get(i));//获取每页显示内容
		}
		
		return l;
	}

}