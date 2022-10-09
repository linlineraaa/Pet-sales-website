package com.briup.action;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ApplicationAware;
import org.springframework.stereotype.Controller;


import com.briup.entity.Notice;
import com.briup.entity.PageBean;
import com.briup.entity.Product;
import com.briup.entity.ProductBigType;


import com.briup.service.NoticeService;
import com.briup.service.ProductBigTypeService;
import com.briup.service.ProductService;

import com.briup.util.ResponseUtil;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 系统Action类
 * @author Administrator
 *
 */
@Controller
public class SysAction extends ActionSupport implements ApplicationAware{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Map<String, Object> application;
	
	/**
	 * 商品大类service
	 */
	@Resource
	private ProductBigTypeService productBigTypeService;
	
	
	
	/**
	 * 公告service
	 */
	@Resource
	private NoticeService noticeService;
	

	
	/**
	 * 商品service
	 */
	@Resource
	private ProductService productService;
	
	public void setApplication(Map<String, Object> application) {
		this.application= application;
	}
	
	/**
	 * 刷新系统
	 * @return
	 * @throws Exception
	 */
	public String refreshSystem()throws Exception{
		List<ProductBigType> bigTypeList=productBigTypeService.findAllBigTypeList();
		application.put("bigTypeList", bigTypeList);
		
		
		
		List<Notice> noticeList=noticeService.findNoticeList(null, new PageBean(1,7));
		application.put("noticeList", noticeList);
		
		
		// 今日特价
		Product s_product=new Product();
		s_product.setSpecialPrice(1);
		List<Product> specialPriceProductList= productService.findProductList(s_product, new PageBean(1, 8));
		application.put("specialPriceProductList", specialPriceProductList);
		
		return null;
	}
}
