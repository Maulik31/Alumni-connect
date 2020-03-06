<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Colorlib Templates">
    <meta name="author" content="Colorlib">
    <meta name="keywords" content="Colorlib Templates">

    <!-- Title Page-->
    <title>User Registration</title>

    <!-- Icons font CSS-->
    <link href="vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
    <link href="vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <!-- Font special for pages-->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">

    <!-- Vendor CSS-->
    <link href="vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="css/regmain.css" rel="stylesheet" media="all">
    
    
    
    <!-- Jquery JS-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <!-- Vendor JS-->
    <script src="vendor/select2/select2.min.js"></script>
    <script src="vendor/datepicker/moment.min.js"></script>
    <script src="vendor/datepicker/daterangepicker.js"></script>

    <!-- Main JS-->
    <script src="js/global.js"></script>
    
    
</head>

<body>
    <div class="page-wrapper bg-gra-03 p-t-45 p-b-50">
        <div class="wrapper wrapper--w790">
            <div class="card card-5">
                <div class="card-heading">
                    <h2 class="title">Registration Form</h2>
                </div>
                <div class="card-body">
                    <form method="POST" action="areg">
                        
                        <div class="form-row">
                            <div class="name">Name</div>
                            <div class="value">
                                <div class="input-group">
                                    <input class="input--style-5" type="text" name="name">
                                </div>
                            </div>
                        </div>
                      
                        
                        
                        <div class="form-row">
                            <div class="name">Enrollment No</div>
                            <div class="value">
                                <div class="input-group">
                                    <input class="input--style-5" type="text" name="enno">
                                </div>
                            </div>
                        </div>
                        
                       
                        
                         <div class="form-row">
                            <div class="name">Gender</div>
                            <div class="value">
                                <label class="radio-container m-r-55">Male
                                    <input type="radio" checked="checked" name="gn" value="Male">
                                    <span class="checkmark"></span>
                                </label>
                                <label class="radio-container">Female
                                    <input type="radio" name="gn" value="Female">
                                    <span class="checkmark"></span>
                                </label>
                            </div>
                        </div>
                       
                        <div class="form-row">
                            <div class="name">Date of Birth</div>
                            <div class="value">
                                <div class="input-group">
                                    <input class="input--style-5" placeholder="DD/MM/YYYY" type="text" name="dob">
                                </div>
                            </div>
                        </div>
                        
                        
                           <div class="form-row">
                            <div class="name">Passout Year</div>
                            <div class="value">
                                <div class="input-group">
                                <div class="rs-select2 js-select-simple select--no-search">
                                    <select name="pyear">
                                          <option disabled="disabled" selected="selected">Choose option</option>
                                          <option value="2015">2015</option>
                                          <option value="2016">2016</option>
                                          <option value="2017">2017</option>
                                          <option value="2018">2018</option>
                                           </select>
                                    <div class="select-dropdown"></div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        
                        
                        <div class="form-row">
                            <div class="name">Institute</div>
                            <div class="value">
                                <div class="input-group">
                                    <input class="input--style-5" type="text" name="institute">
                                </div>
                            </div>
                        </div>
                        
                        <div class="form-row">
                            <div class="name">Course</div>
                            <div class="value">
                                <div class="input-group">
                                    <input class="input--style-5" type="text" name="course">
                                </div>
                            </div>
                        </div>
                        
                        <div class="form-row">
                            <div class="name">Mobile No</div>
                            <div class="value">
                                <div class="input-group">
                                    <input class="input--style-5" type="text" name="mobileno">
                                </div>
                            </div>
                        </div> 
                        
                        <div class="form-row">
                            <div class="name">Email</div>
                            <div class="value">
                                <div class="input-group">
                                    <input class="input--style-5" type="email" name="email">
                                </div>
                            </div>
                        </div>
                        
                        
                        <div class="form-row">
                            <div class="name">Password</div>
                            <div class="value">
                                <div class="input-group">
                                    <input class="input--style-5" type="text" name="password">
                                </div>
                            </div>
                        </div> 
                        
                    
                        
                       
                       
                        <div>
                            <button class="btn btn--radius-2 btn--red" type="submit">Register</button>
                        </div>
                    
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>