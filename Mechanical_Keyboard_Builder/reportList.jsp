<%@ page import="java.sql.*"%>
<%@ page import="java.util.*" %>
<html>
  <head>
    <title>Report Listings</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        
        <style>
      .btn-secondary {
          color: #000;
          background-color: #ffc1078a!important;
          border-color: #ffc1078a!important;
      }
      .bg-light{
          background-color: #7A62CB!important  ;
      }
      .navbar-brand{
          color:aliceblue!important;
          --bs-navbar-brand-hover-color: yellow!important;
      }
      .navbar-brand .nav-item:hover{
          color: pink!important;
      }
      .nav-link{
          color:aliceblue!important;
      }
      .navbar-nav .nav-link.active, .navbar-nav .show>.nav-link {
          color:aliceblue!important;
      }
      .navbar-nav{
          --bs-nav-link-hover-color: yellow!important;
      }
      button, input, optgroup, select, textarea {
          margin: 10;
          font-family: inherit;
          font-size: inherit;
          line-height: inherit;
      }
      .btn-secondary:not(:disabled):not(.disabled).active, .btn-secondary:not(:disabled):not(.disabled):active, .show>.btn-secondary.dropdown-toggle {
          color: #000;
          background-color: #ffc1078a!important;
          border-color: #ffc1078a!important;
      }
      .btn {
          padding-top: 0.15rem!important;
          padding-right: 0.15rem!important;
          padding-bottom: 0.15rem!important;
          padding-left: 0.15rem!important;
      }
      .signOut {
        border: none;
        background: none;
        color:aliceblue!important;
      }
      .center {
        margin: 0;
        position: absolute;
        top: 40%;
        left: 50%;
        -ms-transform: translate(-50%, -50%);
        transform: translate(-50%, -50%);
        text-align:center;
      }
    </style>
    </head>
  <body>
    <div>
      <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <div class="container">
          <a class="navbar-brand" href="/Mechanical_Keyboard_Builder/home.jsp">
              <img alt src="logo.png" width="50" height="50">
              Mechanical Keyboard Builder
          </a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="navbar-nav">
              <li class="nav-item">
                <form action="modlogin.jsp" method="post" value = "Sign Out" name="signOut">
                  <button type="submit" class="signOut" value = "Sign Out" name="signOut">Sign Out</button>
                </form>
              </li>
          </ul>
          </div>
        </div>
      </nav>
    </div>
    <%if(session.getAttribute("modUser") == null){
        %><h1>No Permission To Access Page</h1><%
    }else{%>
    <h1>Report Listings</h1>
    <table border="1">
        <thead>
          <tr>
            <td>ReportID</td>
            <td>PartID</td>
            <td>Name</td>
            <td>URL</td>
            <td>Brand</td>
            <td>Price</td>
            <td>Seller</td>
            <td>Remove Listing:</td>
          </tr>
        </thead>
        <tbody>
            <% 
            String user = (String) session.getAttribute("dbuser");
            String password = (String) session.getAttribute("dbpassword");
            String dburl = (String) session.getAttribute("dburl");
            java.sql.Connection con; 
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(dburl,user, password);
            Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = stmt.executeQuery("SELECT * FROM mkdb.reportlistings");

            try {
                // rs.beforeFirst();
                // rs.next();
                // String asd = rs.getString(2);
                // String fds = asd.charAt(0) + "" + asd.charAt(1);
                // out.println(fds);

                // Map<String, String> dict = new HashMap<String, String>();
                // dict.put("SW", "switches");
                // dict.put("PB", "prebuilt");
                // dict.put("PC", "pcb");
                // dict.put("SB", "stabilizers");
                // dict.put("KC", "keycap");
                // dict.put("CS", "kbcase");
                // dict.put("AC", "accessories");

                // rs = stmt.executeQuery("SELECT * FROM mkdb." + dict.get(fds));

            String removed = request.getParameter("removeReport");
            if(removed != null && removed.equals("Remove Listing")){
                String id = request.getParameter("partID");

                String prefix = id.charAt(0) + "" + id.charAt(1);

                Map<String, String> dict = new HashMap<String, String>();
                dict.put("SW", "switches");
                dict.put("PB", "prebuilt");
                dict.put("PC", "pcb");
                dict.put("SB", "stabilizers");
                dict.put("KC", "keycap");
                dict.put("CS", "kbcase");
                dict.put("AC", "accessories");

                rs = stmt.executeQuery("SELECT * FROM mkdb.reportlistings");
                rs.beforeFirst();
                boolean couldNotFind = true;
                while(rs.next()){
                  if(id.equals(rs.getString("PartID"))){
                    rs.deleteRow();
                    couldNotFind = false;
                    break;
                  }
                }
                if(couldNotFind){
                  out.println("Could not find ID: " + id + " in Report Listings, nothing was deleted<br>");
                }

                //delete from keyboard part table
                rs = stmt.executeQuery("SELECT * FROM mkdb.keyboardpart");
                rs.beforeFirst();
                couldNotFind = true;
                while(rs.next()){
                  if(id.equals(rs.getString("PartID"))){
                    rs.deleteRow();
                    couldNotFind = false;
                    break;
                  }
                }
                if(couldNotFind){
                  out.println("Could not find ID: " + id + " in keyboard parts, nothing was deleted<br>");
                }
                
                //something was deleted in reported listing, therefore also delete in listings
                rs = stmt.executeQuery("SELECT * FROM mkdb." + dict.get(prefix));
                rs.beforeFirst();
                couldNotFind = true;
                while(rs.next()){
                  if(id.equals(rs.getString("PartID"))){
                    rs.deleteRow();
                    couldNotFind = false;
                    break;
                  }
                }
                if(couldNotFind){
                  out.println("Could not find ID: " + id + " in " + dict.get(prefix) + ", nothing was deleted<br>");
                }
            }

                rs = stmt.executeQuery("SELECT * FROM mkdb.reportlistings NATURAL JOIN mkdb.keyboardpart");
                rs.beforeFirst();
                while (rs.next()) {
                    String name = rs.getString("name");
                    if(name.length() > 40){ name = name.substring(0,40) + "...";}
                    String url = rs.getString("URL");
                    if(url.length() > 40){ url = url.substring(0,40) + "...";}
                    %>
                    <tr>
                        <td><%=rs.getString("ReportListID")%></td>
                        <td><%=rs.getString("PartID")%></td>
                        <td><%=name%></td>
                        <td><a href=<%=rs.getString("URL")%>>(<%=url%></td>
                        <td><%=rs.getString("brand")%></td>
                        <td><%=rs.getString("price")%></td>
                        <td><%=rs.getString("username")%></td>
                        <td>
                            <form action='reportList.jsp' method='post'>
                            <input type='submit' class="btn btn-danger" value='Remove Listing' name='removeReport'>
                            <input type='hidden' value="<%=rs.getString("PartID")%>" name='partID'>
                            </form>
                        </td>
                    </tr>
                <%
                }
                rs.close();
                stmt.close();
                con.close();
            } catch(SQLException e) { 
                out.println("SQLException caught: " + e.getMessage()); 
            }
        }
        %>
  </body>
</html>