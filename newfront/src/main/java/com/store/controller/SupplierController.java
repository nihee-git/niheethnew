package com.store.controller;





import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.niheeth.niheethbackend.dao.Supplierdao;
import com.niheeth.niheethbackend.model.Supplier;




@Controller
public class SupplierController {
	
	@RequestMapping("/AddSupplier")
	public ModelAndView showSupplier()
	{
		ModelAndView mv= new ModelAndView("AddSupplier");
		mv.addObject("supplierList", supplierdao.list());
		return mv;
	}
	
	@Autowired
	private Supplierdao supplierdao;
	
	@Autowired
	private Supplier supplier;
	
	@ModelAttribute
	public Supplier returnObject()
	{
		return new Supplier();
	}
	
	@RequestMapping(value="/addsup",method=RequestMethod.POST)
	public String addcat(@ModelAttribute("supplier")Supplier supplier,BindingResult result,HttpServletRequest request,Model model) throws IOException
	{
		model.addAttribute("supplier",new Supplier());
		if(supplier.getSupplierid()==0)
		{
			supplierdao.saveOrUpdate(supplier);
			System.out.println("supplier added");
		}
		else
		{
			supplierdao.saveOrUpdate(supplier);
			System.out.println("supplier updated");
		}
		return "redirect:/AddSupplier";
	}
	
	@RequestMapping(value="/editsupplier{id}")
	public ModelAndView updateSupplier(@PathVariable("id")String name,Model model)
	{
	
	model.addAttribute("supplier", supplierdao.get(name));
	model.addAttribute("supplierList", supplierdao.list());
	ModelAndView mv=new ModelAndView("AddSupplier");
	return mv;
	}
	
	@RequestMapping(value="/deletesupplier{name}")
	public ModelAndView deleteSupplier(@PathVariable("name")String name,Model model)
	{
	
	supplier = supplierdao.get(name);
	System.out.println(supplier.getSuppliername());
	supplierdao.delete(supplier.getSuppliername());
	model.addAttribute("supplierList", supplierdao.list());
	ModelAndView mv=new ModelAndView("AddSupplier");
	mv.addObject("addsupplier", 0);
	return mv;
	}

}

