<html>
  <head>
    <title>Switch Parts: Keyboard Part Picker</title>
    </head>
  <body>
    <form action="editPart.jsp" method="post">

    <h1>Signed in!</h1>
    <button type="submit" value="toPartList" name="editPart">Edit Part List</button>
    </form>

    <form action="login.jsp" method="post">
      <button type="submit" value = "Sign Out" name="signOut">Sign Out</button>
    </form>

    <%
      out.println(session.getAttribute("username"));
    %>
  </body>
  </html>