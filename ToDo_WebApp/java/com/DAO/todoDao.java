package com.DAO;
import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.Entity.entity;

public class todoDao {

	public Connection con;

	public todoDao(Connection con) {

		this.con = con;
	}

	public boolean addtodo(String name, String todo, String status) {
		boolean f = false;

		try {
			PreparedStatement ps = con.prepareStatement("insert into addtodo (name,todo,status) values (?,?,?)");
			ps.setString(1, name);
			ps.setString(2, todo);
			ps.setString(3, status);
			int i = ps.executeUpdate();

			if (i > 0) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	 public List<entity> gettodo(){ 
		 
	  List<entity> list=new ArrayList<entity>();
	  
	  try {
		  PreparedStatement ps=con.prepareStatement("select * from addtodo");
		  ResultSet rs=ps.executeQuery();
		  
		  while(rs.next()) {
			  entity en=new entity();
			  en.setId(rs.getInt(1));
			  en.setName(rs.getString(2));
			  en.setTodo(rs.getString(3));
			  en.setStatus(rs.getString(4));
			  list.add(en);
		  }
	  }catch(Exception e) {
		  e.printStackTrace();
	  }
	  return list;
	 }
	 
	 
	 public entity getToDoById(int i) {
		 
		 entity en=null;
		 try {
			 PreparedStatement ps=con.prepareStatement("select * from addtodo where id=?");
			 ps.setInt(1, i);
			 
			 ResultSet rs=ps.executeQuery();
			 
			 while(rs.next()) {
				  en=new entity();
				  en.setId(rs.getInt(1));
				  en.setName(rs.getString(2));
				  en.setTodo(rs.getString(3));
				  en.setStatus(rs.getString(4)); 
			 }
			 
		 } catch(Exception e) {
			 e.printStackTrace();
		 }

		 return en;
	 }
	 
	 public boolean updateTodo(entity t) {
			boolean f = false;

			try {
				PreparedStatement ps = con.prepareStatement("update addtodo set name=?,todo=?,status=? where id=?");
				
				ps.setString(1,t.getName() );
				ps.setString(2,t.getTodo());
				ps.setString(3,t.getStatus());
				ps.setInt(4,t.getId());
				int i = ps.executeUpdate();

				if (i > 0) {
					f = true;
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
			return f;
		}
	 
	 
	 public boolean deleteTodo(int t) {
			boolean f = false;

			try {
				PreparedStatement ps = con.prepareStatement("delete from addtodo where id=?");
				ps.setInt(1, t);
				int n=ps.executeUpdate();
				
				if(n>0) {
					f=true;
				}
				

			} catch (Exception e) {
				e.printStackTrace();
			}
			return f;
		}
	 
	 public List<entity> getSearch(String status){
		 
		 List<entity> list=new ArrayList<entity>();
		 
		try {
			 PreparedStatement ps=con.prepareStatement("select * from addtodo where status=?");
			 ps.setString(1, status);
			 ResultSet rs=ps.executeQuery();
			 
			 while(rs.next()) {
				 entity en=new entity();
				 en.setId(rs.getInt(1));
				 en.setName(rs.getString(2));
				 en.setTodo(rs.getString(3));
				 en.setStatus(rs.getString(4));
				 list.add(en);
				 
			 }
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
		 
	 }
	 

}
