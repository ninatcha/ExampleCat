package com.example.demo.controller;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dao.PackageDAO;
import com.example.demo.model.PackageModel;
import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

@Controller
/* @RequestMapping("/package") */
public class PackageController {
   
	@Autowired 
    private PackageDAO dao;
	
	@GetMapping("/packagea")
    public String reg(Map<String, Object> model) {
          return "AddPackage";
    }
	
	@GetMapping("/view")
    public String view(Map<String, Object> model) {
          return "ViewPackage";
    }
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST, produces = {"application/json; charset=UTF-8;"})
	public @ResponseBody String save(Model model,
	       @RequestParam(value = "packageID", defaultValue = "") Integer packageID,
	       @RequestParam(value = "packageName", defaultValue = "") String packageName,
	       @RequestParam(value = "amount", defaultValue = "") Integer amount) {
	 	   JsonObject jObj = new JsonObject();
	 	   String msg = "";
	 	   int re = 0;
	 	   Date now = new Date();
	 	   
	 	   PackageModel packageModel = new PackageModel();
		
	 	   packageModel.setPackageId(packageID);
	 	   packageModel.setPackageName(packageName); packageModel.setAmount(amount);
	 	  // packageModel.setCreateDate("");
	 	   re = dao.insert(packageModel);
		   if(re != 0) {
			   msg = "Insert success";
		   }else {
			   msg = "Insert unsuccess";
		   }
		   jObj.addProperty("message", msg);
	 	   
		return new Gson().toJson(jObj);
	}
	
	@RequestMapping(value = "/find", method = RequestMethod.POST, produces = {"application/json; charset=UTF-8;"})
	public @ResponseBody String search(Model model,
	       @RequestParam(value = "packageName", defaultValue = "") String packageName,
	       @RequestParam(value = "amount", defaultValue = "") Integer amount,
	       @RequestParam(value = "createDate", defaultValue = "") String createDate) throws ParseException {
	 	   JsonObject jObj = new JsonObject();
	 	   ArrayList<PackageModel> arrList = new ArrayList<PackageModel>();
		   PackageModel packageModel = new PackageModel();
		   packageModel.setPackageName(packageName); packageModel.setAmount(amount);
		   packageModel.setAmount(amount);
		   packageModel.setWhereDate(createDate); 
		  
		   arrList = dao.query(packageModel);
		   Gson gson = new Gson();
		   JsonElement result = gson.toJsonTree(arrList);
		   jObj.add("dataList", result);
	 	   
		return new Gson().toJson(jObj);
	}
	@RequestMapping(value = "/delete", method = RequestMethod.POST, produces = {"application/json; charset=UTF-8;"})
	public @ResponseBody String delete(Model model,
	       @RequestParam(value = "packageID", defaultValue = "") Integer packageID){
	 	   String msg = "";
	 	   int re = 0;
		   JsonObject jObj = new JsonObject();
		   PackageModel packageModel = new PackageModel();
		   packageModel.setPackageId(packageID);
		  
		   re = dao.delete(packageModel);
		   if(re != 0) {
			   msg = "Delete success";
		   }else {
			   msg = "Delete unsuccess";
		   }
		   jObj.addProperty("message", msg);
	 	   
		return new Gson().toJson(jObj);
	}
	
	
	@RequestMapping(value = "/findAll", method = RequestMethod.POST, produces = {"application/json; charset=UTF-8;"})
	public @ResponseBody String searchAll(Model model) throws ParseException {
	 	   JsonObject jObj = new JsonObject();
	 	   ArrayList<PackageModel> arrList = new ArrayList<PackageModel>();
		   arrList = dao.queryAll();
		   Gson gson = new Gson();
		   JsonElement result = gson.toJsonTree(arrList);
		   jObj.add("dataList", result);
	 	   
		return new Gson().toJson(jObj);
	}
}
