<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>

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
 <style>
      * {
      box-sizing: border-box;
      }
      body {
      font-family: Roboto, Helvetica, sans-serif;
      }
      /* Fix the button on the left side of the page */
      .open-btn {
      display: flex;
      justify-content: left;
      }
      /* Style and fix the button on the page */
      .open-button {
      background-color: #1c87c9;
      color: white;
      padding: 12px 20px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      opacity: 0.8;
      position: fixed;
      }
      /* Position the Popup form */
      .login-popup {
      position: relative;
      text-align: center;
      width: 100%;
      }
      /* Hide the Popup form */
      .form-popup {
      display: none;
      position: fixed;
      left: 45%;
      top:5%;
      transform: translate(-45%,5%);
      border: 2px solid #666;
      z-index: 9;
      }
      /* Styles for the form container */
      .form-container {
      max-width: 300px;
      padding: 20px;
      background-color: #fff;
      }
      /* Full-width for input fields */
      .form-container input[type=text], .form-container input[type=password] {
      width: 100%;
      padding: 10px;
      margin: 5px 0 22px 0;
      border: none;
      background: #eee;
      }
      /* When the inputs get focus, do something */
      .form-container input[type=text]:focus, .form-container input[type=password]:focus {
      background-color: #ddd;
      outline: none;
      }
      /* Style submit/login button */
      .form-container .btn {
      background-color: #8ebf42;
      color: #fff;
      padding: 12px 20px;
      border: none;
      cursor: pointer;
      width: 100%;
      margin-bottom:10px;
      opacity: 0.8;
      }
      /* Style cancel button */
      .form-container .cancel {
      background-color: #cc0000;
      }
      /* Hover effects for buttons */
      .form-container .btn:hover, .open-button:hover {
      opacity: 1;
      }
    </style>

 
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
								
								<th scope="col" colspan="3">Action</th>
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
						<td> <button class="btn btn-info" onclick="openForm('${data.email}')"><strong>Mail</strong></button>
						
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
  <script>
      function openForm(para) {
        document.getElementById("popupForm").style.display="block";
        document.getElementById("emailval").value=para;
      
      }
      
      function closeForm() {
        document.getElementById("popupForm").style.display="none";
      }
    </script>
	
					<div class="login-popup">
      <div class="form-popup" id="popupForm">
        <form action="adminmail" method="post" class="form-container">
    
       <h3>Send Email</h3>
          <label for="serviceId">
          <strong>Email Id</strong>
          </label>
          <input type="text" name="mailfor" id="emailval" readonly="readonly">
             <label for="subject">
          <strong>SUBJECT</strong>
          </label>
          <input type="text"  id="Subject"name="subject" required>
       
          <label for="msg">
          <strong>Message</strong>
          </label>
          <input type="text"  id="Msg"name="msg" required>
          <button type="submit" class="btn">submit</button>
          <button type="button" class="btn cancel" onclick="closeForm()">Close</button>
        </form>
      </div>
    </div>
  
  

</body>

</html>
     