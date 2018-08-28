package com.web;

import java.awt.Color;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.jfree.data.category.DefaultCategoryDataset;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.biz.CountBiz;
import com.biz.QuestionnaireBiz;
import com.biz.UserOperateLogBiz;
import com.lowagie.text.BadElementException;
import com.lowagie.text.Cell;
import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.Element;
import com.lowagie.text.Font;
import com.lowagie.text.PageSize;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Phrase;
import com.lowagie.text.Table;
import com.lowagie.text.pdf.BaseFont;
import com.lowagie.text.pdf.PdfWriter;
import com.tool.PNGControl;
import com.vo.CheckboxAnswerCount;
import com.vo.DesignCheckbox;
import com.vo.DesignCheckboxOption;
import com.vo.DesignSingle;
import com.vo.DesignSingleOption;
import com.vo.DesignTemplet;
import com.vo.DesignTempletIndex;
import com.vo.DesignText;
import com.vo.PageBean;
import com.vo.SingleAnswerCount;
import com.vo.TextAnswer;
import com.vo.User;
import com.vo.UserOperateLog;

@Controller
public class QuestionnaireControl {

	@Autowired
	private QuestionnaireBiz questionnaireBiz;

	@Autowired
	private CountBiz countBiz;

	@Autowired
	private UserOperateLogBiz userOperateLogBiz;

	private PNGControl pngControl = new PNGControl();

	/**
	 * 修改问卷回收状态
	 * 
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @param designTempletId
	 * @param state
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/changeState")
	@ResponseBody
	public String changeState(HttpServletRequest request,
			HttpServletResponse response, HttpSession session, Model model,
			String designTempletId, int state) {

		System.out.println("迟来的web:changeState请求。。。");

		UserOperateLog userOperateLog = getUserOperateLog(session,
				String.valueOf(state + 2));// 获取UserOperateLog对象
		userOperateLogBiz.setUserOperateLog(userOperateLog);// 记录操作日志

		DesignTemplet designTemplet = questionnaireBiz.changeState(
				designTempletId, state, request);// 有返回值是为了刷新问卷的当前状态，因为判断条件写在页面上，所以没有重新存储session，需要重新存储session

		List<DesignTemplet> designTempletList = (List<DesignTemplet>) session
				.getAttribute("designTempletList");

		for (int i = 0; i < designTempletList.size(); i++) {
			if (designTempletList.get(i).getDesignTempletId()
					.equals(designTempletId)) {
				designTempletList.get(i).setState(designTemplet.getState());
			}
		}// 重新存储session（designTempletList），发现没用，这是缓存啊。。。

		if (state == 2 || state == 3) {
			return designTemplet.getLink();
		} else {
			return null;
		}

	}

	/**
	 * 加载用户设计问卷列表
	 * 
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/showQuestionnaireList")
	public String showQuestionnaireList(HttpServletRequest request,
			HttpServletResponse response, HttpSession session, Model model,
			String userId, int page) {

		System.out.println("迟来的web:showQuestionnaireList请求。。。");

		PageBean pageBean = questionnaireBiz.getPageBean(userId, page);// 获取PageBean

		System.out.println("PageBean:" + pageBean.toString());

		session.setAttribute("PageBean", pageBean);

		List<DesignTemplet> list = questionnaireBiz.showQuestionnaireList(
				pageBean, userId);// 加载用户设计问卷列表

		System.out.println("DesignTemplet：");
		for (DesignTemplet d : list) {
			System.out.println(d.toString());
		}

		session.setAttribute("designTempletList", list);

		return "myquestionnaire.jsp";

	}

	/**
	 * 添加字典模板
	 * 
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @param single_question
	 * @param single_answer_A
	 * @param single_answer_B
	 * @param single_answer_C
	 * @param single_answer_D
	 * @param check_question
	 * @param check_answer_A
	 * @param check_answer_B
	 * @param check_answer_C
	 * @param check_answer_D
	 * @param check_answer_E
	 * @param check_answer_F
	 * @param text_question
	 * @return
	 */
	@RequestMapping(value = "/insertQuestionnaire")
	public void insertTemplet(HttpServletRequest request,
			HttpServletResponse response, HttpSession session, Model model,
			String[] single_question, String[] single_answer_A,
			String[] single_answer_B, String[] single_answer_C,
			String[] single_answer_D, String[] check_question,
			String[] check_answer_A, String[] check_answer_B,
			String[] check_answer_C, String[] check_answer_D,
			String[] check_answer_E, String[] check_answer_F,
			String[] text_question) {

		System.out.println("迟来的web:insertQuestionnaire请求。。。");

		UserOperateLog userOperateLog = getUserOperateLog(session, "1");// 获取UserOperateLog对象
		userOperateLogBiz.setUserOperateLog(userOperateLog);// 记录操作日志

		String designTempletName = request.getParameter("designTempletName");// 获取设计模板名称

		System.out.println("设计模板名称：" + designTempletName);

		System.out.println("单选题：");
		for (int i = 0; i < single_question.length; i++) {
			System.out.println("问题：" + single_question[i]);
			System.out.println("答案：A." + single_answer_A[i] + " B."
					+ single_answer_B[i] + " C." + single_answer_C[i] + " D."
					+ single_answer_D[i]);
		}
		System.out.println("多选题：");
		for (int i = 0; i < check_question.length; i++) {
			System.out.println("问题：" + check_question[i]);
			System.out.println("答案：A." + check_answer_A[i] + " B."
					+ check_answer_B[i] + " C." + check_answer_C[i] + " D."
					+ check_answer_D[i] + " E." + check_answer_E[i] + " F."
					+ check_answer_F[i]);
		}
		System.out.println("文本题：");
		for (int i = 0; i < text_question.length; i++) {
			System.out.println("问题：" + text_question[i]);
		}

		User user = (User) session.getAttribute("user_session");
		String userId = user.getUserId();

		questionnaireBiz.insertQuestionnaire(userId, designTempletName,
				single_question, single_answer_A, single_answer_B,
				single_answer_C, single_answer_D, check_question,
				check_answer_A, check_answer_B, check_answer_C, check_answer_D,
				check_answer_E, check_answer_F, text_question);

		String path = request.getContextPath();

		System.out.println("该项目的相对路径：" + path);

		try {
			response.sendRedirect(path
					+ "/showQuestionnaireList.action?userId=" + userId
					+ "&page=1");// 重定向到我的问卷页面
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("IO异常");
		}

	}

	/**
	 * 删除问卷
	 * 
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @param designTempletId
	 */
	@RequestMapping(value = "/deleteQuestionnaire")
	public void deleteQuestionnaire(HttpServletRequest request,
			HttpServletResponse response, HttpSession session, Model model,
			String designTempletId) {

		System.out.println("迟来的web:deleteQuestionnaire请求。。。");

		UserOperateLog userOperateLog = getUserOperateLog(session, "3");// 获取UserOperateLog对象
		userOperateLogBiz.setUserOperateLog(userOperateLog);// 记录操作日志

		System.out.println("删除的问卷ID：" + designTempletId);

		questionnaireBiz.deleteQuestionnaire(designTempletId);// 根据问卷索引删除相应问卷。。。

		User user = (User) session.getAttribute("user_session");

		String userId = user.getUserId();

		String path = request.getContextPath();

		System.out.println("该项目的相对路径：" + path);

		try {
			response.sendRedirect(path
					+ "/showQuestionnaireList.action?userId=" + userId
					+ "&page=1");// 重定向到我的问卷页面
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("IO异常");
		}

	}

	/**
	 * 修改问卷
	 * 
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @param designTempletId
	 * @return
	 */
	@RequestMapping(value = "/modifyQuestionnaire")
	public String modifyQuestionnaire(HttpServletRequest request,
			HttpServletResponse response, HttpSession session, Model model,
			String designTempletId) {

		System.out.println("迟来的web:modifyQuestionnaire请求。。。");

		UserOperateLog userOperateLog = getUserOperateLog(session, "2");// 获取UserOperateLog对象
		userOperateLogBiz.setUserOperateLog(userOperateLog);// 记录操作日志

		System.out.println("修改的问卷ID：" + designTempletId);

		getQuestionnaire(request, response, session, model, designTempletId);

		questionnaireBiz.deleteQuestionnaire(designTempletId);// 根据问卷索引删除相应问卷。。。

		return "modifyquestionnaire.jsp";

	}

	/**
	 * 查看问卷
	 * 
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @param dictTempletId
	 * @param dictTempletName
	 * @return
	 */
	@RequestMapping(value = "/showQuestionnaire")
	public String showQuestionnaire(HttpServletRequest request,
			HttpServletResponse response, HttpSession session, Model model,
			String designTempletId) {

		System.out.println("迟来的web:showQuestionnaire请求。。。");

		UserOperateLog userOperateLog = getUserOperateLog(session, "7");// 获取UserOperateLog对象
		userOperateLogBiz.setUserOperateLog(userOperateLog);// 记录操作日志

		System.out.println("查看的问卷ID：" + designTempletId);

		getQuestionnaire(request, response, session, model, designTempletId);

		getCount(request, response, session, model);

		return "showquestionnaire.jsp";

	}

	/**
	 * 预览问卷
	 * 
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @param designTempletId
	 */
	@RequestMapping(value = "/previewQuestionnaire")
	public String previewQuestionnaire(HttpServletRequest request,
			HttpServletResponse response, HttpSession session, Model model,
			String designTempletId) {

		System.out.println("迟来的web:previewQuestionnaire请求。。。");

		System.out.println("预览的问卷ID：" + designTempletId);

		getQuestionnaire(request, response, session, model, designTempletId);

		return "previewquestionnaire.jsp";

	}

	/**
	 * 生成问卷
	 * 
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @param dictTempletId
	 * @param dictTempletName
	 * @return
	 * @return
	 */
	@RequestMapping(value = "/generateQuestionnaire")
	public String generateQuestionnaire(HttpServletRequest request,
			HttpServletResponse response, HttpSession session, Model model,
			String designTempletId) {

		System.out.println("迟来的web:generateQuestionnaire请求。。。");

		System.out.println("生成的问卷ID：" + designTempletId);

		getQuestionnaire(request, response, session, model, designTempletId);

		return "generatequestionnaire.jsp";

	}

	/**
	 * 获取问卷（通用）
	 * 
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @param designTempletId
	 */
	public void getQuestionnaire(HttpServletRequest request,
			HttpServletResponse response, HttpSession session, Model model,
			String designTempletId) {

		System.out.println("获取问卷");

		System.out.println("获取的问卷ID：" + designTempletId);

		session.setAttribute("designTempletId", designTempletId);

		DesignTemplet designTemplet = questionnaireBiz
				.getDesignTemplet(designTempletId);

		String designTempletName = designTemplet.getDesignTempletName();// 获取问卷名称

		System.out.println("获取的问卷名称：" + designTempletName);

		session.setAttribute("designTempletName", designTempletName);

		List<DesignTempletIndex> designTempletIndexList = questionnaireBiz
				.getDesignTempletIndexList(designTempletId);// 获取对应ID排序后的问卷索引

		System.out.println("问卷索引：");
		for (DesignTempletIndex d : designTempletIndexList) {
			System.out.println(d.toString());
		}

		List<DesignSingle> designSingleList = new ArrayList<DesignSingle>();// 存储单选题内容
		List<DesignCheckbox> designCheckboxList = new ArrayList<DesignCheckbox>();// 存储多选题内容
		List<DesignText> designTextList = new ArrayList<DesignText>();// 存储文本题内容

		for (int i = 0; i < designTempletIndexList.size(); i++) {

			int designTempletIndexSign = designTempletIndexList.get(i)
					.getDesignTempletIndexSign();
			String designExerciseId = designTempletIndexList.get(i)
					.getDesignExerciseId();

			if (designTempletIndexSign == 1) {// 判断为单选题

				DesignSingle designSingle = questionnaireBiz
						.getDesignSingle(designExerciseId);// 获取单选题内容
				designSingleList.add(designSingle);

			}
			if (designTempletIndexSign == 2) {// 判断为多选题

				DesignCheckbox designCheckbox = questionnaireBiz
						.getDesignCheckbox(designExerciseId);// 获取多选题内容
				designCheckboxList.add(designCheckbox);

			}
			if (designTempletIndexSign == 3) {// 判断为文本题

				DesignText designText = questionnaireBiz
						.getDesignText(designExerciseId);// 获取文本题内容
				designTextList.add(designText);

			}

		}

		if (designSingleList.size() > 0) {
			System.out.println("共" + designSingleList.size() + "道单选题，选项分别为：");
			for (DesignSingle d : designSingleList) {
				System.out.println(d.toString());
			}
		}

		if (designCheckboxList.size() > 0) {
			System.out.println("共" + designCheckboxList.size() + "道多选题，选项分别为：");
			for (DesignCheckbox d : designCheckboxList) {
				System.out.println(d.toString());
			}
		}

		if (designTextList.size() > 0) {
			System.out.println("共" + designTextList.size() + "道文本题，选项分别为：");
			for (DesignText d : designTextList) {
				System.out.println(d.toString());
			}
		}

		session.setAttribute("designSingleList", designSingleList);
		session.setAttribute("designCheckboxList", designCheckboxList);
		session.setAttribute("designTextList", designTextList);

		List<DesignSingleOption> designSingleOptionList = new ArrayList<DesignSingleOption>();// 存储单选题选项内容
		List<DesignCheckboxOption> designCheckboxOptionList = new ArrayList<DesignCheckboxOption>();// 存储多选题选项内容

		for (int i = 0; i < designSingleList.size(); i++) {

			String designSingleId = designSingleList.get(i).getDesignSingleId();

			List<DesignSingleOption> list = questionnaireBiz
					.getDesignSingleOption(designSingleId);

			designSingleOptionList.addAll(list);

		}

		for (int i = 0; i < designCheckboxList.size(); i++) {

			String designCheckboxId = designCheckboxList.get(i)
					.getDesignCheckboxId();

			List<DesignCheckboxOption> list = questionnaireBiz
					.getDesignCheckboxOption(designCheckboxId);

			designCheckboxOptionList.addAll(list);

		}

		session.setAttribute("designSingleOptionList", designSingleOptionList);
		session.setAttribute("designCheckboxOptionList",
				designCheckboxOptionList);

	}

	@SuppressWarnings("unchecked")
	public void getCount(HttpServletRequest request,
			HttpServletResponse response, HttpSession session, Model model) {
		System.out.println("获取统计数据");

		List<DesignSingleOption> designSingleOptionList = (List<DesignSingleOption>) session
				.getAttribute("designSingleOptionList");
		List<DesignCheckboxOption> designCheckboxOptionList = (List<DesignCheckboxOption>) session
				.getAttribute("designCheckboxOptionList");
		List<DesignText> designTextList = (List<DesignText>) session
				.getAttribute("designTextList");

		List<SingleAnswerCount> singleAnswerCountList = countBiz
				.getSingleAnswerCount(designSingleOptionList);
		List<CheckboxAnswerCount> checkboxAnswerCountList = countBiz
				.getCheckboxAnswerCount(designCheckboxOptionList);
		List<TextAnswer> textAnswerList = countBiz
				.getTextAnswer(designTextList);

		System.out.println("textAnswerList" + textAnswerList.toString());

		// session.setAttribute("singleAnswerCountList", singleAnswerCountList);
		// session.setAttribute("checkboxAnswerCountList",
		// checkboxAnswerCountList);
		session.setAttribute("textAnswerList", textAnswerList);

		List<String> designSingleIdList = new ArrayList<String>();
		List<String> designCheckboxIdList = new ArrayList<String>();

		for (DesignSingleOption d : designSingleOptionList) {
			if (!designSingleIdList.contains(d.getDesignSingleId())) {
				designSingleIdList.add(d.getDesignSingleId());// 得到所有单选题内容
			}
		}
		for (DesignCheckboxOption d : designCheckboxOptionList) {
			if (!designCheckboxIdList.contains(d.getDesignCheckboxId())) {
				designCheckboxIdList.add(d.getDesignCheckboxId());// 得到所有多选题内容
			}
		}

		System.out.println("designSingleIdList:"
				+ designSingleIdList.toString());
		System.out.println("designCheckboxIdList:"
				+ designCheckboxIdList.toString());

		List<String> PNG = new ArrayList<String>();// 存储图表的PNG图片名

		int temp;// 标记是否有未被选中的

		DefaultCategoryDataset dataset = null;// 创建默认数据集对象

		// 给单选题生成PNG
		for (String s : designSingleIdList) {
			dataset = new DefaultCategoryDataset();// 新的DefaultCategoryDataset对象
			for (DesignSingleOption designSingleOption : designSingleOptionList) {
				if (s.equals(designSingleOption.getDesignSingleId())) {
					temp = 0;// 没有被选中过则选中数量为0
					for (SingleAnswerCount singleAnswerCount : singleAnswerCountList) {
						if (designSingleOption.getDesignSingleOptionId()
								.equals(singleAnswerCount
										.getDesignSingleOptionId())) {
							temp = singleAnswerCount.getSingleAnswerCount();
						}
					}
					dataset.addValue(temp, "选中数量",
							designSingleOption.getDesignSingleOptionContent());// 添加数据
				}
			}

			String fileName = pngControl.getPNG(session, dataset, "单选");// 生成PNG并返回PNG名称
			PNG.add(fileName);

		}

		// 给多选题生成PNG
		for (String s : designCheckboxIdList) {
			dataset = new DefaultCategoryDataset();
			for (DesignCheckboxOption designCheckboxOption : designCheckboxOptionList) {
				if (s.equals(designCheckboxOption.getDesignCheckboxId())) {
					temp = 0;
					for (CheckboxAnswerCount checkboxAnswerCount : checkboxAnswerCountList) {
						if (designCheckboxOption.getDesignCheckboxOptionId()
								.equals(checkboxAnswerCount
										.getDesignCheckboxOptionId())) {
							temp = checkboxAnswerCount.getCheckboxAnswerCount();
						}
					}
					dataset.addValue(temp, "选中数量", designCheckboxOption
							.getDesignCheckboxOptionContent());// 添加数据
				}
			}

			String fileName = pngControl.getPNG(session, dataset, "多选");// 生成PNG并返回PNG名称
			PNG.add(fileName);

		}

		session.setAttribute("PNG", PNG);// 存储session

	}

	/**
	 * 导出Excel
	 * 
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @param designTempletId
	 * @return
	 */
	@SuppressWarnings({ "unchecked", "deprecation" })
	@RequestMapping(value = "/getExcel")
	public ResponseEntity<byte[]> getExcel(HttpServletRequest request,
			HttpServletResponse response, HttpSession session, Model model,
			String designTempletId) {
		System.out.println("迟来的web:getExcel请求。。。");

		List<DesignSingleOption> designSingleOptionList = (List<DesignSingleOption>) session
				.getAttribute("designSingleOptionList");
		List<DesignCheckboxOption> designCheckboxOptionList = (List<DesignCheckboxOption>) session
				.getAttribute("designCheckboxOptionList");
		List<DesignText> designTextList = (List<DesignText>) session
				.getAttribute("designTextList");

		List<SingleAnswerCount> singleAnswerCountList = countBiz
				.getSingleAnswerCount(designSingleOptionList);
		List<CheckboxAnswerCount> checkboxAnswerCountList = countBiz
				.getCheckboxAnswerCount(designCheckboxOptionList);
		List<TextAnswer> textAnswerList = countBiz
				.getTextAnswer(designTextList);

		List<String> designSingleIdList = new ArrayList<String>();
		List<String> designCheckboxIdList = new ArrayList<String>();

		for (DesignSingleOption d : designSingleOptionList) {
			if (!designSingleIdList.contains(d.getDesignSingleId())) {
				designSingleIdList.add(d.getDesignSingleId());// 得到所有单选题内容
			}
		}
		for (DesignCheckboxOption d : designCheckboxOptionList) {
			if (!designCheckboxIdList.contains(d.getDesignCheckboxId())) {
				designCheckboxIdList.add(d.getDesignCheckboxId());// 得到所有多选题内容
			}
		}

		HSSFWorkbook wb = new HSSFWorkbook();// 创建Workbook对象（生成Excel）

		HSSFSheet single_sheet = wb.createSheet("统计单选题");
		HSSFSheet checkbox_sheet = wb.createSheet("统计多选题");
		HSSFSheet text_sheet = wb.createSheet("统计文本题");// 创建三个工作表

		// 添加表头
		HSSFRow single_row = single_sheet.createRow((short) 0);
		single_row.createCell((short) 0).setCellValue("单选题");
		single_row.createCell((short) 1).setCellValue("选项");
		single_row.createCell((short) 2).setCellValue("选中数量");

		HSSFRow checkbox_row = checkbox_sheet.createRow((short) 0);
		checkbox_row.createCell((short) 0).setCellValue("多选题");
		checkbox_row.createCell((short) 1).setCellValue("选项");
		checkbox_row.createCell((short) 2).setCellValue("选中数量");

		HSSFRow text_row = text_sheet.createRow((short) 0);
		text_row.createCell((short) 0).setCellValue("文本题");
		text_row.createCell((short) 1).setCellValue("答案");

		int temp;// 标记是否有未被选中的

		int line;// 标记行数
		boolean flag;// 烦人的标记

		line = 1;

		// 添加单选数据
		for (String s : designSingleIdList) {
			String designSingleContent = questionnaireBiz.getDesignSingle(s)
					.getDesignSingleContent();// 获取选项内容：弱智代码，当时没想太多，导致缺数据，需要重新获取
			System.out.println("需要存储到Excel的单选选项内容：" + designSingleContent);
			HSSFRow row1 = single_sheet.createRow((short) line++);// 创建一行
			row1.createCell((short) 0).setCellValue(designSingleContent);// 给列添加数据
			flag = true;
			for (DesignSingleOption designSingleOption : designSingleOptionList) {
				if (s.equals(designSingleOption.getDesignSingleId())) {
					temp = 0;// 没有被选中过则选中数量为0
					for (SingleAnswerCount singleAnswerCount : singleAnswerCountList) {
						if (designSingleOption.getDesignSingleOptionId()
								.equals(singleAnswerCount
										.getDesignSingleOptionId())) {
							temp = singleAnswerCount.getSingleAnswerCount();
						}
					}
					// 添加数据
					if (flag) {
						row1.createCell((short) 1).setCellValue(
								designSingleOption
										.getDesignSingleOptionContent());
						row1.createCell((short) 2).setCellValue(temp);// 需要使用之前的对象，如果重新建立这一行的对象，那么会清空这一行之前的数据

						flag = false;
					} else {
						HSSFRow row2 = single_sheet.createRow((short) line++);
						row2.createCell((short) 1).setCellValue(
								designSingleOption
										.getDesignSingleOptionContent());
						row2.createCell((short) 2).setCellValue(temp);// 新建下一行的对象并添加数据
					}
				}
			}
		}

		line = 1;

		// 添加多选数据
		for (String s : designCheckboxIdList) {
			String designCheckboxContent = questionnaireBiz
					.getDesignCheckbox(s).getDesignCheckboxContent();// 获取选项内容：弱智代码，当时没想太多，导致缺数据，需要重新获取
			System.out.println("需要存储到Excel的多选选项内容：" + designCheckboxContent);
			HSSFRow row1 = checkbox_sheet.createRow((short) line++);
			row1.createCell((short) 0).setCellValue(designCheckboxContent);
			flag = true;
			for (DesignCheckboxOption designCheckboxOption : designCheckboxOptionList) {
				if (s.equals(designCheckboxOption.getDesignCheckboxId())) {
					temp = 0;
					for (CheckboxAnswerCount checkboxAnswerCount : checkboxAnswerCountList) {
						if (designCheckboxOption.getDesignCheckboxOptionId()
								.equals(checkboxAnswerCount
										.getDesignCheckboxOptionId())) {
							temp = checkboxAnswerCount.getCheckboxAnswerCount();
						}
					}
					// 添加数据
					if (flag) {
						row1.createCell((short) 1).setCellValue(
								designCheckboxOption
										.getDesignCheckboxOptionContent());
						row1.createCell((short) 2).setCellValue(temp);

						flag = false;
					} else {
						HSSFRow row2 = checkbox_sheet.createRow((short) line++);
						row2.createCell((short) 1).setCellValue(
								designCheckboxOption
										.getDesignCheckboxOptionContent());
						row2.createCell((short) 2).setCellValue(temp);
					}
				}
			}
		}

		line = 1;

		// 添加文本数据
		for (DesignText d : designTextList) {
			HSSFRow row1 = text_sheet.createRow((short) line++);
			System.out.println(d.getDesignTextContent());
			row1.createCell((short) 0).setCellValue(d.getDesignTextContent());
			flag = true;
			for (TextAnswer t : textAnswerList) {
				if (d.getDesignTextId().equals(t.getDesignTextId())) {
					// 添加数据
					if (flag) {
						System.out.println(t.getTextAnswerContent());
						row1.createCell((short) 1).setCellValue(
								t.getTextAnswerContent());

						flag = false;
					} else {
						HSSFRow row2 = text_sheet.createRow((short) line++);
						System.out.println(t.getTextAnswerContent());
						row2.createCell((short) 1).setCellValue(
								t.getTextAnswerContent());
					}
				}
			}
		}

		// 文件的生成与下载
		String name = "questionnaire_survey_result_" + designTempletId + ".xls";
		String url = request.getSession().getServletContext().getRealPath("") + File.separator + "download" + File.separator + "Excel" + File.separator + name;

		ResponseEntity<byte[]> responseEntity = null;

		try {

			// 生成文件
			FileOutputStream fos = new FileOutputStream(url);
			wb.write(fos);
			fos.close();

			// 下载文件
			File file = new File(url);
			HttpHeaders headers = new HttpHeaders();
			headers.setContentDispositionFormData("attachment", name);
			headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
			responseEntity = new ResponseEntity<byte[]>(
					FileUtils.readFileToByteArray(file), headers,
					HttpStatus.CREATED);

		} catch (IOException e) {
			// TODO Auto-generated catch block
			System.out.println("IO异常");
			e.printStackTrace();
		}

		return responseEntity;

	}

	/**
	 * 生成问卷pdf
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @param designTempletId
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/getPDF")
	public ResponseEntity<byte[]> getPDF(HttpServletRequest request,
			HttpServletResponse response, HttpSession session, Model model,
			String designTempletId) {
		System.out.println("迟来的web:getPDF请求。。。");

		List<DesignSingle> designSingleList = (List<DesignSingle>) session
				.getAttribute("designSingleList");
		List<DesignCheckbox> designCheckboxList = (List<DesignCheckbox>) session
				.getAttribute("designCheckboxList");
		List<DesignText> designTextList = (List<DesignText>) session
				.getAttribute("designTextList");

		List<DesignSingleOption> designSingleOptionList = (List<DesignSingleOption>) session
				.getAttribute("designSingleOptionList");
		List<DesignCheckboxOption> designCheckboxOptionList = (List<DesignCheckboxOption>) session
				.getAttribute("designCheckboxOptionList");

		String name = "questionnaire_survey" + designTempletId + ".pdf";
		String url = request.getSession().getServletContext().getRealPath("") + File.separator + "download" + File.separator + "PDF" + File.separator + name;
		
		int n = 1;//问题序号
		int m;//选项顺序

		try {
			// 创建Document对象(页面的大小为A4,左、右、上、下的页边距为40)
			Document document = new Document(PageSize.A4, 40, 40, 40, 40);
			// 建立书写器
			PdfWriter.getInstance(document, new FileOutputStream(url));
			// 打开文档
			document.open();

			Paragraph paragraph = new Paragraph(questionnaireBiz.getDesignTemplet(designTempletId).getDesignTempletName(), setTitleFont());//添加文本并设置字体
			paragraph.setAlignment(Element.ALIGN_CENTER);//设置文字居中
			
			document.add(paragraph);

			Table table1 = null;
			Table table2 = null;

			for (DesignSingle designSingle : designSingleList) {
				table1 = new Table(1);
				table1.setPadding(3);//设置文字狱边框间距
				Cell cell_content = new Cell(new Phrase(n++ + "、" + designSingle.getDesignSingleContent() + "（单选）", setContentFont()));//添加数据
				table1.addCell(cell_content);//添加数据到表格
				document.add(table1);//添加到pdf
				table2 = new Table(2);
				table2.setPadding(1);
				m = 65;
				for (DesignSingleOption designSingleOption : designSingleOptionList) {
					if(designSingle.getDesignSingleId().equals(designSingleOption.getDesignSingleId())) {
						Cell cell_optioncontent = new Cell(new Phrase((char) m++ +". " + designSingleOption.getDesignSingleOptionContent(), setOptionContentFont()));
						table2.addCell(cell_optioncontent);
					}
				}
				document.add(table2);
			}
			
			for (DesignCheckbox designCheckbox : designCheckboxList) {
				table1 = new Table(1);
				table1.setPadding(3);
				Cell cell_content = new Cell(new Phrase(n++ + "、" + designCheckbox.getDesignCheckboxContent() + "（多选）", setContentFont()));
				table1.addCell(cell_content);
				document.add(table1);
				table2 = new Table(2);
				table2.setPadding(1);
				m = 65;
				for (DesignCheckboxOption designCheckboxOption : designCheckboxOptionList) {
					if(designCheckbox.getDesignCheckboxId().equals(designCheckboxOption.getDesignCheckboxId())) {
						Cell cell_optioncontent = new Cell(new Phrase((char) m++ +". " + designCheckboxOption.getDesignCheckboxOptionContent(), setOptionContentFont()));
						table2.addCell(cell_optioncontent);
					}
				}
				document.add(table2);
			}
			
			for (DesignText designText : designTextList) {
				table1 = new Table(1);
				table1.setPadding(5);
				Cell cell_content = new Cell(new Phrase(n++ + "、" + designText.getDesignTextContent() + "（问答）", setContentFont()));
				table1.addCell(cell_content);
				document.add(table1);
			}

			// 关闭文档
			document.close();
		} catch (BadElementException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		ResponseEntity<byte[]> responseEntity = null;

		try {

			// 下载文件
			File file = new File(url);
			HttpHeaders headers = new HttpHeaders();
			headers.setContentDispositionFormData("attachment", name);
			headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
			responseEntity = new ResponseEntity<byte[]>(
					FileUtils.readFileToByteArray(file), headers,
					HttpStatus.CREATED);

		} catch (IOException e) {
			// TODO Auto-generated catch block
			System.out.println("IO异常");
			e.printStackTrace();
		}

		return responseEntity;

	}

	@RequestMapping(value = "/printPDF")
	public void printPDF(HttpServletRequest request,
			HttpServletResponse response, HttpSession session, Model model,
			String designTempletId) {
		System.out.println("迟来的web:printPDF请求。。。");

	}

	
	//三种字体：导出pdf需要（标题、问题内容、选项内容）
	public Font setTitleFont() {
		Font font = null;
		try {
			BaseFont baseFont = BaseFont.createFont("STSong-Light",
					"UniGB-UCS2-H", BaseFont.NOT_EMBEDDED);//显示汉字需要设置
			font = new Font(baseFont, 24, Font.BOLD, Color.black);//设置字体
		} catch (DocumentException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return font;
	}

	public Font setContentFont() {
		Font font = null;
		try {
			BaseFont baseFont = BaseFont.createFont("STSong-Light",
					"UniGB-UCS2-H", BaseFont.NOT_EMBEDDED);
			font = new Font(baseFont, 14, Font.NORMAL, Color.black);
		} catch (DocumentException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return font;
	}

	public Font setOptionContentFont() {
		Font font = null;
		try {
			BaseFont baseFont = BaseFont.createFont("STSong-Light",
					"UniGB-UCS2-H", BaseFont.NOT_EMBEDDED);
			font = new Font(baseFont, 12, Font.NORMAL, Color.black);
		} catch (DocumentException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return font;
	}

	/**
	 * 获取UserOperateLog对象
	 * 
	 * @param session
	 * @param userOperateProjectId
	 * @return
	 */
	public UserOperateLog getUserOperateLog(HttpSession session,
			String userOperateProjectId) {

		Date date = new Date();

		User user = (User) session.getAttribute("user_session");

		String account = null;
		if (user != null) {
			account = user.getAccount();
		}// 屏蔽httpclient清除session

		UserOperateLog userOperateLog = new UserOperateLog();
		userOperateLog.setUserOperateLogId(getUUID());
		userOperateLog.setUserOperateTime(date);
		userOperateLog.setUserOperateAccount(account);
		userOperateLog.setUserOperateProjectId(userOperateProjectId);

		return userOperateLog;

	}

	public String getUUID() {

		UUID uuid = UUID.randomUUID();

		String temp = uuid.toString();

		return temp;

	}

}
