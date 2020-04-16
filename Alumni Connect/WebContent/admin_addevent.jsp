<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Add Services</title>

  <!-- Bootstrap core CSS -->
  <link href="DashCss/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="DashCss/css/simple-sidebar.css" rel="stylesheet">

</head>

<body style="background-image: linear-gradient(to top, #fbc2eb 0%, #a6c1ee 100%);">

  <div class="d-flex" id="wrapper">

    <!-- Sidebar -->
   <jsp:include page="admin_sidebar.jsp"></jsp:include>
    <!-- /#sidebar-wrapper -->

    <!-- Page Content -->
    <div id="page-content-wrapper">

     <jsp:include page="admin_nav.jsp"></jsp:include>

      <div class="container-fluid">
      <div class="row">
       	<h2 class="text-success m-auto">Add Event</h2>
      </div>
      
       	<div class="row">
      
			<div class="col-md-4 m-auto card">
				
				<form action="addevent" method="POST">
					
					<h2 class="text-danger">${emsg}</h2>
		
					<div class="form-group">
					<div class="form-group">

					     <input type="hidden" name="eid" class="form-control" value="${data.eid}">
						<label>Service Name</label> <input type="text" name="ename" class="form-control" value="${data.event_name}">
						<label>Service Details</label> <input type="text" name="edetails" class="form-control" value="${data.event_detail}">
						
					</div>
					<div class="form-group">
                        <c:if test="${data != null}">
                        
                        <input type="submit" value="update" name="action" class="btn btn-success">
                        </c:if>
                        <c:if test="${data == null}">
                        
                        <input type="submit" value="submit" name="action" class="btn btn-success">
                        </c:if>
					
						<input type="reset" name="reset" class="btn btn-primary">
					</div>
    </div>
    
    <!-- /#page-content-wrapper -->

  </div>
  </div>
  </div>
  			 <div class="container-fluid">
		 <div class="row">
		 <div class="col-md-4 m-auto"> 
		 
		 </div>
		 </div>
              <div class="col-md-12 m-auto"> 
				<div class="table" style="overflow-x: auto;">
				
					<table class="table table-hover"> 
						 <thead class="thead-dark"> 
							<tr>
								<th scope="col">Event Id</th>
								<th scope="col">Event Name</th>
								<th scope="col">Event Deatil</th>
								<th scope="col">Action</th>
								<th scope="col">Action</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="data" items="${service}">
						<tr>
						<td>${data.eid}</td>
						<td>${data.event_name}</td>
						<td>${data.event_detail}</td>
						 <th><a href ="eventmodify?id=${data.eid}&&type=delete" class="btn btn-danger" role="button">Delete</a></th>
                         <th><a href ="eventmodify?id=${data.eid}&&type=update" class="btn btn-primary" role="button">Update</a></th>
						</c:forEach>
						</tbody>
						
						
					</table>
         		</div>
			</div>
		</div>
  </div>
  </div>
  
  <!-- /#wrapper -->

  <!-- Bootstrap core JavaScript -->
  <script src="DashCss/vendor/jquery/jquery.min.js"></script>
  <script src="DashCss/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Menu Toggle Script -->
  <script>
    $("#menu-toggle").click(function(e) {
      e.preventDefault();
      $("#wrapper").toggleClass("toggled");
    });
  </script>

</body>

</html>
     