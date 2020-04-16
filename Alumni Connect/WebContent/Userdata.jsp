<!DOCTYPE html>
<%
           String email= (String)session.getAttribute("client");
			if(email == null)
			{
				request.setAttribute("error", "Please login first");
				RequestDispatcher rd = request.getRequestDispatcher("allogin.jsp");
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
<title>Alumni |Alumni Profile</title>
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
 <script type="text/javascript">
 $(".hiddenPassword").click(function() {
	    var pw = $(this).children("span").text();
	    $(this).text(pw);
	});
 </script>
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
						<h4>Alumni Profile
						<button style="font-size:15px; float: right" ><a href="allogin.jsp">Logout</a></button>
						
						<%-- <button style="font-size:15px;float: right" ><i class="fa fa-edit"></i><a href="update?action=update&email=${data.email}">Update</a></button> --%>
						
						</h4>
						 
					</div>
					<div><h4>${msg}</h4></div>
					
					<div class="panel-body">

						<div class="box box-info">

							<div class="box-body">
							

								 
									<h4 align="right" style="color: #00b1b1;">WelCome , ${data.name}</h4>

								
							
								
								<div class="clearfix"></div>
								<hr style="margin: 5px 0 5px 0;">
							
								<div class="col-sm-5 col-xs-6 tital "><b>Name:</b></div>
								<div class="col-sm-7 col-xs-6 "><span>${data.name}</span></div>
								<div class="clearfix"></div>
								<div class="bot-border"></div>
						
								
								<div class="col-sm-5 col-xs-6 tital "><b>Enrollment No</b></div>
								<div class="col-sm-7 col-xs-6 "><span>${data.enno}</span></div>
								<div class="clearfix"></div>
								<div class="bot-border"></div>
								
								<div class="col-sm-5 col-xs-6 tital "><b>Gender</b></div>
								<div class="col-sm-7 col-xs-6 "><span>${data.gender}</span></div>
								<div class="clearfix"></div>
								<div class="bot-border"></div>
								
								<div class="col-sm-5 col-xs-6 tital "><b>date of Birth</b></div>
								<div class="col-sm-7 col-xs-6 "><span>${data.dob}</span></div>
								<div class="clearfix"></div>
								<div class="bot-border"></div>
								
								<div class="col-sm-5 col-xs-6 tital "><b>Institute</b></div>
								<div class="col-sm-7 col-xs-6 "><span>${data.institute}</span></div>
								<div class="clearfix"></div>
								<div class="bot-border"></div>
								
								<div class="col-sm-5 col-xs-6 tital "><b>Course</b></div>
								<div class="col-sm-7 col-x
								s-6 "><span>${data.course}</span></div>
								<div class="clearfix"></div>
								<div class="bot-border"></div>
								
								
								<div class="col-sm-5 col-xs-6 tital "><b>PassOut</b></div>
								<div class="col-sm-7 col-xs-6 "><span>${data.p_year}</span></div>
								<div class="clearfix"></div>
								<div class="bot-border"></div>
								
								<div class="col-sm-5 col-xs-6 tital "><b>Phone Number:</b></div>
								<div class="col-sm-7 col-xs-6 "><span>${data.mono}</span></div>
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
              <h1 style="color: black" align="center">Students</h1>
				<div class="table" style="overflow-x: auto;">
				
					<table class="table table-hover"> 
						 <thead class="thead-dark"> 
							<tr>
								<th scope="col">RequestId</th>
								<th scope="col">Username</th>
								<th scope="col">UserAddress</th>
								<th scope="col">UserCity</th>
								<th scope="col">UserZip</th>
								<th scope="col">UserPhone</th>
								<th scope="col">UserEmail</th>
								<th scope="col">ServiceDescription</th>
								<th scope="col">Assigned ID</th>
								
								<!-- <th scope="col">ServiceRequested</th> -->
								
								<th scope="col" colspan="2">Action</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="data" items="${servicedata}">
						<tr>
						<td>${data.srid}</td>
						<td>${data.userName}</td>
						<td>${data.userAddress}</td>
						<td>${data.userCity}</td>
						<td>${data.userZip}</td>
						<td>${data.userPhone}</td>
						<td>${data.userEmail}</td>
						<td>${data.serviceDescription}</td>
						<td>${data.assignedId}</td>
						
						<td><button class="btn btn-danger" name="finished"><a href="finished?id=${data.assignedId}&&id2=${data.srid}&&phon=${data.userPhone}">Done</a></button> </td>
						</tr>
						
						</c:forEach>
						<!-- </tbody> -->
						
						
					</table>
         		</div>
			</div>
		</div>
		</div> 
	
			
			<script>
				$(function() {
					$('#profile-image1').on('click', function() {
						$('#profile-image-upload').click();
					});
				});
			</script>
	
</div>
	
</div>	
 
	
<jsp:include page="Footer.jsp"></jsp:include>	

</body>
</html>