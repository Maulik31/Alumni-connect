<!DOCTYPE html>
<%
           String email= (String)session.getAttribute("student");
			if(email == null)
			{
				request.setAttribute("error", "Please login first");
				RequestDispatcher rd = request.getRequestDispatcher("slogin.jsp");
				rd.forward(request, response);
			}

			 %> 


<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="util.CreateConnection"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Student Profile</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="" />
<meta name="author" content="http://webthemez.com" />
<!-- css -->

<link href="DashCss/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="simple-line-icons/css/simple-line-icons.css">
<link href="DashCss/css/fancybox/jquery.fancybox.css" rel="stylesheet"> 
<link href="DashCss/css/flexslider.css" rel="stylesheet" />
<link href="DashCss/js/owl-carousel/owl.carousel.css" rel="stylesheet">
<link href="DashCss/css/style.css" rel="stylesheet" />   
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


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


<style>

.img-circle {
    border-radius: 50%;
    width: 30%
}
th {
    background-color: blue;
    color: white;
} 
b{

font-size: 20px;
}
span{
font-size: 20px;
}
.panel {
    margin-bottom: 18px;
    margin-right: -29%;
    margin-left: 24%;
    background-color: #F4F4F4;
    border: 1px solid transparent;
    border-radius: 2px;
    -webkit-box-shadow: 0 1px 1px rgba(0,0,0,0.05);
    box-shadow: 0 1px 1px rgba(0,0,0,0.05);
}
@media only screen and (min-width: 200px) and (max-width: 450px) {
	.panel {
    margin-bottom: 18px;
    margin-right: 0;
    margin-left: 0;
    background-color: #F4F4F4;
    border: 1px solid transparent;
    border-radius: 2px;
    -webkit-box-shadow: 0 1px 1px rgba(0,0,0,0.05);
    box-shadow: 0 1px 1px rgba(0,0,0,0.05);
}
}
</style>
<style type="text/css">
#content img {
	    width: 40%;
    height: auto;
}
</style>
</head>
<body style="background-image: linear-gradient(to top, #fbc2eb 0%, #a6c1ee 100%);">

<div id="wrapper" class="home-page">
	<!-- start header -->
	<jsp:include page="header.jsp"></jsp:include>
	<!-- end header -->
	<div class="container">
             <div class="row">
           
			<div class="col-md-8 ">
                
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4>Student Profile
						<button style="font-size:15px; float: right" ><a href="slogin.jsp">Logout</a></button>
						
						<%-- <button style="font-size:15px;float: right" ><i class="fa fa-edit"></i><a href="update?action=update&email=${data.email}">Update</a></button> --%>
						
						</h4>
						 
					</div>
					<div><h4>${msg}</h4></div>
					
					<div class="panel-body">

						<div class="box box-info">

							<div class="box-body">
							

								 
									<h4 align="right" style="color: #00b1b1;">WelCome , ${data.s_name}</h4>

								
							
								
								<div class="clearfix"></div>
								<hr style="margin: 5px 0 5px 0;">
							
								<div class="col-sm-5 col-xs-6 tital "><b>Name:</b></div>
								<div class="col-sm-7 col-xs-6 "><span>${data.s_name}</span></div>
								<div class="clearfix"></div>
								<div class="bot-border"></div>
						
								
								<div class="col-sm-5 col-xs-6 tital "><b>Gender</b></div>
								<div class="col-sm-7 col-xs-6 "><span>${data.s_gender}</span></div>
								<div class="clearfix"></div>
								<div class="bot-border"></div>
								
								<div class="col-sm-5 col-xs-6 tital "><b>date of Birth</b></div>
								<div class="col-sm-7 col-xs-6 "><span>${data.s_dob}</span></div>
								<div class="clearfix"></div>
								<div class="bot-border"></div>
								
								<div class="col-sm-5 col-xs-6 tital "><b>Institute</b></div>
								<div class="col-sm-7 col-xs-6 "><span>${data.s_institute}</span></div>
								<div class="clearfix"></div>
								<div class="bot-border"></div>
								
								<div class="col-sm-5 col-xs-6 tital "><b>Course</b></div>
								<div class="col-sm-7 col-x
								s-6 "><span>${data.s_course}</span></div>
								<div class="clearfix"></div>
								<div class="bot-border"></div>
								
								
								<div class="col-sm-5 col-xs-6 tital "><b>Email</b></div>
								<div class="col-sm-7 col-xs-6 "><span>${data.s_email}</span></div>
								<div class="clearfix"></div>
								<div class="bot-border"></div>
								
								<div class="col-sm-5 col-xs-6 tital "><b>Phone Number:</b></div>
								<div class="col-sm-7 col-xs-6 "><span>${data.s_mobile}</span></div>
								<div class="clearfix"></div>
								<div class="bot-border"></div>
								
								
								<div class="col-sm-5 col-xs-6 tital "><b>Password:</b></div>
								<div class="col-sm-7 col-xs-6 "><span>********</span></div>
								<div class="clearfix"></div>
								<div class="bot-border"></div>
								
							</div>

						</div>


					</div>
				</div>
			</div>
	
	 </div>
 	<div class="container">
		 <div class="row">
		 
		 
              <div class="col-md-12 m-auto"> 
              <h1 style="color: black" align="center">Alumnis</h1>
				<div class="table" style="overflow-x: auto;">
				
					<table class="table table-hover"> 
						 <thead class="thead-dark"> 
							<tr>
								<th scope="col">ID</th>
								<th scope="col">Name</th>
								<th scope="col">Gender</th>
								<th scope="col">Date of Birth</th>
								<th scope="col">Institute</th>
								<th scope="col">Course</th>
								<th scope="col">Occupation</th>
								<th scope="col">City</th>
								<th scope="col">Mobile No</th>
								<th scope="col">Email</th>
								
								
								<!-- <th scope="col">ServiceRequested</th> -->
								
								<th scope="col" colspan="2">Send Email</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="data" items="${alumni}">
						<tr>
						<td>${data.id}</td>
						<td>${data.name}</td>
						<td>${data.gender}</td>
						<td>${data.dob}</td>
						<td>${data.institute}</td>
						<td>${data.course}</td>
						<td>${data.occupation}</td>
						<td>${data.city}</td>
						<td>${data.mono}</td>
						<td>${data.email}</td>
						<td> <button class="btn btn-info" onclick="openForm('${data.email}')"><strong>Mail</strong></button>
						
					
		
						
						
						</td>
	
					
						</tr>
						
						</c:forEach>
						<!-- </tbody> -->
						
						
					</table>
         		</div>
         		<h3 style="color: green">${sent}</h3>
			</div>
		</div>
		</div> 
	
			
			
	
</div>
	
</div>	
  <script>
      function openForm(para) {
        document.getElementById("popupForm").style.display="block";
        document.getElementById("emailval").value=para;
        document.getElementById("mailerid").value='${data.s_email}';
      }
      
      function closeForm() {
        document.getElementById("popupForm").style.display="none";
      }
    </script>
	
					<div class="login-popup">
      <div class="form-popup" id="popupForm">
        <form action="studentmail" method="post" class="form-container">
    
       <h3>Send Email</h3>
          <label for="serviceId">
          <strong>Email Id</strong>
          </label>
          <input type="hidden" name="senderid" id="mailerid">
          <input type="text" name="mailfor" id="emailval">
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
<jsp:include page="Footer.jsp"></jsp:include>	

</body>
</html>