<%-- 
    Document   : home2
    Created on : 12 Aug, 2020, 9:20:05 PM
    Author     : Nevets
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <title>Home</title>

        <%@ include file="/WEB-INF/jspf/linkFiles.jspf" %>
    </head>
    <body>

        <%

            String articleName, articledescription, articletitle, articleTopic, articleThreat, editArticleDoc;
            String message = "<div> <p class='h3 text-center text-info border-info'> No Data Found </p> </div>";
            
                Connection conn = null; // connection to the database
                try {
                    DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
                    conn = DriverManager.getConnection(
                            "jdbc:mysql://localhost:3306/cryptodb?useSSL=false&allowPublicKeyRetrieval=true", "root", "Steven@1996");

                    // constructs SQL statement
                    String sql = "select lab_id, lab_user, docText, tittle, topic, rated, data_file, posted_on, last_modified, description from article_storage ";

                    PreparedStatement statement = conn.prepareStatement(sql);
                    ResultSet rs = statement.executeQuery();
                    while (rs.next()) {
                        articleName = rs.getString(2);
                        articletitle = rs.getString(4);
                        articledescription = rs.getString(10);
                        articleTopic = rs.getString(5);
                        articleThreat = rs.getString(6);
                        editArticleDoc = rs.getString(3);

                        
                        
//                        request.setAttribute("articleName", articleName);
//                        request.setAttribute("articletitle", articletitle);
//                        request.setAttribute("articledescription", articledescription);
//                        request.setAttribute("articleTopic", articleTopic);
//                        request.setAttribute("editArticleDoc", editArticleDoc);

                        message = "<div> <p class='h3 text-center text-info border-info'> found Article of " + articleName + "</p> </div>";
                    }
                } catch (Exception e) {
                    System.out.println(e.getMessage());
                }
            request.setAttribute("message", message);
        %>

        <div class="wrapper">
            <!-- Sidebar  -->
            <nav id="sidebar">
                <div class="sidebar-header">
                    <h3 class="mx-3">DiTuSte <br/>&nbsp;&nbsp;&nbsp; Crypto</h3>
                </div>

                <ul class="list-unstyled components">
                    <li class="active">
                        <a href="#">Dashboard</a>
                    </li>
                    <li class="">
                        <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Security</a>
                        <ul class="collapse list-unstyled" id="homeSubmenu">
                            <li>
                                <a href="#">Security Tools</a>
                            </li>
                            <li>
                                <a href="#">Security Guidance</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">My Profile</a>
                    </li>
                    <li>
                        <a href="#">About Us</a>
                    </li>
                    <li>
                        <a href="#">Contact</a>
                    </li>
                </ul>
            </nav>

            <!-- Page Content  -->
            <div id="content">

                <nav class="navbar navbar-expand-lg navbar-light bg-light">
                    <div class="container-fluid">

                        <button type="button" id="sidebarCollapse" class="btn btn-info">
                            <i class="fas fa-align-left"></i>
                            <span>Menu</span>
                        </button>
                        <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <i class="fas fa-align-center"></i>
                        </button>

                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="nav navbar-nav ml-auto">
                                <li class="nav-item active">
                                    <a class="nav-link" href="#">My Profile <i class="fas fa-male"></i></a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">Notification <i class="fas fa-bell"></i></a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="/DiTuSte_Cryto/logoutSerlvet">Logout <i class="fas fa-sign-out-alt"></i></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
                <h2 class="text-center">Build your article and Post It</h2>
                <hr/>
                <div class="container row justify-content-center">
                    <div class="col-12">
                        <%= (String) request.getAttribute("message")%>
                    </div>
                    <div class="col-9 article-list">
                        
                        <div></div>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            
        });
    </script>
</body>

</html>