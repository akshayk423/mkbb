<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Switch Parts: Keyboard Part Picker</title>
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
          <a class="navbar-brand">
              <img alt src="logo.png" width="50" height="50">
              Mechanical Keyboard Builder
          </a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
          </button>
      </div>
  </nav>
</div>

<div class="center">
    <form method="post">

    <h1>Login:</h1>

    <td>Username:</td>
    <td><input type="text" name="iUserName" required></td></br>
    <td>Password:</td>
    <td><input type="password" name="iPassword" required></td></br>

    <input type="submit" class="btn btn-primary" value="Sign In" name="signIn">
    <input type="submit" class="btn btn-primary" value="Sign Up" name="signUp">
    <input type="submit" class="btn btn-primary" value="Moderator Login" name="modLogin">
    </form>
  <%  

            String signOut = request.getParameter("signOut");

            // Sign-out logic: Remove user-specific attributes
            if (signOut != null && signOut.equals("Sign Out")) {
                // Remove only user-specific session attributes
                session.removeAttribute("username");
                session.removeAttribute("userDetails");
                
                // Redirect to the login page after signing out
                response.sendRedirect("login.jsp");
                return; // Exit early to avoid executing further code
            }

            String user = (String) session.getAttribute("dbuser");
            String password = (String) session.getAttribute("dbpassword");
            String url = (String) session.getAttribute("dburl");
            try {
                java.sql.Connection con; 
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection(url,user, password);
                Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                ResultSet rs = stmt.executeQuery("SELECT * FROM mkdb.users");
                
                String sign = request.getParameter("signIn");
                if(sign != null && sign.equals("Sign In")){
                    String inputUser = request.getParameter("iUserName");
                    String inputPass = request.getParameter("iPassword");
                    //find the ID
                    rs.beforeFirst();
                    out.println("<br></br>");
                    boolean flag = true;
                    while(rs.next()){
                        if(inputUser.equals(rs.getString(1)) && inputPass.equals(rs.getString(2))){
                            session.setAttribute("username", inputUser);
                            response.sendRedirect("home.jsp");
                            flag = false;
                            break;
                        }
                    }
                    if(flag){
                        %><h4>Incorrect Username and Password</h4><%;
                    }
                }

                sign = request.getParameter("signOut");
                if(sign != null && sign.equals("Sign Out")){
                    %><h4>  Signed Out</h4><%
                    session.invalidate();
                }
                
                sign = request.getParameter("signUp");
                if(sign != null && sign.equals("Sign Up")){
                    response.sendRedirect("signup.jsp");
                }

                //mod login page
                String mod = request.getParameter("modLogin");
                if(mod != null && mod.equals("Moderator Login")){
                    response.sendRedirect("modlogin.jsp");
                }

                //IF USER REGISTERD FROM signup.jsp
                sign = request.getParameter("register");
                if(sign != null && sign.equals("Sign Up")){
                    String inputUser = request.getParameter("iUser");
                    String inputPass = request.getParameter("iPass");

                    rs.moveToInsertRow();
                    rs.updateString(1, inputUser);
                    rs.updateString(2, inputPass);
                    rs.insertRow();
                }


                rs.close();
                stmt.close();
                con.close();
            } catch(SQLException e) { 
                out.println("SQLException caught: " + e.getMessage()); 
            }
  %>
  </div>
  </body>

</html>