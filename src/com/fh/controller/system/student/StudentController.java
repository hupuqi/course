package com.fh.controller.system.student;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.util.AppUtil;
import com.fh.util.ObjectExcelView;
import com.fh.util.Const;
import com.fh.util.PageData;
import com.fh.util.Tools;
import com.fh.util.Jurisdiction;
import com.fh.service.system.student.StudentService;

/** 
 * 类名称：StudentController
 * 创建人：FH 
 * 创建时间：2018-03-26
 */
@Controller
@RequestMapping(value="/student")
public class StudentController extends BaseController {
	
	String menuUrl = "student/list.do"; //菜单地址(权限用)
	@Resource(name="studentService")
	private StudentService studentService;
	
	/**
	 * 新增
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, "新增Student");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("studentId", this.get32UUID());	//主键
		pd.put("studentCreatetime", new Date());
		if(pd.get("studentPassword")!=null&&!pd.get("studentPassword").equals("")){
			String passwd = new SimpleHash("SHA-1", pd.get("studentNo"), pd.get("studentPassword")).toString(); // 密码加密
			pd.put("studentPassword", passwd);
		}
		if(pd.get("studentDatetime")!=null&&pd.get("studentDatetime").equals("")){
			pd.remove("studentDatetime");
		}
		
		studentService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 删除
	 */
	@RequestMapping(value="/del")
	public void del(PrintWriter out){
		logBefore(logger, "删除Student");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			studentService.delete(pd);
			out.write("success");
			out.close();
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		
	}
	
	/**
	 * 修改
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, "修改Student");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		if(pd.get("studentPassword")!=null&&!pd.get("studentPassword").equals("")){
			String passwd = new SimpleHash("SHA-1", pd.get("studentNo"), pd.get("studentPassword")).toString(); // 密码加密
			pd.put("studentPassword", passwd);
		}
		if(pd.get("studentDatetime")!=null&&pd.get("studentDatetime").equals("")){
			pd.remove("studentDatetime");
		}
		studentService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 列表
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page){
		logBefore(logger, "列表Student");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			page.setPd(pd);
			List<PageData>	varList = studentService.list(page);	//列出Student列表
			mv.setViewName("system/student/student_list");
			mv.addObject("varList", varList);
			mv.addObject("pd", pd);
			mv.addObject(Const.SESSION_QX,this.getHC());	//按钮权限
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/**
	 * 去新增页面
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd(){
		logBefore(logger, "去新增Student页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			mv.setViewName("system/student/student_edit");
			mv.addObject("msg", "save");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}	
	
	/**
	 * 去修改页面
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit(){
		logBefore(logger, "去修改Student页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();//获取前台传来的数据
		try {
			pd = studentService.findById(pd);	//根据前台传的数据进行查询
			mv.setViewName("system/student/student_edit");//跳转的页面
			mv.addObject("msg", "edit");//给页面的传值
			mv.addObject("pd", pd);//给页面的传值
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}	
	
	/**
	 * 批量删除
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() {
		logBefore(logger, "批量删除Student");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "dell")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			pd = this.getPageData();
			List<PageData> pdList = new ArrayList<PageData>();
			String DATA_IDS = pd.getString("DATA_IDS");
			if(null != DATA_IDS && !"".equals(DATA_IDS)){
				String ArrayDATA_IDS[] = DATA_IDS.split(",");
				studentService.deleteAll(ArrayDATA_IDS);
				pd.put("msg", "ok");
			}else{
				pd.put("msg", "no");
			}
			pdList.add(pd);
			map.put("list", pdList);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logAfter(logger);
		}
		return AppUtil.returnObject(pd, map);
	}
	
	/*
	 * 导出到excel
	 * @return
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel(){
		logBefore(logger, "导出Student到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			Map<String,Object> dataMap = new HashMap<String,Object>();
			List<String> titles = new ArrayList<String>();
			titles.add("String");	//1
			titles.add("String");	//2
			titles.add("Date");	//3
			titles.add("String");	//4
			titles.add("String");	//5
			titles.add("String");	//6
			titles.add("String");	//7
			titles.add("String");	//8
			titles.add("String");	//9
			titles.add("String");	//10
			titles.add("String");	//11
			titles.add("String");	//12
			titles.add("String");	//13
			titles.add("String");	//14
			titles.add("Date");	//15
			titles.add("String");	//16
			titles.add("String");	//17
			titles.add("String");	//18
			titles.add("String");	//19
			titles.add("String");	//20
			dataMap.put("titles", titles);
			List<PageData> varOList = studentService.listAll(pd);
			List<PageData> varList = new ArrayList<PageData>();
			for(int i=0;i<varOList.size();i++){
				PageData vpd = new PageData();
				vpd.put("var1", varOList.get(i).getString("studentId"));	//1
				vpd.put("var2", varOList.get(i).getString("studentCreditselect"));	//2
				vpd.put("var3", varOList.get(i).getString("studentEntrydate"));	//3
				vpd.put("var4", varOList.get(i).getString("studentEarnedcredit"));	//4
				vpd.put("var5", varOList.get(i).getString("studentRepaircredit"));	//5
				vpd.put("var6", varOList.get(i).getString("studentUnearnedcredit"));	//6
				vpd.put("var7", varOList.get(i).getString("studentClass"));	//7
				vpd.put("var8", varOList.get(i).getString("studentMajor"));	//8
				vpd.put("var9", varOList.get(i).getString("studentAcademy"));	//9
				vpd.put("var10", varOList.get(i).getString("studentSchool"));	//10
				vpd.put("var11", varOList.get(i).getString("studentName"));	//11
				vpd.put("var12", varOList.get(i).getString("studentNo"));	//12
				vpd.put("var13", varOList.get(i).getString("studentPassword"));	//13
				vpd.put("var14", varOList.get(i).getString("studentGender"));	//14
				vpd.put("var15", varOList.get(i).getString("studentDatetime"));	//15
				vpd.put("var16", varOList.get(i).getString("studentPhone"));	//16
				vpd.put("var17", varOList.get(i).getString("studentEmail"));	//17
				vpd.put("var18", varOList.get(i).getString("studentAddress"));	//18
				vpd.put("var19", varOList.get(i).getString("studentStatus"));	//19
				vpd.put("var20", varOList.get(i).getString("studentCreatetime"));	//20
				varList.add(vpd);
			}
			dataMap.put("varList", varList);
			ObjectExcelView erv = new ObjectExcelView();
			mv = new ModelAndView(erv,dataMap);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/* ===============================权限================================== */
	public Map<String, String> getHC(){
		Subject currentUser = SecurityUtils.getSubject();  //shiro管理的session
		Session session = currentUser.getSession();
		return (Map<String, String>)session.getAttribute(Const.SESSION_QX);
	}
	/* ===============================权限================================== */
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
