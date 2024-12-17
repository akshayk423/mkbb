<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<html>
    <head>

        <title>
            Partlists
        </title>
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
        <%
        if(session.getAttribute("username") == null){
            %><h1>No Permission To Access Page</h1><%
        } else {
        %>
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

        <div>
            <table border="1" width="100%">
                <thead>
                    <tr>
                        <th>Part List</th>
                        <th>Total Price</th>
                        <th>Prebuilt</th>
                        <th>PCB</th>
                        <th>Accessories</th>
                        <th>Switches</th>
                        <th>Case</th>
                        <th>Stabilizer</th>
                        <th>Keycaps</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        String user = (String) session.getAttribute("dbuser");
                        String password = (String) session.getAttribute("dbpassword");
                        String url = (String) session.getAttribute("dburl");
                        java.sql.Connection con; 
                        Class.forName("com.mysql.jdbc.Driver");
                        con = DriverManager.getConnection(url,user, password);
                        Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                        String username = (String) session.getAttribute("username");
                        ResultSet rs = stmt.executeQuery("SELECT * FROM partlist WHERE username='" + username + "';");
                        try {
                            String removed = request.getParameter("removePartList");
                            if(removed != null && removed.equals("Remove Part List")) {
                                String id = request.getParameter("rmPartListID");
                                rs = stmt.executeQuery("SELECT * FROM mkdb.partlist");
                                rs.beforeFirst();
                                boolean couldNotFind = true;
                                while(rs.next()){
                                    if(id.equals(rs.getString("PartListID"))){
                                        rs.deleteRow();
                                        couldNotFind = false;
                                        break;
                                    }
                                }
                                if(couldNotFind){
                                    out.println("Could not find ID: " + id + " in Part Listings, nothing was deleted<br>");
                                }
                            }

                            String add = request.getParameter("addPartList");
                            if (add != null && add.equals("Add Part List")) {
                                rs = stmt.executeQuery("SELECT * FROM mkdb.partlist");

                                // add every id to a set
                                Set<String> idSet = new HashSet<String>();
                                //populate map with ID's
                                rs.moveToInsertRow();
                                while(rs.next()){
                                    idSet.add(rs.getString(1).substring(2));
                                }

                                //generate new id
                                boolean unique = false;
                                Random random = new Random();
                                String id = "0000";
                                while(!unique){
                                    String curId = String.format("%04d", random.nextInt(10000));
                                    if(!idSet.contains(id)){
                                        id = "PL" + curId;																									// change to id = "PL" + curId;
                                        unique = true;
                                        break;
                                    }
                                }

                                //add entry
                                rs.moveToInsertRow();
                                rs.updateString("PartListID", id);
                                rs.updateDouble("totalPrice", 0.0);
                                rs.updateString("username", username);
                                rs.insertRow();

                            }
                            
                            rs = stmt.executeQuery("SELECT * FROM partlist WHERE username='" + username + "';");
                            rs.beforeFirst();
                            int i = 1;
                            while (rs.next()) {
                                String pListId = rs.getString(1);
                    %>
                                <tr>
                                    <td>
                                        <form action='partlist.jsp' method='post'>
                                            <input class="btn btn-primary" type='submit' value='View Part List' name='viewPartList'>
                                            <input class="btn btn-primary" type='hidden' value='<%=pListId%>' name="partListID">
                                        </form>
                                    </td>
                                    <td><%out.println("$"+String.format("%.2f", rs.getDouble("totalPrice")));%></td>
                                    <td><%out.println(rs.getString(4));%></td>
                                    <td><%out.println(rs.getString(5));%></td>
                                    <td><%out.println(rs.getString(6));%></td>
                                    <td><%out.println(rs.getString(7));%></td>
                                    <td><%out.println(rs.getString(8));%></td>
                                    <td><%out.println(rs.getString(9));%></td>
                                    <td><%out.println(rs.getString(10));%></td>
                                    <td>
                                        <form action='partlists.jsp' method='post'>
                                            <input class="btn btn-primary" type='submit' value='Remove Part List' name='removePartList'>
                                            <input type='hidden' value='<%=rs.getString(1)%>' name='rmPartListID'>
                                        </form>
                                    </td>
                                </tr>
                    <%
                                i++;
                            }
                    %>
                    </tbody>
                </table>
                            <form action='partlists.jsp' method='post'>
                                <input class="btn btn-primary" type='submit' value='Add Part List' name='addPartList'>
                            </form>
                    <%
                            stmt.close();
                            con.close();
                        } catch(SQLException e) { 
                            out.println("SQLException caught: " + e.getMessage()); 
                        }
                    %>
                
        </div>
                    <%}%>
    </body>
</html>
