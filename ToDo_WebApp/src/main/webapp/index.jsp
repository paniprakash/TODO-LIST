<%@page import="java.util.List"%>
<%@page import="com.mysql.cj.jdbc.DatabaseMetaData"%>
<%@page import="com.DAO.todoDao"%>
<%@page import="com.database.DbConnection"%>
<%@page import="com.Entity.entity"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="Component/css_js_BootStrapFile.jsp" %>
</head>
<body style="background-color:#fdd02e;">
<!-- background: linear-gradient(90deg, rgba(2,0,36,1) 0%, rgba(245,47,165,1) 0%, rgba(255,186,0,0.9732074956784303) 100%); -->
<%@include file="Component/navbar.jsp"%>
<div >

	 	<h1 class="text-center text-danger font-weight-bold p-2" style="text-decoration: underline;">TODO LIST</h1>
		 <div class="container" >
		 
		  <%
    String f=(String)session.getAttribute("suMsg");
   
   if(f=="10"){
	   %>
	   <script >
	    window.addEventListener('load',function(){
	    	swal({
	    		  title: "Done",
	    		  text: "Todo Update Scussfully",
	    		  icon: "success",
	    		  button: "OK",
	    		});
	    });
	   </script>
	   <%
	   session.removeAttribute("suMsg");
   }
   %>
   
     
   <%
    String g=(String)session.getAttribute("erMsg");
   
   if(g=="11"){
	   %>
	   <script >
	    window.addEventListener('load',function(){
	    	 
	    	swal ( "Oops" ,  "Something went wrong!" ,  "error" )
	    });
	   </script>
	   <%
	   session.removeAttribute("erMsg");
   }
   %>
		 <table class="table table-striped " >
		  <thead style="background-color: brown; color:white; border-radius:10px;" >
		    <tr >
		      <th scope="col">ID</th>
		      <th scope="col">NAME</th>
		      <th scope="col">TODO</th>
		      <th scope="col">STATUS</th>
		      <th scope="col">ACTION</th>
		    </tr>
		  </thead>
		  <tbody>
		  
		  <%
		  todoDao td=new todoDao(DbConnection.getConn());
		  List<entity> list=td.gettodo();
		  
		  for(entity ob:list){
			  %>
			  
			  <tr style="color:black;">
		      <th scope="row"><%=ob.getId() %></th>
		      <th scope="row"><%=ob.getName() %></th>
		      <th scope="row"><%=ob.getTodo() %></th>
		      <th scope="row"><%=ob.getStatus() %></th>
		      <td>
			      <a href="edit.jsp?key=<%=ob.getId()%>" class="btn btn-sm btn-success">Edit</a>
			      <a href="delete?key=<%=ob.getId() %>"  class="btn btn-sm btn-danger">Delete</a>
		      </td>
		    </tr>
			  
			  <%
		  }
		  %>
		  
		  <%
		  Object obj = session.getAttribute("sus");
		 
		  if (obj instanceof List) {
			  List<entity> lis = (List<entity>) obj;
		      // Now you have the list, you can work with it
		     for(entity ob:lis){
				  %>
				  
				  <tr>
			      <th scope="row"><%=ob.getId() %></th>
			      <th scope="row"><%=ob.getName() %></th>
			      <th scope="row"><%=ob.getTodo() %></th>
			      <th scope="row"><%=ob.getStatus() %></th>
			      <td>
				      <a href="edit.jsp?key=<%=ob.getId()%>" class="btn btn-sm btn-success">Edit</a>
				      <a href="delete?key=<%=ob.getId() %>"  class="btn btn-sm btn-danger">Delete</a>
			      </td>
			    </tr>
				  
				  <%
		  } 
		 
		  
		  }
		  %>
		  
		  </tbody>
		</table>
		 </div>
		 </div>
   <%@include file="Component/css_js_BootStrapFile.jsp" %>
</body>
</html>