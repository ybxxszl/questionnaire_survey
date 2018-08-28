package com.tool;

import java.awt.Color;
import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.labels.ItemLabelAnchor;
import org.jfree.chart.labels.ItemLabelPosition;
import org.jfree.chart.labels.StandardCategoryItemLabelGenerator;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.renderer.category.BarRenderer3D;
import org.jfree.chart.servlet.ServletUtilities;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.ui.TextAnchor;

public class PNGControl {
	
	/**
	 * 生成PNG
	 * @param session
	 * @param dataset
	 * @param type
	 * @return
	 */
	public String getPNG(HttpSession session, DefaultCategoryDataset dataset, String type) {
		// TODO Auto-generated method stub
		
		String fileName = null;
		
		try {
			
			JFreeChart chart = ChartFactory.createBarChart3D(type + "统计图", type, "数量", dataset, PlotOrientation.VERTICAL/*纵向*/, true, true, true);//使用数据工厂创建条形3D图表
			
			CategoryPlot plot = chart.getCategoryPlot();

			// 设置网格背景颜色
			plot.setBackgroundPaint(Color.white);
			// 设置网格竖线颜色
			plot.setDomainGridlinePaint(Color.pink);
			// 设置网格横线颜色
			plot.setRangeGridlinePaint(Color.pink);

			BarRenderer3D renderer = new BarRenderer3D();

			// 显示每个柱的数值，并修改该数值的字体属性
			renderer.setBaseItemLabelGenerator(new StandardCategoryItemLabelGenerator());
			renderer.setBaseItemLabelsVisible(true);
			renderer.setBasePositiveItemLabelPosition(new ItemLabelPosition(ItemLabelAnchor.OUTSIDE12, TextAnchor.BASELINE_LEFT));
			renderer.setItemLabelAnchorOffset(10D);

			plot.setRenderer(renderer);
			
			fileName = ServletUtilities.saveChartAsPNG(chart, 700, 200, null, session);//生成PNG图片名称
			System.out.println(type + "fileName:" + fileName);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			System.out.println("IO异常");
			e.printStackTrace();
		}
		
		return fileName;
		
	}

}
