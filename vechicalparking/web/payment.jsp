<%-- 
    Document   : payment
    Created on : Apr 26, 2024, 5:25:03 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*"%>


<%
if(request.getParameter("submit")!=null) {
    String email = request.getParameter("email");
    String pwd = request.getParameter("pwd");


    try {
    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection conn = DriverManager.getConnection("jdbc:sqlserver://DESKTOP-BLBGEHJ;databaseName=vechicalparking;TrustServerCertificate=True;user=vechicalparking;password=vechicalparking");
        PreparedStatement pst = conn.prepareStatement("exec sp_anewuser ?,?");
        pst.setString(1,email);
        pst.setString(2,pwd);
        pst.executeUpdate();
%>
<script>alert("Insert successful");
 location.replace("http://localhost:8080/vechicalparking/vechicalremove.jsp");
 </script> 
<%
   
    } catch(Exception ex) {
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

  <title>Troweld</title>


  <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />


  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
 
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css" integrity="sha256-mLBIhmBvigTFWPSCtvdu6a76T+3Xyt+K571hupeFLg4=" crossorigin="anonymous" />

  <link href="css/font-awesome.min.css" rel="stylesheet" />


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
        <h2><span>Payment</span></h2>
      </div>
      <div class="row">
        <div class="col-md-6 px-0">
          <div class="form_container">
            <form action="" method="post">
                                               <%
                try{
                String ids = request.getParameter("id");
                
Connection conn = DriverManager.getConnection("jdbc:sqlserver://DESKTOP-BLBGEHJ;databaseName=vechicalparking;TrustServerCertificate=True;user=vechicalparking;password=vechicalparking");
PreparedStatement pst = conn.prepareStatement("exec vechical_details ?");
 pst.setString(1,ids);
  ResultSet rs = pst.executeQuery(); 
if(rs.next()){
                

     %>   
      <div class="form-row">
                    <div class="form-group col">
                      <input type="text" class="form-control" name="vname"  value="<%= rs.getString("vname")%>" placeholder="vechicle Name" required/>
                    </div>
                  </div>
              <div class="form-row">
                <div class="form-group col">
                  <input type="text" class="form-control" name="vno"  value="<%= rs.getString("vno")%>" placeholder="vechicle Number" required />
                </div>
              </div>
              <div class="form-row">
                <div class="form-group col">
                  <input type="text" id="datepicker" name="date" class="form-control"  value="<%= rs.getString("date")%>" placeholder="Date" required/>
                 </div>
              </div>
           
              <div class="form-row">
                <div class="form-group col">
                  <input type="text" class="form-control" name="intime" value="<%= rs.getString("intime")%>" placeholder="In Time" required/>
                </div>
              </div>
              
              <div class="form-row">
                <div class="form-group col">
                  <input type="text" class="form-control" name="outtime"  value="<%= rs.getString("outtime")%>" placeholder="Out Time" required/>
                </div>
              </div>
              <div class="form-row">
                <div class="form-group col">
                  <input type="text" class="form-control" name="to_hour"  value="<%= rs.getString("to_hour")%>" placeholder="Totel hour " required/>
                </div>
              </div>
              <div class="form-row">
                <div class="form-group col">
                  <input type="text" class="form-control" name="price"  value="<%= rs.getString("price")%>"  placeholder="price" required/>
                </div>
              </div>
              <div class="form-row">
                <div class="form-group col">
                    <input type="text" class="form-control" value=""  placeholder="Card Number" required />
                </div>
              </div>
              <div class="form-row">
                <div class="form-group col">
                  <input type="text" class="form-control" placeholder="CVV*" required/>
                </div>
              </div>
         
              <div class="form-row">
                <div class="form-group col">
                  <input type="text" class="form-control" placeholder="Amounts" required/>
                </div>
              </div>
                                            
            <%           
                }
 
else{
%>
<script>alert("404 error not found");</script> 
  
<%
}
   
                }
            catch(Exception ex)
            {
        out.print(ex);

                }
            %>
              <div class="btn_box">
                   <div class="text-center"><input class="btn btn-primary" type="submit" name="submit" value="SUBMIT"></div>  
              
                   
        
              </div>
            </form>
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