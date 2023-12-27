package com.servlet;

import java.io.IOException;


import com.DAO.todoDao;
import com.database.DbConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/delete")
public class deleteServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int n=Integer.parseInt(req.getParameter("key"));
		
		todoDao td=new todoDao(DbConnection.getConn());
		
		boolean f=td.deleteTodo(n);
		
		if(f) {
		
			resp.sendRedirect("index.jsp");
		}
	}

}
