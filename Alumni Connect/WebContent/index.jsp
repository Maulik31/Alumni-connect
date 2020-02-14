<%--
  Created by IntelliJ IDEA.
  User: Maulik
  Date: 23-Jan-20
  Time: 12:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <meta charset="ISO-8859-1">
  <title>Alumni Tracking System</title>
  <%@include file="meta.jsp" %>
</head>
<body>
<%@include file="header.jsp" %>
<!--================ Start Home Banner Area =================-->
<section class="home_banner_area">
  <div class="banner_inner">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="banner_content text-center">
            <p class="text-uppercase">
              Stay in Touch with @Seniors
            </p>
            <h2 class="text-uppercase mt-4 mb-5">
              Let's find new Way to learn
            </h2>
            <div>
              <a href="#" class="primary-btn2 mb-3 mb-sm-0">alumni</a>
              <a href="#" class="primary-btn ml-sm-3 ml-0">Student</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<!--================ End Home Banner Area =================-->
<!--================ Start Feature Area =================-->
<section class="feature_area section_gap_top">
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-lg-5">
        <div class="main_title">
          <h2 class="mb-3">Awesome Feature</h2>
          <p>
            Alumni Tracking System is an online-based application that helps to enhance the tracking of college graduates.
          </p>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-lg-4 col-md-6">
        <div class="single_feature">
          <div class="icon"><span class="flaticon-student"></span></div>
          <div class="desc">
            <h4 class="mt-3 mb-2">Connect through one platform</h4>
            <p>
              Easy search for fellow batch mates and alumni's.
            </p>
          </div>
        </div>
      </div>

      <div class="col-lg-4 col-md-6">
        <div class="single_feature">
          <div class="icon"><span class="flaticon-book"></span></div>
          <div class="desc">
            <h4 class="mt-3 mb-2">Dynamic database</h4>
            <p>
              Persistent data storage to save information.
            </p>
          </div>
        </div>
      </div>

      <div class="col-lg-4 col-md-6">
        <div class="single_feature">
          <div class="icon"><span class="flaticon-earth"></span></div>
          <div class="desc">
            <h4 class="mt-3 mb-2">24/7 access</h4>
            <p>
              Web portal for college to access alumni information.
            </p>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<!--================ End Feature Area =================-->

<%@include file="Footer.jsp" %>
</body>
</html>
