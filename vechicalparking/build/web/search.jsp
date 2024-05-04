<%-- 
    Document   : search
    Created on : Apr 26, 2024, 5:25:40 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*"%>
<!DOCTYPE html>
<html>

<head>
 
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />

  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="author" content="" />

  <title>Troweld</title>


  <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />


  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">

  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css" integrity="sha256-mLBIhmBvigTFWPSCtvdu6a76T+3Xyt+K571hupeFLg4=" crossorigin="anonymous" />

  <link href="css/font-awesome.min.css" rel="stylesheet" />

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
 
  <link href="css/style.css" rel="stylesheet" />
 
  <link href="css/responsive.css" rel="stylesheet" />
</head>

<body class="sub_page">
<div class="hero_area">
   
    <header class="header_section">
    
      <div class="header_bottom">
        <div class="container-fluid">
          <nav class="navbar navbar-expand-lg custom_nav-container ">
        

            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
              <span class=""> </span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
              <ul class="navbar-nav  ">
                <li class="nav-item ">
                  <a class="nav-link" href="home.jsp">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="addvechical.jsp">Add Vechical</a>
                </li>
                <li class="nav-item active">
                  <a class="nav-link" href="viewvechical.jsp"> View List</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="payment.jsp">Payment</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="search.jsp">Search</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="adminlogin.jsp">Logout</a>
                </li>
          
              </ul>
            </div>
          </nav>
        </div>
      </div>
    </header>
  </div>


  <section class="contact_section layout_padding">
    <div class="container">
      <div class="heading_container heading_center">
        <h2>Search <span>Vechicle</span></h2>
      </div>
      <div class="row">
        <div class="col-md-12 px-0">
          <div class="form_container">
           <form method="post" action="search.jsp"> <!-- Ensure the form method and action are correct -->
  <div class="form-group">
    <input type="text" name="search" class="form-control" placeholder="Search..."> <!-- Name the input field -->
  </div>
  <div class="btn_box">
    <div class="text-center">
      <input class="btn btn-primary" type="submit" name="submit" value="SUBMIT"> <!-- Name the submit button -->
    </div>
  </div>
</form>

              <br>
               <br>
            <table class="table">
                <thead>
                  <tr>
             
                    <th scope="col">Vechical Number</th>
                   
                    <th scope="col">Action</th>
                  </tr>
                </thead>
                <tbody>
                          <% 
         if(request.getParameter("submit") != null) { 
    String search = request.getParameter("search"); // Correct parameter name to "search"
    try {
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        Connection conn = DriverManager.getConnection("jdbc:sqlserver://DESKTOP-BLBGEHJ;databaseName=vechicalparking;TrustServerCertificate=True;user=vechicalparking;password=vechicalparking");
                    
        String sql = "exec sp_searchvechical ?";
        PreparedStatement pst = conn.prepareStatement(sql
);
        pst.setString(1, search);
        ResultSet rs = pst.executeQuery();                  
                 
        while (rs.next()) {   
            %>    
            <tr>
                <td><%=rs.getString("vno")%></td>
                <td>
                    <a href="payment.jsp?id=<%= rs.getString("id")%>" class="btn btn-primary">PAY</a> <!-- Fixed button tag -->
                </td>
            </tr>
            <% 
        }
        conn.close(); // Close the connection
    } catch (Exception e) {
        out.println("Error: " + e.getMessage()); // Print error message for debugging
    }
}
%>
                        
                </tbody>
              </table>


          </div>
        </div>
    
      </div>
    </div>
  </section>


 


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