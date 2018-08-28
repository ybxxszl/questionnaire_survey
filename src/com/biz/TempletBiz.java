package com.biz;

import java.util.List;

import com.vo.DictCheckbox;
import com.vo.DictCheckboxOption;
import com.vo.DictSingle;
import com.vo.DictSingleOption;
import com.vo.DictTemplet;
import com.vo.DictTempletIndex;
import com.vo.DictText;
import com.vo.PageBean;
import com.vo.Sort;

public interface TempletBiz {

	List<Sort> getSortList();

	PageBean getPageBean(String sortId, int page);

	List<DictTemplet> getTempletList(PageBean pageBean, String sortId);

	DictTemplet getDictTemplet(String dictTempletId);

	List<DictTempletIndex> getDictTempletIndexList(String dictTempletId);

	DictSingle getDictSingle(String dictExerciseId);

	DictCheckbox getDictCheckbox(String dictExerciseId);

	DictText getDictText(String dictExerciseId);

	List<DictSingleOption> getDictSingleOption(String dictSingleId);

	List<DictCheckboxOption> getDictCheckboxOption(String dictCheckboxId);

	List<Sort> getSort();

	int getPaging(String sortId);

	List<DictTemplet> getPage(String sortId, int page);

}
