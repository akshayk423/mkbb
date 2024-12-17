<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<html>
    <head>
        <title>Cases Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <style>

            table{
                
                border: 1px solid !important;
                border-collapse: collapse!important;
            }
            .form-check-label {
                margin-right: 25;
            }

            .parent {
               
                margin: 1rem;
                
                text-align: left;
            }
            .child {
                display: inline-block;
          
                padding: 1rem 1rem;
                vertical-align: middle;
            }

            input[type=checkbox], input[type=radio] {
                box-sizing: border-box;
                padding: 3;
            }

            thead{
                font-weight: bold;
            }
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

            
        </style>


    </head>

    <body>
        <div>
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container">
                    <a class="navbar-brand" href="home.jsp">
                        <img alt src="logo.png" width="50" height="50">
                        Mechanical Keyboard Builder
                    </a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item active">
                        <a class="nav-link" href="partlists.jsp">Partlists <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                        <a class="nav-link">
                            
                        Login</a>
                        </li>
                    </ul>
                    </div>
                </div>
              </div>
            </nav>
        </div>

        <%
        String user = (String) session.getAttribute("dbuser");
        String password = (String) session.getAttribute("dbpassword");
        String username = (String) session.getAttribute("username");
        String url = (String) session.getAttribute("dburl");
        try {
            java.sql.Connection con; 
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url,user, password);
        %>
        <div>

            
            <div class="parent">
                <div class="child"> <input id="searchParams" type="text" placeholder="Search.." name="searchParams" onkeyup="myFunction()"></div>
                <div class="child">
                    <form id="filterOptions" action="cases.jsp" method="post">
                        <h3>Sizes</h3>
                        <div id="sizeCheckbox" class="form-check form-check-inline">
                            
                            <input class="form-check-input" type="checkbox"value="40%" name="40%">
                            <label class="form-check-label">40%</label>

                            <input class="form-check-input" type="checkbox"  value="60%" name="60%">
                            <label class="form-check-label">60%</label>

                            <input class="form-check-input" type="checkbox" value="65%" name="65%">
                            <label class="form-check-label">65%</label>

                            <input class="form-check-input" type="checkbox"  value="75%" name="75%">
                            <label class="form-check-label">75%</label>

                            <input class="form-check-input" type="checkbox"  value="TKL" name="TKL">
                            <label class="form-check-label">TKL</label>

                            <input class="form-check-input" type="checkbox"  value="Full Sized" name="FS">
                            <label class="form-check-label">Full Sized</label>

                            <input class="form-check-input" type="checkbox"  value="Numpad" name="NP">
                            <label class="form-check-label">Numpad</label>

                            <button class="btn btn-primary" type="submit" value = "filter" name="filter">Submit</button>
                        </div>
                    </form>
                    
                </div>
            </div>


        <table id="casesListings" width="100%">
            
            <thead>
                <tr>
                    <td>

                        <a onClick=sortTable(0)>Name</a>
    
                    </td>
                        
                    <td>
                        <a onClick=sortTable(1)>Brand</a>
                    
                    </td>
                    <td> 
                        <a onClick=sortPrices(2)>Price</a>
                    </td>
                    <td>Url</td>
                    <td>
                        <a onClick=sortTable(4)>Size</a>
                    </td>
                
                </tr>
            </thead>    

            <script>
            function sortTable(n) {
                var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
                table = document.getElementById("casesListings");
                switching = true;
                // Set the sorting direction to ascending:
                dir = "asc";
                /* Make a loop that will continue until
                no switching has been done: */
                while (switching) {
                  // Start by saying: no switching is done:
                  switching = false;
                  rows = table.rows;
                  /* Loop through all table rows (except the
                  first, which contains table headers): */
                  for (i = 1; i < (rows.length - 1); i++) {
                    // Start by saying there should be no switching:
                    shouldSwitch = false;
                    /* Get the two elements you want to compare,
                    one from current row and one from the next: */
                    x = rows[i].getElementsByTagName("TD")[n];
                    y = rows[i + 1].getElementsByTagName("TD")[n];
                    /* Check if the two rows should switch place,
                    based on the direction, asc or desc: */
                    if (dir == "asc") {
                      if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                        // If so, mark as a switch and break the loop:
                        shouldSwitch = true;
                        break;
                      }
                    } else if (dir == "desc") {
                      if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
                        // If so, mark as a switch and break the loop:
                        shouldSwitch = true;
                        break;
                      }
                    }
                  }
                  if (shouldSwitch) {
                    /* If a switch has been marked, make the switch
                    and mark that a switch has been done: */
                    rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                    switching = true;
                    // Each time a switch is done, increase this count by 1:
                    switchcount ++;
                  } else {
                    /* If no switching has been done AND the direction is "asc",
                    set the direction to "desc" and run the while loop again. */
                    if (switchcount == 0 && dir == "asc") {
                      dir = "desc";
                      switching = true;
                    }
                  }
                }
              }

              function sortPrices(n){
                var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
                table = document.getElementById("casesListings");
                switching = true;
                // Set the sorting direction to ascending:
                dir = "asc";
                /* Make a loop that will continue until
                no switching has been done: */
                while (switching) {
                  // Start by saying: no switching is done:
                  switching = false;
                  rows = table.rows;
                  /* Loop through all table rows (except the
                  first, which contains table headers): */
                  for (i = 1; i < (rows.length - 1); i++) {
                    // Start by saying there should be no switching:
                    shouldSwitch = false;
                    /* Get the two elements you want to compare,
                    one from current row and one from the next: */
                    x = parseFloat(rows[i].getElementsByTagName("TD")[n].innerHTML.substring(1,rows[i].getElementsByTagName("TD")[n].innerHTML.length)) ;
                    y = parseFloat(rows[i + 1].getElementsByTagName("TD")[n].innerHTML.substring(1,rows[i].getElementsByTagName("TD")[n].innerHTML.length));
                    /* Check if the two rows should switch place,
                    based on the direction, asc or desc: */
                    if (dir == "asc") {
                        
                      if (x > y) {
                        // If so, mark as a switch and break the loop:
                        shouldSwitch = true;
                        break;
                      }
                    } else if (dir == "desc") {
                      if (x < y) {
                        // If so, mark as a switch and break the loop:
                        shouldSwitch = true;
                        break;
                      }
                    }
                  }
                  if (shouldSwitch) {
                    /* If a switch has been marked, make the switch
                    and mark that a switch has been done: */
                    rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                    switching = true;
                    // Each time a switch is done, increase this count by 1:
                    switchcount ++;
                  } else {
                    /* If no switching has been done AND the direction is "asc",
                    set the direction to "desc" and run the while loop again. */
                    if (switchcount == 0 && dir == "asc") {
                      dir = "desc";
                      switching = true;
                    }
                  }
                }
              }

               function myFunction() {
                    var input, filter, ul, li, a, i, txtValue;
                    input = document.getElementById("searchParams");
                    filter = input.value.toUpperCase();
                    ul = document.getElementById("rows");
                    li = ul.getElementsByTagName("tr");
                    for (i = 0; i < li.length; i++) {
                        a = li[i].getElementsByTagName("td")[0];
                        txtValue = a.textContent || a.innerText;
                        if (txtValue.toUpperCase().indexOf(filter) > -1) {
                            li[i].style.display = "";
                        } else {
                            li[i].style.display = "none";
                        }
                    }
                }
                    
            </script>
            <tbody id="rows">
                <%
                    Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                    String query = "SELECT * FROM mkdb.keyboardpart NATURAL JOIN mkdb.kbcase;";
                    String filter = request.getParameter("filter");
                    String sort = request.getParameter("sort");
                    String partListID = "";
                    String addCase = request.getParameter("addCase");
                    if(addCase != null && addCase.equals("Add Case")){
                        partListID = request.getParameter("partListID");
                    }
                    //out.println(partListID);

                    String bookmark = request.getParameter("bookmark");
                    String addBookmarkID = "";
                    if (bookmark != null && bookmark.equals("Bookmark")) {

                        ResultSet rs = stmt.executeQuery("SELECT * FROM mkdb.bookmarks");

                        // add every id to a set
                        Set<String> idSet = new HashSet<String>();
                        while(rs.next()){
                            idSet.add(rs.getString(1).substring(2));
                        }

                        //generate new id
                        boolean unique = false;
                        Random random = new Random();
                        String id = "";
                        while(!unique){
                            String newId = String.format("%04d", random.nextInt(10000));
                            if(!idSet.contains(newId)){
                                id = "BL" + newId;																									// change to id = "PL" + curId;
                                unique = true;
                                break;
                            }
                        }
                        addBookmarkID = request.getParameter("addBookmarkID");
                        rs.moveToInsertRow();
                        rs.updateString(1,id);
                        rs.updateString(2,username);
                        rs.updateString(3,addBookmarkID);
                        rs.insertRow();
                    }


                    if(filter != null && filter.equals("filter")){
                        String size40 = request.getParameter("40%");
                        String size60 = request.getParameter("60%");
                        String size65 = request.getParameter("65%");
                        String size75 = request.getParameter("75%");
                        String tkl = request.getParameter("TKL");
                        String full = request.getParameter("FS");
                        String num = request.getParameter("NP");

                        ArrayList<String> filters = new ArrayList<>();

                        if(size40 != null){filters.add(size40);}
                        if(size60 != null){filters.add(size60);}
                        if(size65 != null){filters.add(size65);}
                        if(size75 != null){filters.add(size75);}
                        if(tkl != null){filters.add(tkl);}
                        if(full != null){filters.add(full);}
                        if(num != null){filters.add(num);}

                        if(filters.size() > 0){
                            query = query.substring(0,query.length()-1) + " WHERE ";
                            Iterator iterator = filters.iterator();
                            query += "size = '" + iterator.next() + "'";
                            while(iterator.hasNext()){
                                query += " OR size = '" + iterator.next() + "'";
                            }
                            query += ";";
                        }
                    }
                

                    String reported = request.getParameter("reportListing");
                    String reportPartID = "";
                    if (reported != null && reported.equals("Report")) {
                        reportPartID = request.getParameter("reportPartID");
                        //out.println(reportPartID);
                        ResultSet rs1 = stmt.executeQuery("SELECT * FROM mkdb.reportlistings");

                        // add every id to a set
                        Set<String> idSet = new HashSet<String>();
                        //populate map with ID's
                        rs1.moveToInsertRow();
                        while(rs1.next()){
                            idSet.add(rs1.getString(1).substring(2));
                        }

                        //generate new id
                        boolean unique = false;
                        Random random = new Random();
                        String id = "0000";
                        while(!unique){
                            String curId = String.format("%04d", random.nextInt(10000));
                            if(!idSet.contains(id)){
                                id = "RL" + curId;																									// change to id = "PL" + curId;
                                unique = true;
                                break;
                            }
                        }

                        //add entry
                        rs1.moveToInsertRow();
                        rs1.updateString("ReportListID", id);
                        rs1.updateString("PartID", reportPartID);
                        rs1.insertRow();

                        %><h4>Listing was reported</h4><%
                    }
                    

                    if(sort != null && sort.equals("sort")){
   
                        query = query.substring(0,query.length()-1) + " ORDER BY " + request.getParameter("sortCase") + ";"; 
                    
                    } 
                    ResultSet rs = stmt.executeQuery(query);
                    while(rs.next()){

                        String partName = rs.getString("Name");
                        String price = "$" + String.format("%.2f",rs.getDouble("Price"));
                        if(partName.length() > 20){ partName = partName.substring(0,20) + "...";}
                        %><tr>
                            <td width="25%"><%=partName%></td>
                            <td width="15%"><%=rs.getString("Brand")%></td>
                            <td width="10%"><%=price%></td>
                            <td width="10%"><a href="<%=rs.getString("URL")%>">Purchase</a></td>
                            <td width="10%"><%=rs.getString("Size")%></td>
                            <td>
                                <form action='partlist.jsp' method='post'>
                                    <input type='submit' class="btn btn-primary" value='Add Part' name='addPart'>
                                    <input type='hidden' value='<%=rs.getString(1)%>' name='addPartID'>
                                    <input type='hidden' value='<%=partListID%>' name= 'partListID'>
                                    <input type='hidden' value='<%=rs.getDouble("Price")%>' name='partPrice'>
                                </form>
                            </td>

                            <td width="2%">
                                <form action="cases.jsp" method="post">
                                    <input type="submit" class="btn btn-dark" value="Bookmark" name="bookmark">
                                    <input type='hidden' value='<%=rs.getString(1)%>' name="addBookmarkID">
                                </form>
                            </td>
                            <td width="2%">
                                <form action="cases.jsp" method="post">
                                    <input type="submit" class="btn btn-danger" value="Report" name="reportListing">
                                    <input type="hidden" value='<%=rs.getString(1)%>' name="reportPartID">
                                </form>
                            </td>

                        </tr><%
                    }

                }catch(SQLException e) { 
                    out.println("SQLException caught: " + e.getMessage()); 
                }
                %>



            </tbody>

        </div>

    </body>

</html>