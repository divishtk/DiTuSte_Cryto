<%-- 
    Document   : home2
    Created on : 12 Aug, 2020, 9:20:05 PM
    Author     : Nevets
--%>

<%@page import="com.database.ConnectionManager"%>
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

        <title>DiTuSte_Crypto</title>

        <%@ include file="/WEB-INF/jspf/linkFiles.jspf" %>
    </head>
    <body>

        <%

            String articleName, articledescription, articletitle, articleTopic, articleThreat, editArticleDoc;
            String message = "<div> <p class='h3 text-center text-info border-info'> No Data Found </p> </div>";
            
                Connection conn = null; // connection to the database
                try {
                    DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
                    conn = ConnectionManager.getConnection();

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

            <%@include file="constant/sidebar2.jsp" %>

            <div id="content">
                <!-- Page Content  -->
                <%@include file="constant/headerNav2.jsp" %>
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