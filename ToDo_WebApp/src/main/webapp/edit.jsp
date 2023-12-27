<%@page import="com.database.DbConnection"%>
<%@page import="com.DAO.todoDao"%>
<%@page import="com.Entity.entity"%>
<%@page import="com.mysql.cj.protocol.a.NativeConstants.IntegerDataType"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="Component/css_js_BootStrapFile.jsp" %>
</head>
<body style="background-color:rgb(216,216,216);">
<%@include file="Component/navbar2.jsp" %>
  
 
   <div class="container p-4 " >
      <div class="col-md-6 offset-md-3">
         <div class="card">
            <div class="card-body">
            
            <%
            int n=Integer.parseInt(request.getParameter("key"));
            
            todoDao td=new todoDao(DbConnection.getConn());
            entity t=td.getToDoById(n);
       
            %>
            
              <h3 class="text-center font-weight-bold ">Edit Todo</h3>
              <form action="edit" method="post" >
              <input type="hidden" value="<%=n%>"  name="id">
              <div class="form-group">
			    <label for="exampleInputEmail1">NAME</label>
			    <input type="text" name="username" value="<%=t.getName()%>" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" >
			  </div>
			  <div class="form-group">
			    <label for="exampleInputEmail1">TODO</label>
			    <input type="text" name="todo" value="<%=t.getTodo()%>" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" >
			  </div>
			  <div class="form-group">
			    <label for="exampleInputPassword1">STATUS</label>
			    
			  <select class="form-control" id="exampleFormControlSelect1" name="status">
			  <% if("Pending".equals(t.getStatus())){
				  %>
				  
				  <option value="pending">Pending</option>
			      <option  value="complete">Complete</option>
				  <%
				  
			  }else{
				  %>
				  <option value="complete">Complete</option>
			      <option  value="pending">Pending</option>
				  <%
			  }
			  %>    
		      </select>
			  </div>
			  <div class="text-center">
			  <button type="submit" class="btn btn-primary">Update</button>
			  </div>
			</form>
            </div>
         </div>
      </div>
   </div>
<%@include file="Component/css_js_BootStrapFile.jsp" %>
</body>
</html>