package com.controller;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dao.CategoryDAO;
import com.dao.ProductDAO;
import com.dao.SupplierDAO;
import com.model.Category;
import com.model.Product;
import com.model.Supplier;

@Controller
public class AdminController {

	@Autowired
	 SupplierDAO supplierDAO;
	
	@Autowired
	CategoryDAO categoryDAO;
	
	@Autowired
	ProductDAO productDAO;
	private Path path;

//supplier_controller
	 @RequestMapping(value="/supplier",method=RequestMethod.GET)
	    public String showSupplier(@ModelAttribute("supplier")Supplier supplier, BindingResult result, Model m, RedirectAttributes redirectAttrs  )
	    {
	       List<Supplier> listSupplier=supplierDAO.retrieveSupplier();    
	        m.addAttribute("supplierList",listSupplier);
	       
	        m.addAttribute("SupplierPageClicked", "true");
	        return "supplier";
	     
	    }
	 
	@RequestMapping("supplier")
	public String goToSupplierPage(@ModelAttribute("supplier") Supplier supplier,Model model)
	{
	
		model.addAttribute("supplier",new Supplier());
	
		return "supplier";


	}

	@RequestMapping("/AddSupplier")
	public ModelAndView saveSupplierData(@ModelAttribute("supplier") Supplier supplier,BindingResult result)
	
		{
		ModelAndView m = new ModelAndView();
			if (result.hasErrors()) {
			   m.setViewName("index");	 
			   return m;
			 
			}
			else{
				supplierDAO.addSupplier(supplier);
				m.setViewName("supplier");
			}
		
	   return m;
	}
	 
     @RequestMapping("editsupplier/{sid}")
		public String editSupplier(@PathVariable("sid") int id, Model model,RedirectAttributes attributes) {
			System.out.println("editCategory");
			attributes.addFlashAttribute("supplier", this.supplierDAO.getSupplierById(id));
			return "redirect:/supplier";
	}

     @RequestMapping(value = "removesupplier/{sid}")
		public String removeSupplier(@PathVariable("sid") int id,RedirectAttributes attributes) throws Exception 
		{supplierDAO.removeSupplierById(id);
			attributes.addFlashAttribute("DeleteMessage", "supplier has been deleted Successfully");
			return "redirect:/supplier";
	}
	 
//category_controller
	 @RequestMapping(value="/category",  method=RequestMethod.GET)
		    public String listOfCategory(@ModelAttribute("category") Category category,  BindingResult result, Model model, RedirectAttributes redirectAttrs) {
		       
			 List<Category> listCategory=categoryDAO.retrieveCategory();	    
		         model.addAttribute("categoryList",listCategory);
		         model.addAttribute("CategoryPageClicked", "true");
		        
		       return "category";
	 }

     @RequestMapping("category")
 	public String goToCategoryPage(@ModelAttribute("category") Category category,Model model)
 	{
 	
 		model.addAttribute("category",new Category());
 	
 		return "category";


 	}

 	@RequestMapping("/AddCategory")
 	public ModelAndView saveCategoryData(@ModelAttribute("category") Category category,BindingResult result)
 	
 		{
 		ModelAndView m = new ModelAndView();
 			if (result.hasErrors()) {
 			   m.setViewName("index");	 
 			   return m;
 			 
 			}
 			else{
 				categoryDAO.addCategory(category);
 				m.setViewName("category");
 			}
 		
 	   return m;
 	}
 	 
 	@RequestMapping("editcategory/{cid}")
	public String editCategory(@PathVariable("cid") int id, Model model,RedirectAttributes attributes) {
		System.out.println("editCategory");
		attributes.addFlashAttribute("category", this.categoryDAO.getCategoryById(id));
		return "redirect:/category";
   }
 	
    @RequestMapping(value ="removecategory/{cid}")
			public String removeCategory(@PathVariable("cid") int id,RedirectAttributes attributes) throws Exception {
				categoryDAO.removeCategoryById(id);
				attributes.addFlashAttribute("DeleteMessage", "Category has been deleted Successfully");
				return "redirect:/category";
	}	
    
//product_controller    
    @RequestMapping(value="/product",method=RequestMethod.GET)
   	public String getProductPage(@ModelAttribute("product") Product product,Model model)
   		
   		{
   		 model.addAttribute("categoryList", categoryDAO.retrieveCategory());
   		model.addAttribute("supplierList", supplierDAO.retrieveSupplier());
   		model.addAttribute("productList", productDAO.retrieveProduct());
   	    model.addAttribute("ProductPageClicked", "true");
   			return "product";
   			
   		}

   	
   		
    
   	 @RequestMapping(value="/saveProduct")
   		public String saveProduct(@ModelAttribute("product") Product product,HttpServletRequest request,Model m){
            
   		    MultipartFile file = product.getImage();
   			String rootDirectory = request.getSession().getServletContext().getRealPath("/");
   			path = Paths.get(rootDirectory + "/resources/" + product.getId() + ".jpg");
   			if (file != null && !file.isEmpty()) {
   				try {
   					System.out.println("Image Saving Start");
   					file.transferTo(new File(path.toString()));
   					System.out.println("Image Saved");
   				} catch (Exception e) {
   					e.printStackTrace();
   					System.out.println("Error");
   					throw new RuntimeException("item image saving failed.", e);
   				}
   			}
   			productDAO.saveProduct(product);
   			product.setInstock(true);
   			return "redirect:/product";
   		}	
   		
   		
   		
   		
   		 @RequestMapping(value="/updateProduct?id")
   			public ModelAndView updateProduct(@PathVariable("id") int id)
   			{
   			       ModelAndView m = new ModelAndView();
   			       Product p = productDAO.getProductById(id);
   			       m.addObject("product", p);
   			       m.addObject("categoryList", categoryDAO.retrieveCategory());
   			       m.addObject("supplierList", supplierDAO.retrieveSupplier());
   			       m.setViewName("updateProduct");
   				   return m;
   			}
   			
   		@RequestMapping(value="/updateProd", method=RequestMethod.POST)
           public String updateProd(@ModelAttribute("product") Product product,HttpServletRequest request,Model m){
            
   		    MultipartFile file = product.getImage();
   			String rootDirectory = request.getSession().getServletContext().getRealPath("/");
   			path = Paths.get(rootDirectory + "/resources/" + product.getId() + ".jpg");
   			if (file != null && !file.isEmpty()) {
   				try {
   					System.out.println("Image Saving Start");
   					file.transferTo(new File(path.toString()));
   					System.out.println("Image Saved");
   				} catch (Exception e) {
   					e.printStackTrace();
   					System.out.println("Error");
   					throw new RuntimeException("item image saving failed.", e);
   				}
   			}
   			productDAO.updateProduct(product);
   			product.setInstock(true);
   			return "redirect:/product";
   		}	
   		 
   			@RequestMapping(value="deleteProduct/{id}",method=RequestMethod.GET)
   			public String deleteProduct(@PathVariable("id") int id)
   			{
   				productDAO.deleteProduct(id);
   				return "redirect:/product";
   			   }
   			
   			
   		   @RequestMapping(value="admin",method=RequestMethod.GET)
			public String adminpage(){
				return "admin";
			}
   		
   		   @RequestMapping(value="index",method=RequestMethod.GET)
   				public String homepage(){
   					return "index";
   		   }
}

