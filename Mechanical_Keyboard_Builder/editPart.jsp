<%@ page import="java.sql.*"%>
<%@ page import="java.util.*" %>
<html>
  <head>
    <title>Manage Listings</title>
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
      .move{
        margin: 0;
        position: absolute;
        left: 1%;
      }
      th, td {
            padding: 5px;
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
                <form action="manageListings.jsp" method="post">
                  <button type="submit" class="signOut" value = "ManageListing" name="ManageListings">Manage Listings</button>
                </form>
              </li>
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

    <div class="move">
    <h1>Manage Listings:</h1>
    <hr></hr>
    <% 
     String user = (String) session.getAttribute("dbuser");
     String password = (String) session.getAttribute("dbpassword");
     String url = (String) session.getAttribute("dburl");
        try {
            java.sql.Connection con; 
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url,user, password);
            Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = stmt.executeQuery("SELECT * FROM mkdb.keyboardpart");

            String edit = request.getParameter("editPrebuilt");
            if(edit != null && edit.equals("Edit Listing")){
              String partID = request.getParameter("partID");
              String prefix = partID.substring(0, 2);
              
              HashMap<String, String> dictQuery = new HashMap<String, String>();
              dictQuery.put("SW", "switches");
              dictQuery.put("PB", "prebuilt");
              dictQuery.put("PC", "pcb");
              dictQuery.put("SB", "stabilizers");
              dictQuery.put("KC", "keycaps");
              dictQuery.put("CS", "kbcase");
              dictQuery.put("AC", "accessories");

              rs = stmt.executeQuery("SELECT * FROM mkdb.keyboardpart NATURAL JOIN mkdb." + dictQuery.get(prefix) + " WHERE PartID = '" + partID + "'");
              rs.beforeFirst();
              rs.next();

              HashMap<String, String> dict = new HashMap<String, String>();
              dict.put("SW", "Editing Switch Entry:");
              dict.put("PB", "Editing Prebuilt Entry:");
              dict.put("PC", "Editing PCB Entry:");
              dict.put("SB", "Editing Stabilizers Entry:");
              dict.put("KC", "Editing Keycaps Entry:");
              dict.put("CS", "Editing Case Entry:");
              dict.put("AC", "Editing Accessory Entry:");


        %>
        <h3><%=dict.get(prefix)%></h3>
        <form name="addEntry" action="manageListings.jsp" method="post">
        <div style="display: inline-block;text-align:right">
        <tr>
        <td>Name:</td>
        <td><input type="text" name="eName" value = "<%=rs.getString("name")%>" required></td></br>
        <td>URL:</td>
        <td><input type="text" name="eURL" value = "<%=rs.getString("URL")%>" required></td></br>
        <td>Brand:</td>
        <td><input type="text" name="eBrand" value = "<%=rs.getString("brand")%>" required></td></br>
        <td>Price:</td>
        <td><input type="number" name="ePrice" value = "<%=rs.getString("price")%>"  required></td></br>
        <%


       switch(dict.get(prefix)) {
        case "Editing Prebuilt Entry:":
            %>
                <td>Switch Name:</td>
                <td><input type="text" name="eSwitchName" value = "<%=rs.getString("switchName")%>" required></td></br>
                <td>HotSwappable:</td>
                <select name="eHotSwappable">
                    <option value="yes">Yes</option>
                    <option value="no">No</option>
                </select></br>
                </tr>
                <br></br>
                <input type="submit" class="btn btn-primary" value="Edit Entry" name="editPart">
                <input type="hidden" value="<%=partID%>" name = "partID">
                </div>
                </form>
            <%
            break;
        case "Editing PCB Entry:":
            %>
                <td>containsRGB:</td>
                <select name="eContainsRGB">
                    <option value="yes">Yes</option>
                    <option value="no">No</option>
                </select></br>

                <td>Hot Swappable:</td>
                <select name="eHotSwappable">
                    <option value="yes">Yes</option>
                    <option value="no">No</option>
                </select></br>

                <td>Size:</td>
                <select name="eSize">
                    <option value="40%">40%</option>
                    <option value="60%">60%</option>
                    <option value="65%">65%</option>
                    <option value="75%">75%</option>
                    <option value="TKL">Tenkeyless</option>
                    <option value="Full Sized">Full Sized</option>
                    <option value="Numpad">Numpad</option>
                </select></br>
                </tr>
                <br></br>
                <input type="submit" class="btn btn-primary" value="Edit Entry" name="editPart">
                <input type="hidden" value="<%=partID%>" name = "partID">
                </div>
                </form>
            <%
            break;
        case "Editing Stabilizers Entry:":
            %>
                <select name="eInfo">
                <option value="plate mount">Plate Mount</option>
                <option value="screw-in, pcb mount">PCB Mount</option>
                </select></br>

                <input type="checkbox" name="2U" value="2U" checked>2U</label><br />
                <input type="checkbox" name="6.25U" value="6.25U">6.25U</label><br />
                <input type="checkbox" name="7U" value="7U">7U</label><br />

                <br></br>
                <input type="submit" class="btn btn-primary" value="Edit Entry" name="editPart">
                <input type="hidden" value="<%=partID%>" name = "partID">
                </div>
                </form>
            <%
            break;
        case "Editing Keycaps Entry:":
            %>
            <td>Profile:</td>
            <td><input type="text" name="eProfile" value = "<%=rs.getString("profile")%>" required></td></br>
            <td>Material:</td>
            <td><select name="eMaterial">
                <option value="PBT">PBT</option>
                <option value="ABS">ABS</option>
            </select></td></br>

            <br></br>
            <input type="submit" class="btn btn-primary" value="Edit Entry" name="editPart">
            <input type="hidden" value="<%=partID%>" name = "partID">
            </div>
            </form>
            <%
            break;
        case "Editing Case Entry:":
            %>
                <td>Size:</td>
                <select name="eSize">
                    <option value="40%">40%</option>
                    <option value="60%">60%</option>
                    <option value="65%">65%</option>
                    <option value="75%">75%</option>
                    <option value="TKL">Tenkeyless</option>
                    <option value="Full Sized">Full Sized</option>
                    <option value="Numpad">Numpad</option>
                </select></br>

                <br></br>
                <input type="submit" class="btn btn-primary" value="Edit Entry" name="editPart">
                <input type="hidden" value="<%=partID%>" name = "partID">
                </div>
                </form>
            <%
            break;
        case "Editing Accessory Entry:":
            %>
            <td>Type:</td>
            <td><input type="text" name="eType" value = "<%=rs.getString("type")%>" required></td></br>

            <br></br>
                <input type="submit" class="btn btn-primary" value="Edit Entry" name="editPart">
                <input type="hidden" value="<%=partID%>" name = "partID">
                </div>
                </form>
            <%
        break;
        case "Editing Switch Entry:":
            %>
                <td>Type:</td>
                    <select name="pType">
                        <option value="Linear">Linear</option>
                        <option value="Clicky">Clicky</option>
                        <option value="Tactile">Tactile</option>
                    </select></br>
                <td>Stem:</td>
                <td><input type="text" name="pStem" value = "<%=rs.getString("stem")%>" required></td></br>

                <br></br>
                <input type="submit" class="btn btn-primary" value="Edit Entry" name="editPart">
                <input type="hidden" value="<%=partID%>" name = "partID">
                </div>
                </form>
            <%
        break;
        default:
            break;
       }
    }
              //determine which part fields we need to supply
            
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