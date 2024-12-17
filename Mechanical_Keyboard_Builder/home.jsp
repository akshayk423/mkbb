<%@ page import="java.sql.*"%>

<html>
  <head>
    <title>Home Page</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
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
    <%if(session.getAttribute("username") == null){
      %><h1>No Permission To Access Page</h1><%
    }else{%>
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
                <form action="login.jsp" method="post">
                  <button type="submit" class="signOut" value = "Sign Out" name="signOut">Sign Out</button>
                </form>
              </li>
          </ul>
          </div>
      </div>
    </nav>
    
    <div class="center">
      <h1>Home Page:</h1>
      <h4>Welcome, <%=session.getAttribute("username")%>!</h4>
      <form action="partlists.jsp">
          <input type="submit" class="btn btn-primary" value="Home to part lists">
      </form>
      <form action="bookmarks.jsp">
        <input type="submit" class="btn btn-primary" value="Home to bookmarks">
      </form>
      <form action="manageListings.jsp">
        <input type="submit" class="btn btn-primary" value="Home to manage listings">
      </form>
    </div>
    <%}%>
  </body>
</html>