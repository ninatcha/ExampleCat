package com.example.demo.dao;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.transaction.TransactionalException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.example.demo.model.PackageModel;

@Component
@Repository
public class PackageDAO implements Serializable{
	
	@Autowired
	private JdbcTemplate jdbcTemplateObject;
	
	public int insert(PackageModel packageModel) {
		int commit = 0;
		String sql = "";
		try {
			if(packageModel != null) {
				ArrayList<Object> dataList = new ArrayList<Object>();
				dataList.add(packageModel.getPackageId());
				dataList.add(packageModel.getPackageName());
				dataList.add(packageModel.getAmount());
				
				StringBuffer strSql = new StringBuffer("INSERT INTO package(PACKAGE_ID, PACKAGE_NAME, AMOUNT, CREATE_DATE) VALUES(?,?,?,current_timestamp())");
				
				
				Object[] obj = new Object[dataList.size()];
				for(int i = 0; i < obj.length; i++) {
					obj[i] = dataList.get(i);
				}
				sql = strSql.toString();
				commit += jdbcTemplateObject.update(sql,obj);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return commit;
	}
	
	public ArrayList<PackageModel> query(PackageModel packageModel) {
		boolean chk_and = false;
		String sql = "";
		PackageModel model = new PackageModel();
		ArrayList<PackageModel> arrList = new ArrayList<PackageModel>();
		ArrayList<Object> dataList = new ArrayList<Object>();
		try {
				
			StringBuffer strSql = new StringBuffer("SELECT PACKAGE_ID, PACKAGE_NAME, AMOUNT, CREATE_DATE FROM package");
			String where = "";
			if(packageModel.getPackageName() != null && !packageModel.getPackageName().equals("")) {
				if(chk_and) {
					where += " AND ";
				}
				where += "PACKAGE_NAME = ?";
				dataList.add(packageModel.getPackageName());
				chk_and = true;
			}
			
			
			if(packageModel.getAmount() != null && !packageModel.getAmount().equals("")) {
			 if(chk_and) { 
				 where += " AND "; 
			 } 
			 	where += "AMOUNT = ?";
			 	dataList.add(packageModel.getAmount()); chk_and = true; 
			}
			  
			  if(packageModel.getWhereDate() != null && !packageModel.getWhereDate().equals("")) { 
				  if(chk_and) { 
					  where += " AND "; 
				  }
				  	where += "CREATE_DATE like ?"; 
				  	dataList.add(packageModel.getWhereDate()+"%");
				  	chk_and = true; 
				  }
			 
			
			if(chk_and) {
				strSql.append(" WHERE "+where);
			}
			
			
			Object[] obj = new Object[dataList.size()];
			for(int i = 0; i < obj.length; i++) {
				obj[i] = dataList.get(i);
			}
			List<Map<String, Object>> rows = jdbcTemplateObject.queryForList(strSql.toString(), obj);
			if(rows.size() > 0 ) {
				for(Map<String, Object> map : rows) {
					model = new PackageModel();
					model.setPackageId((Integer)map.get("PACKAGE_ID"));
					model.setPackageName((String)map.get("PACKAGE_NAME"));
					model.setAmount((Integer)map.get("AMOUNT"));
					model.setCreateDate((java.sql.Timestamp)map.get("CREATE_DATE"));
					arrList.add(model);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return arrList;
	}
	
	public int delete(PackageModel packageModel) {
		int commit = 0;
		String sql = "";
		ArrayList<Object> dataList = new ArrayList<Object>();
		try {
			StringBuffer strSql = new StringBuffer("DELETE FROM package WHERE ");
			if(packageModel.getPackageId() != null && !packageModel.getPackageId().equals("")) {
				strSql.append("PACKAGE_ID = ?");
				dataList.add(packageModel.getPackageId());
			}
			Object[] obj = new Object[dataList.size()];
			for(int i = 0; i < obj.length; i++) {
				obj[i] = dataList.get(i);
			}
			
			sql = strSql.toString();
			System.out.println("DAO sql = "+sql);
			commit += jdbcTemplateObject.update(sql, obj);
			System.out.println("commit ::: "+commit);
			
		} catch (DataAccessException e) { commit = 0;
			 System.out.println("PackageDAO.delete : DataAccessException --> "+e); 
		}catch(TransactionalException e) { commit = 0;
			System.out.println("PackageDAO.delete : TransactionalException --> "+e);
			 
		}catch (Exception e) {
			commit = 0;
			System.out.println("PackageDAO.delete : Exception --> "+e);
		}
		
		return commit;
	}
	
	
	public ArrayList<PackageModel> queryAll() {
		boolean chk_and = false;
		String sql = "";
		PackageModel model = new PackageModel();
		ArrayList<PackageModel> arrList = new ArrayList<PackageModel>();
		ArrayList<Object> dataList = new ArrayList<Object>();
		try {
				
			StringBuffer strSql = new StringBuffer("SELECT PACKAGE_ID, PACKAGE_NAME, AMOUNT, CREATE_DATE FROM package");
			/*
			 * String where = ""; if(packageModel.getPackageName() != null &&
			 * !packageModel.getPackageName().equals("")) { if(chk_and) { where += " AND ";
			 * } where += "PACKAGE_NAME = ?"; dataList.add(packageModel.getPackageName());
			 * chk_and = true; }
			 * 
			 * 
			 * if(packageModel.getAmount() != null && !packageModel.getAmount().equals(""))
			 * { if(chk_and) { where += " AND "; } where += "AMOUNT = ?";
			 * dataList.add(packageModel.getAmount()); chk_and = true; }
			 * 
			 * if(packageModel.getWhereDate() != null &&
			 * !packageModel.getWhereDate().equals("")) { if(chk_and) { where += " AND "; }
			 * where += "CREATE_DATE like ?"; dataList.add(packageModel.getWhereDate()+"%");
			 * chk_and = true; }
			 * 
			 * 
			 * if(chk_and) { strSql.append(" WHERE "+where); }
			 * 
			 * 
			 * Object[] obj = new Object[dataList.size()]; for(int i = 0; i < obj.length;
			 * i++) { obj[i] = dataList.get(i); }
			 */
			List<Map<String, Object>> rows = jdbcTemplateObject.queryForList(strSql.toString());
			if(rows.size() > 0 ) {
				for(Map<String, Object> map : rows) {
					model = new PackageModel();
					model.setPackageId((Integer)map.get("PACKAGE_ID"));
					model.setPackageName((String)map.get("PACKAGE_NAME"));
					model.setAmount((Integer)map.get("AMOUNT"));
					model.setCreateDate((java.sql.Timestamp)map.get("CREATE_DATE"));
					arrList.add(model);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return arrList;
	}

}
