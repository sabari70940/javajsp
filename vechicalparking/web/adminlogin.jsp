<%-- 
    Document   : adminlogin
    Created on : Apr 26, 2024, 5:21:25 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    if (request.getParameter("submit") != null) {
        String email = request.getParameter("email");
        String pwd = request.getParameter("pwd");
        
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection conn = DriverManager.getConnection("jdbc:sqlserver://DESKTOP-BLBGEHJ;databaseName=vechicalparking;TrustServerCertificate=True;user=vechicalparking;password=vechicalparking");

            PreparedStatement pst = conn.prepareStatement("exec sp_alogin ?,?");
            pst.setString(1, email);
            pst.setString(2, pwd);
            ResultSet rs = pst.executeQuery();
            
            if (rs.next()) {
%> 
<script>
    alert("Login successful");
    location.replace("http://localhost:8080/vechicalparking/home.jsp");
</script>
<%
            } else {
%>
<script>
    alert("Login failed. Please check your username and password.");
</script>
<%
            }
        } catch (Exception ex) {
            out.print(ex);
        }
    }
%>
<!DOCTYPE html>
<html>

<head>

  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="author" content="" />

  <title>ADMIN</title>

  <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />

 
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
  
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css" integrity="sha256-mLBIhmBvigTFWPSCtvdu6a76T+3Xyt+K571hupeFLg4=" crossorigin="anonymous" />

  <link href="css/font-awesome.min.css" rel="stylesheet" />


  <link href="css/style.css" rel="stylesheet" />

  <link href="css/responsive.css" rel="stylesheet" />
</head>

<body class="sub_page">
 

  
  <div class="contact_section layout_padding">
    <div class="container">
      <div class="heading_container heading_center">
        <h2>Admin <span>login</span></h2>
      </div>
      <div class="row">
        <div class="col-md-6 px-0">
          <div class="form_container">
            <form action="">
              <div class="form-row">
                <div class="form-group col">
                  <input type="email" class="form-control" name="email" placeholder="Email"  required/> 
                </div>
              </div>
              <div class="form-row">
                <div class="form-group col">
                  <input type="password" class="form-control" name="pwd" placeholder="Password" required/>
                </div>
              </div>
        
              <div class="btn_box">
              
                  <div class="text-center"><input class="btn btn-primary" type="submit" name="submit" value="SUBMIT"></div>     
              
              </div>
            </form>
          </div>
        </div>
    
      </div>
    </div>

   </div>

 


  <script src="js/jquery-3.4.1.min.js"></script>

  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

  <script src="js/bootstrap.js"></script>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>

  <script src="https://huynhhuynh.github.io/owlcarousel2-filter/dist/owlcarousel2-filter.min.js"></script>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js" integrity="sha256-Zr3vByTlMGQhvMfgkQ5BtWRSKBGa2QlspKYJnkjZTmo=" crossorigin="anonymous"></script>
 
  <script src="js/custom.js"></script>

  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCh39n5U-4IoWpsVGUHWdqB6puEkhRLdmI&callback=myMap"></script>
  

</body>

</html>