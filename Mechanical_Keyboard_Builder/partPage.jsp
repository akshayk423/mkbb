<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Switch Parts: Keyboard Part Picker</title>
  </head>
  <body>

    <form action="editPart.jsp">
      <input type="submit" value="Go to Edit Page">
    </form>

    <h1>Switch Parts</h1>

    <table border="1">
      <thead>
        <tr>
          <td>PartID</td>
          <td>Switch Type</td>
          <td>Brand</td>
          <td>Action</td>
        </tr>
      </thead>
      <tbody>
    <% 

    /*
    REFERENCES:
    https://www.tutorialspoint.com/how-to-insert-rows-into-a-resultset-in-jdbc
    https://www.youtube.com/watch?v=3ITdSQ3NmXU
    https://stackoverflow.com/questions/22691711/how-to-check-if-the-a-button-has-been-pressed-in-a-jsp-file
    */
     String db = "team4";
        String user; // assumes database name is the same as username
        //change these
          user = "root";
        String password = "password";
        try {
            java.sql.Connection con; 
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mkdb?autoReconnect=true&useSSL=false",user, password);
            Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = stmt.executeQuery("SELECT * FROM mkdb.switches");
            
            //INSERT
            String submitted = request.getParameter("submit");
            if(submitted != null && submitted.equals("Add Entry")){
              String partID = request.getParameter("iPartID");
              String type = request.getParameter("iSwitchType");
              String stem = request.getParameter("iStem");
              

              rs.moveToInsertRow();
              rs.updateString(1, partID);
              rs.updateString(2, type);
              rs.updateString(3, stem);
              rs.insertRow();
            }

            //REMOVE
            String removed = request.getParameter("removeEntryButton");
            if(removed != null && removed.equals("Remove Entry")){
              String id = request.getParameter("rPartID");
              //find the ID
              rs.beforeFirst();
              boolean flag = true;
              while(rs.next()){
                if(id.equals(rs.getString(1))){
                  out.println("deleted row: " + rs.getRow());
                  rs.deleteRow();
                  flag = false;
                  break;
                }
              }
              if(flag){
                out.println("Could not find ID: " + id + ", nothing was deleted");
              }
            }

            //VIEW ROWS
            //move cursor back to first position
            rs.beforeFirst();

            out.println("<br></br>");
            int i = 1;
            while (rs.next()) {
                out.println("<tr><td>" + rs.getString(1) + "</td><td>" + rs.getString(2) + "</td><td>" + rs.getString(3) + "</td><td><button>Bookmark</button></tr>");
                i++;
              }
            rs.close();
            stmt.close();
            con.close();
        } catch(SQLException e) { 
            out.println("SQLException caught: " + e.getMessage()); 
        }
    %>
    </tbody>
    </table>
  </body>
</html>