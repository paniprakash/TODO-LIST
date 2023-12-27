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
   <%
    String f=(String)session.getAttribute("sucMsg");
   
   if(f=="1"){
	   %>
	   <script >
	    window.addEventListener('load',function(){
	    	swal({
	    		  title: "Done",
	    		  text: "Todo Added Scussfully",
	    		  icon: "success",
	    		  button: "OK",
	    		});
	    });
	   </script>
	   <%
	   session.removeAttribute("sucMsg");
   }
   %>
   
   
   <%
    String g=(String)session.getAttribute("errMsg");
   
   if(g=="0"){
	   %>
	   <script >
	    window.addEventListener('load',function(){
	    	 
	    	swal ( "Oops" ,  "Something went wrong!" ,  "error" )
	    });
	   </script>
	   <%
	   session.removeAttribute("errMsg");
   }
   %>
   <div class="container p-4 " >
      <div class="col-md-6 offset-md-3">
         <div class="card">
            <div class="card-body">
              <h3 class="text-center font-weight-bold ">Add Todo</h3>
              <form action="add_todo" method="post">
              
              <div class="form-group">
			    <label for="exampleInputEmail1">NAME</label>
			    <input type="text" name="username" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Your Name">
			  </div>
			  <div class="form-group">
			    <label for="exampleInputEmail1">TODO</label>
			    <input type="text" name="todo" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Todo">
			  </div>
			  <div class="form-group">
			    <label for="exampleInputPassword1">STATUS</label>
			  <select class="form-control" id="exampleFormControlSelect1" name="status">
				  <option selected>Select here</option>
			      <option value="complete">Complete</option>
			      <option  value="pending">Pending</option>
		      </select>
			  </div>
			  <div class="text-center">
			  <button type="submit" class="btn btn-primary">Add Task</button>
			  </div>
			</form>
            </div>
         </div>
      </div>
   </div>
<%@include file="Component/css_js_BootStrapFile.jsp" %>
</body>
</html>