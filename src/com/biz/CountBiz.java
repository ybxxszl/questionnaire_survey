package com.biz;

import java.util.List;

import com.vo.CheckboxAnswerCount;
import com.vo.DesignCheckboxOption;
import com.vo.DesignSingleOption;
import com.vo.DesignText;
import com.vo.SingleAnswerCount;
import com.vo.TextAnswer;

public interface CountBiz {

	void countSingleAnswer(String designSingleOptionId);

	void countCheckboxAnswer(String designCheckboxOptionId);

	void addTextAnswer(String designExerciseId, String textAnswerContent);

	List<SingleAnswerCount> getSingleAnswerCount(
			List<DesignSingleOption> designSingleOptionList);

	List<CheckboxAnswerCount> getCheckboxAnswerCount(
			List<DesignCheckboxOption> designCheckboxOptionList);

	List<TextAnswer> getTextAnswer(List<DesignText> designTextList);

}
