package com.biz;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.vo.DesignCheckbox;
import com.vo.DesignCheckboxOption;
import com.vo.DesignSingle;
import com.vo.DesignSingleOption;
import com.vo.DesignTemplet;
import com.vo.DesignTempletIndex;
import com.vo.DesignText;
import com.vo.PageBean;

public interface QuestionnaireBiz {

	void insertQuestionnaire(
			String userId,
			String designTempletName,
			String[] single_question, String[] single_answer_A,
			String[] single_answer_B, String[] single_answer_C,
			String[] single_answer_D, String[] check_question,
			String[] check_answer_A, String[] check_answer_B,
			String[] check_answer_C, String[] check_answer_D,
			String[] check_answer_E, String[] check_answer_F,
			String[] text_question);
	
	PageBean getPageBean(String userId, int page);

	List<DesignTemplet> showQuestionnaireList(PageBean pageBean, String userId);

	DesignTemplet changeState(String designTempletId, int state, HttpServletRequest request);

	DesignTemplet getDesignTemplet(String designTempletId);

	List<DesignTempletIndex> getDesignTempletIndexList(String designTempletId);

	DesignSingle getDesignSingle(String designExerciseId);

	DesignCheckbox getDesignCheckbox(String designExerciseId);

	DesignText getDesignText(String designExerciseId);

	List<DesignSingleOption> getDesignSingleOption(String designSingleId);

	List<DesignCheckboxOption> getDesignCheckboxOption(String designCheckboxId);

	void deleteQuestionnaire(String designTempletId);

}
