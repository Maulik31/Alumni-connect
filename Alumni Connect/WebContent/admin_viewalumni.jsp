<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>

	 <%-- <%
			String uname= (String)session.getAttribute("username");
			if(uname == null)
			{
				request.setAttribute("msg", "Please login first");
				RequestDispatcher rd = request.getRequestDispatcher("adminlogin.jsp");
				rd.forward(request, response);
			}
		%>  --%>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>View Alumni</title>

  <!-- Bootstrap core CSS -->
  <link href="DashCss/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="DashCss/css/simple-sidebar.css" rel="stylesheet">
  <meta name="viewport" content="width=device-width, initial-scale=1">
 
</head>

<body style="background-image: linear-gradient(to top, #fbc2eb 0%, #a6c1ee 100%);" data-spy="scroll" data-target=".navbar" data-offset="50">

  <div class="d-flex" id="wrapper">

    <!-- Sidebar -->
   <jsp:include page="admin_sidebar.jsp"></jsp:include>
    <!-- /#sidebar-wrapper -->

    <!-- Page Content -->
    <div id="page-content-wrapper">

     <jsp:include page="admin_nav.jsp"></jsp:include>

     <div class="container-fluid">
		 <div class="row">
		 <div class="col-md-4 m-auto"> 
		 <h1 class="text-success a-center">Panding Varification</h1>
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
								<th scope="col">Password</th>
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
						<td>${data.password}</td>
						
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

    <!-- /#page-content-wrapper -->

  </div>
  <!-- /#wrapper -->

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Menu Toggle Script -->
  <script>
    $("#menu-toggle").click(function(e) {
      e.preventDefault();
      $("#wrapper").toggleClass("toggled");
    });
  </script>

</body>

</html>
     