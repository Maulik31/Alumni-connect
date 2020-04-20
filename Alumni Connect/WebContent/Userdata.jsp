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
<title>Alumni Profile</title>
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
						<h4 style="color: green">Alumni Profile
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
								<div class="col-sm-7 col-xs-6 "><span>${data.course}</span></div>
								<div class="clearfix"></div>
								<div class="bot-border"></div>
								
								<div class="col-sm-5 col-xs-6 tital "><b>Occupation</b></div>
								<div class="col-sm-7 col-xs-6 "><span>${data.occupation}</span></div>
								<div class="clearfix"></div>
								<div class="bot-border"></div>
								
								<div class="col-sm-5 col-xs-6 tital "><b>City</b></div>
								<div class="col-sm-7 col-xs-6 "><span>${data.city}</span></div>
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
              <h1 style="color: yellow" align="center">Students</h1>
				<div class="table" style="overflow-x: auto;">
				
					<table class="table table-hover"> 
						 <thead class="thead-dark"> 
							<tr>
								<th scope="col">Id</th>
								<th scope="col">Name</th>
								<th scope="col">Gender</th>
								<th scope="col">Date of Birth</th>
								<th scope="col">Institute</th>
								<th scope="col">Course</th>
								<th scope="col">Mobile No</th>
								<th scope="col">Email</th>
								
								<!-- <th scope="col">ServiceRequested</th> -->
								
								<th scope="col" colspan="2">Action</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="data" items="${students}">
						<tr>
						<td>${data.s_id}</td>
						<td>${data.s_name}</td>
						<td>${data.s_gender}</td>
						<td>${data.s_dob}</td>
						<td>${data.s_institute}</td>
						<td>${data.s_course}</td>
						<td>${data.s_mobile}</td>
						<td>${data.s_email}</td>
						<td> <button class="btn btn-info" onclick="openForm('${data.s_email}')"><strong>Send Mail</strong></button>
						
					
						
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
        document.getElementById("mailerid").value='${data.email}';
      }
      
      function closeForm() {
        document.getElementById("popupForm").style.display="none";
      }
    </script>
	
						<div class="login-popup">
      <div class="form-popup" id="popupForm">
        <form action="alumnimail" method="post" class="form-container">
    
        <h3>Give your Feedback</h3>
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
    
    <h1 style="color: red" align="center">Events</h1>
					<section id="content">
	
		    <div class="container">
		      <div class="row">
	      
	<div class="skill-home"> 
			<div class="skill-home-solid clearfix"> 
	<%
		CreateConnection con = new CreateConnection();
		Connection cn = con.doConnection();
		Statement st = cn.createStatement();
		ResultSet rs = st.executeQuery("select * from event_master");
		
		while(rs.next())
		{ %>	
			
			<div class="col-md-3 text-center" style=" margin-bottom: 2%;">
			<div class="box"> 
			<span class="icons c1"> </span> <div class="box-area">
			<h3 style="color: purple"><%=rs.getString(2) %></h3>
			 <h5><%=rs.getString(3) %></h5>
			<p><a href="https://docs.google.com/forms/d/e/1FAIpQLScti-QZKhbULkeUg2lqPM-uafFpOzIfJbpuXfTrvZv5cl5uVA/viewform?usp=sf_link">Register</a></p></div>
			</div>
			</div>	
			
		<% }
	
	%>
	
	</div>
			</div>
		</div>
		    </div> 
		    </section>	 		
<jsp:include page="Footer.jsp"></jsp:include>	

</body>
</html>