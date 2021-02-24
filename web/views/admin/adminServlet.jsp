<%-- 
    Document   : adminServlet
    Created on : 23 Oct, 2020, 6:22:35 PM
    Author     : Nevets
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.database.ConnectionManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <title>DiTuSte_Crypto</title>

        <%@ include file="/WEB-INF/jspf/linkFiles.jspf" %>
    </head>
    <body>

        <%
            ResultSet rs = null;
            try {
                String uid;
                String uname, upass, uemail, utype, udate;
                Connection conn = ConnectionManager.getConnection();
                PreparedStatement ps = conn.prepareStatement("SELECT userId, userName, userPassword, userEmailId, userType, updatedBy FROM users2");
                rs = ps.executeQuery();
//                while(rs.next()){
//                    uid = String.valueOf(rs.getInt(1));
//                    uname = rs.getString(2);
//                    upass =rs.getString(3);
//                    uemail = rs.getString(4);
//                    utype = rs.getString(5);
//                    udate = rs.getString(6);
//                }
            } catch (Exception e) {
            }

        %>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <p class="h2">User Admin Table</p>
                </div>
                <div class="col-12">
                    <table border="1" cellspacing="2" cellpadding="2">
                        <thead>
                            <tr>
                                <th>userId</th>
                                <th>userName</th>
                                <th>userPassword</th>
                                <th>userEmailId</th>
                                <th>userType</th>
                                <th>updatedBy</th>
                                <th>Edit</th>
                                <th>Delete</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%  while (rs.next()) {%>
                            <tr>
                                <td><%= String.valueOf(rs.getInt(1))%></td>
                                <td><%= rs.getString(2)%></td>
                                <td><%= rs.getString(3)%></td>
                                <td><%= rs.getString(4)%></td>
                                <td><%= rs.getString(5)%></td>
                                <td><%= String.valueOf(rs.getString(6)).substring(0, 10)%></td>
                                <td>
                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
                                        <i class="fa fa-pencil-alt"></i>
                                    </button>
                                </td>
                                <td>
                                    <form action="/DiTuSte_Cryto/userAdminServlet" method="GET">
                                        <input type="hidden" name="uid" value="<%= rs.getInt(1)%>"/> 
                                        <button class="text-danger" type="submit"><i class="fas fa-trash"></i></button>
                                    </form>
                                </td>
                            </tr>
                            <% } %>
                        </tbody>


                        <!--                        <tbody>
                                                    <tr>
                                                        <td>101</td>
                                                        <td>Steven</td>
                                                        <td>123456</td>
                                                        <td>steven@email.com</td>
                                                        <td>LabUser</td>
                                                        <td>12 dec</td>
                                                        <td>
                                                            <span class="text-success"><i class="fa fa-pencil-alt"></i></span> |
                                                            <span class="text-danger"><i class="fas fa-trash"></i></span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>102</td>
                                                        <td>Steven</td>
                                                        <td>123456</td>
                                                        <td>steven@email.com</td>
                                                        <td>LabUser</td>
                                                        <td>12 dec</td>
                                                        <td>
                                                            <span class="text-success"><i class="fa fa-pencil-alt"></i></span> |
                                                            <span class="text-danger"><i class="fas fa-trash"></i></span>
                                                        </td>
                                                    </tr>
                                                </tbody>-->
                    </table>


                </div>
                <div class="col-12">
                    <h2>Message</h2>
                    <%
                        String message = "no meesage received from server!";
                        if (!"".equals(request.getAttribute("message")) && request.getAttribute("message") != null) {
                            message = (String) request.getAttribute("message");
                        }
                    %>
                    <p class="h3"><%= message%></p>
                </div>

            </div>
        </div>


        <!-- Modal -->
        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form action="/DiTuSte_Cryto/userAdminServlet" method="POST">
                        <div class="modal-body">

                            <div class="row">
                                <div class="col-6">
                                    <label>User Id</label>
                                    <input type="text" name="uid" value="7" readonly/>
                                </div>
                                <div class="col-6">
                                    <label>User Name</label>
                                    <input type="text" name="uname"/>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-6">
                                    <label>User password</label>
                                    <input type="text" name="upass"/>
                                </div>
                                <div class="col-6">
                                    <label>User Email</label>
                                    <input type="text" name="uemail"/>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-6">
                                    <label>User Type</label>
                                    <input type="text" name="utype"/>
                                </div>
                                <div class="col-6">
                                    <label>Date</label>
                                    <input type="text" name="udate"/>
                                </div>
                            </div>
                            <button class="btn btn-primary" type="submit">Save changes</button>
                        </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            
                        </div>
                </div>
            </div>
        </div>
    </body>
</html>
