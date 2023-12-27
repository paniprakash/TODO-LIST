<nav class="navbar navbar-expand-lg navbar-dark bg-info navbar-fixed-top" style="z-index:100000;">
  <a class="navbar-brand font-weight-bold " href="index.jsp" 
  style="color:black; 
  
  ">ToDo App</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp" style="font-weight:bold; 
  
  ">Home<span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="add_todo.jsp" style="font-weight:bold; 
  
  ">Add ToDo</a>
      </li>
      
      
    </ul>
    <form class="form-inline my-2 my-lg-0" action="search" method="post">
     
      <select class="form-control " id="exampleFormControlSelect1" name="sta">
                  <option value="select">Complete & Pending</option>
                  <option value="Complete">Complete</option>
			      <option  value="Pending">Pending</option>
	  </select>
      <button class="btn btn-sm  " type="submit" id="btn" style="padding:7px 15px; background-color:hsl(0, 100%, 70%); hover:background-color:brown;">Search</button>
    </form>
  </div>
</nav>