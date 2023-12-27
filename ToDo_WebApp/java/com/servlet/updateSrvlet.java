package com.servlet;

import java.io.IOException;
import java.sql.PreparedStatement;

import com.DAO.todoDao;
import com.Entity.entity;
import com.database.DbConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/edit")
public class updateSrvlet extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 int id=Integer.parseInt(req.getParameter("id"));
		 String name=req.getParameter("username");
		 String todo=req.getParameter("todo");
		 String status=req.getParameter("status");
		 
		todoDao t=new todoDao(DbConnection.getConn());
		
		entity en=new entity();
		en.setId(id);
		en.setName(name);
		en.setTodo(todo);
		en.setStatus(status);
		
		boolean b=t.updateTodo(en);
		HttpSession session=req.getSession();
		if(b) {
			 session.setAttribute("suMsg", "10"); 
			resp.sendRedirect("index.jsp");
		} else {
			
			 session.setAttribute("erMsg","11"); 
			resp.sendRedirect("index.jsp");
			
		}
	}

}
