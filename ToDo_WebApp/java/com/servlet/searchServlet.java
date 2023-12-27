package com.servlet;

import java.io.IOException;
import java.util.List;

import com.DAO.todoDao;
import com.Entity.entity;
import com.database.DbConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/search")
public class searchServlet extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String status=req.getParameter("sta");
		
		todoDao td=new todoDao(DbConnection.getConn());
		List<entity> list=td.getSearch(status);
		
		HttpSession ses=req.getSession();
		if(status.equals("Pending")) {
			ses.setAttribute("sus1", list);
			resp.sendRedirect("index.jsp");
		} else if(status.equals("Complete")) {
			ses.setAttribute("sus2", list);
			resp.sendRedirect("index.jsp");
			
		} else{
			ses.setAttribute("sus3", "success");
			resp.sendRedirect("index.jsp");
		}
		
		
		
		
	}

}
