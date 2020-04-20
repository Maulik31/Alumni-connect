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
       	<h2 class="text-success m-auto">Search</h2>
      </div>
      
       	<div class="row">
      
			<div class="col-md-4 m-auto card">
				
				<form action="ViewAlumniByCourse" method="GET">
					
				
		
					<div class="form-group">
					<div class="form-group">

					    
						<label>Course Name</label> 
						 <select name="course" required="required" class="form-control">
                                          <option disabled="disabled" selected="selected">Choose option</option>
                                          <option value="BCA">BCA</option>
                                          <option value="MCA">MCA</option>
                                          <option value="B.TECH">B.tech</option>
                                          <option value="M.TECH">M.tech</option>
                                           </select>
						
						
					</div>
					<div class="form-group">
                      
                        
                        <input type="submit" value="search" name="action" class="btn btn-success">
                       
					
						<input type="reset" name="reset" class="btn btn-primary">
					</div>
    </div>
     </form>
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
								<th scope="col">Alumni Id</th>
								<th scope="col">Full Name</th>
								<th scope="col">Enrollment NO</th>
								<th scope="col">Gender</th>
								<th scope="col">Date Of Birth</th>
								<th scope="col">Passout</th>
								<th scope="col">Institute</th>
								<th scope="col">Course</th>
								<th scope="col">Mobile NO</th>
								<th scope="col">Email</th>
								
								<th scope="col" colspan="2">Action</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="data" items="${AlumniData}">
						<tr>
						<td>${data.id}</td>
						<td>${data.name}</td>
						<td>${data.enno}</td>
						<td>${data.gender}</td>
						<td>${data.dob}</td>
						<td>${data.p_year}</td>
						<td>${data.institute}</td>
						<td>${data.course}</td>
						<td>${data.mono}</td>
						<td>${data.email}</td>
						
						
						<c:if test="${data.status == true }">
							<td><button class="btn btn-primary">Approved</button> </td>
						</c:if>
						<c:if test="${data.status == false }">
							<td><a href="status?id=${data.id}"><button class="btn btn-success">Approve</button></a></td>
						
					</c:if>
						<td><a href="deleteAlumni?id=${data.id}"><button class="btn btn-danger">Delete</button></a></td>
						
						</tr>
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
     