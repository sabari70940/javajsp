<%-- 
    Document   : viewvechical
    Created on : Apr 26, 2024, 5:27:37 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*"%>
<%
if(request.getParameter("submit")!=null) {
 String id = request.getParameter("id");


    try {
         Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection conn = DriverManager.getConnection("jdbc:sqlserver://DESKTOP-BLBGEHJ;databaseName=vechicalparking;TrustServerCertificate=True;user=vechicalparking;password=vechicalparking");
        PreparedStatement pst = conn.prepareStatement("exec sp_vechical_delete ?");
        pst.setString(1,id);
      
        pst.executeUpdate();
%>
<script>alert("remove  successfully");
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

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

  <link href="css/style.css" rel="stylesheet" />
 
  <link href="css/responsive.css" rel="stylesheet" />
</head>

<body class="sub_page">

 
  <section class="contact_section layout_padding">
    <div class="container">
      <div class="heading_container heading_center">
        <h2>vechicle <span>List</span></h2>
      </div>
      <div class="row">
        <div class="col-md-12 px-0">
          <div class="form_container">
            <table class="table">
                <thead>
                  <tr>
                    <th scope="col">Vechical Name</th>
                    <th scope="col">Vechical Number</th>
                    <th scope="col">Date</th>
                    <th scope="col">In Time</th>
                    <th scope="col">Out Time</th>
                    <th scope="col">Totel Hours</th>
                    <th scope="col">Price</th>
                    <th scope="col">Action</th>
                  </tr>
                </thead>
                <tbody>
                                              <%
                try{           
                
   Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection conn = DriverManager.getConnection("jdbc:sqlserver://DESKTOP-BLBGEHJ;databaseName=vechicalparking;TrustServerCertificate=True;user=vechicalparking;password=vechicalparking");
PreparedStatement pst = conn.prepareStatement("exec sp_viewvechical");

  ResultSet rs = pst.executeQuery(); 
while(rs.next()){
                

     %>
                  <tr>   
                    <td><%= rs.getString("vname")%></td>
                    <td><%= rs.getString("vno")%></td>
                    <td><%= rs.getString("date")%></td>
                    <td><%= rs.getString("intime")%></td>
                    <td><%= rs.getString("outtime")%></td>
                    <td><%= rs.getString("to_hour")%></td>
                    <td><%= rs.getString("price")%></td>
                    <td>
                    <form method="post">
              <input type="hidden" name="id" value="<%= rs.getString("id")%>"s class="btn btn-danger"/>
              <input type="submit" name="submit" value="payment successfull release vechical" class="btn btn-danger"/>
                </form>
              </td>
                  </tr>
            
                        <%           
                }
   

                }
            catch(Exception ex)
            {
        out.print(ex);
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