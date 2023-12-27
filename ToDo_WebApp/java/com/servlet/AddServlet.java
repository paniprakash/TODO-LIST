package com.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.DAO.todoDao;
import com.database.DbConnection;

@WebServlet("/add_todo")
public class AddServlet extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 String name=req.getParameter("username");
		 String todo=req.getParameter("todo");
		 String status=req.getParameter("status");
		 
		todoDao obj=new todoDao(DbConnection.getConn());
		boolean f=obj.addtodo(name, todo, status);
		
		HttpSession session=req.getSession();
		
		if(f) {
			session.setAttribute("sucMsg", "1");
			resp.sendRedirect("add_todo.jsp"); 
			
		} else {
			session.setAttribute("errMsg", "0");
			resp.sendRedirect("add_todo.jsp"); 
		}
	}

}


