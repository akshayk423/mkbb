<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Bookmarks</title>
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
                <form action="login.jsp" method="post" value = "Sign Out" name="signOut">
                  <button type="submit" class="signOut" value = "Sign Out" name="signOut">Sign Out</button>
                </form>
              </li>
          </ul>
          </div>
        </div>
      </nav>
    </div>
    <h1>Bookmarks</h1>
            <% 
            String user = (String) session.getAttribute("dbuser");
            String password = (String) session.getAttribute("dbpassword");
            String username = (String) session.getAttribute("username");
            String url = (String) session.getAttribute("dburl");
            java.sql.Connection con; 
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url,user, password);
            Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            
            try {
                String removed = request.getParameter("removeBookmarkButton");
                if(removed != null && removed.equals("Remove Bookmark")){
                    PreparedStatement ps = null;
                    String sql = "DELETE FROM mkdb.bookmarks WHERE username='" + username + "' AND PartID = '" + request.getParameter("partID") + "'";
                    ps = con.prepareStatement(sql);
                    int i = ps.executeUpdate();
                }

                ResultSet rs = stmt.executeQuery("SELECT URL, name, brand, price, mkdb.bookmarks.PartID FROM mkdb.bookmarks JOIN mkdb.keyboardpart ON mkdb.bookmarks.PartID = mkdb.keyboardpart.PartID WHERE mkdb.bookmarks.username = '" + username + "'");

               
                int i = 1;
                if (!rs.next()) {
                %>
                  <h4>No bookmarks</h4>
                <%
                } else {
                %>
                  <table border="1" width="80%">
                    <thead>
                      <tr>
                        <th>Name</th>
                        <th>Brand</th>
                        <th>Price</th>
                        <th>Buy</th>
                        <th>Remove bookmark</th>
                      </tr>
                    </thead>
                    <tbody>
                <%
                  rs.beforeFirst();
                  while (rs.next()) {
                    %>
                    
                        <tr>
                            <td><%out.println(rs.getString(2));%></td>
                            <td><%out.println(rs.getString(3));%></td>
                            <td><%out.println(rs.getString(4));%></td>
                            <td><a href='<%=rs.getString(1)%>'>Buy</a></td>
                            <td>
                                <form action='bookmarks.jsp' method='post'>
                                  <input type='submit' class="btn btn-danger" value='Remove Bookmark' name='removeBookmarkButton'>
                                  <input type='hidden' value='<%=rs.getString(5)%>' name='partID'>
                                </form>
                            </td>
                        </tr>
                    <%
                        i++;
                    }
                }
                rs.close();
                stmt.close();
                con.close();
            } catch(SQLException e) { 
                out.println("SQLException caught: " + e.getMessage()); 
            }
        %>
  </body>
</html>