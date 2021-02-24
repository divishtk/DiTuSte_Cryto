<%-- 
    Document   : home2
    Created on : 12 Aug, 2020, 9:20:05 PM
    Author     : Nevets
--%>

<%@page import="com.database.ConnectionManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link rel="icon" 
              type="image/png" 
              href="https://www.iseurope.org/exhibitor_logos/logo_200_200/DTS_00157000024e5kWAAQ.jpg">

        <title>DiTuSte_Crypto</title>

        <%@ include file="/WEB-INF/jspf/linkFiles.jspf" %>
    </head>
    <body>
        <div class="wrapper">
            <!-- Sidebar  -->
            <%@include file="constant/sidebar1.jsp" %>

            <!-- Page Content  -->
            <div id="content">

                <%@include file="constant/headerNav1.jsp" %>
                <%
                    String name = "";
                    String pass = "";
                    try {
                        name = (String) session.getAttribute("uName");
                        pass = (String) session.getAttribute("uemailId");

                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection dbConn = ConnectionManager.getConnection();
                        dbConn.setAutoCommit(false);

                        Statement st = dbConn.createStatement();
                        // st.execute("select userName, userPassword, userEmailId, userType from Users2 where userName=name and userPassword=pass");

                        ResultSet rs = st.executeQuery("select userName, userPassword, userEmailId, userType,userAge,userGender,userAddress,userExp,userLang from Users2 where userName='" + name + "'and userPassword='" + pass + "'");

                        while (rs.next()) {
                            // System.out.println("name"+rs.getString(1));
                            //    System.out.println(rs.getString(2));
                            //       System.out.println(rs.getString(3));
                            //          System.out.println(rs.getString(4));
                            String n, p, mail, type, age, gender, address, exp, lang;
                            n = rs.getString(1);
                            p = rs.getString(2);
                            mail = rs.getString(3);
                            type = rs.getString(4);
                            age = rs.getString(5);
                            gender = rs.getString(6);
                            address = rs.getString(7);
                            exp = rs.getString(8);
                            lang = rs.getString(9);
                            HttpSession s = request.getSession();
                            s.setAttribute("name", n);
                            s.setAttribute("pass", p);
                            s.setAttribute("EmailId", mail);
                            s.setAttribute("type", type);
                            s.setAttribute("age", age);
                            s.setAttribute("gender", gender);
                            s.setAttribute("address", address);
                            s.setAttribute("exp", exp);
                            s.setAttribute("lang", lang);

                        }

                    } catch (Exception e) {
                        e.printStackTrace();

                    }


                %>
                <center> <h1>Welcome to DiTuSte Crypto,<br/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <%= name%></h1></center>
                
                
                <div class="row vh-90" style="min-height: 80vh ">
                    <div class="col-6 m-auto text-center">
                        <p class="h2">
                            View Articles
                        </p>
                        <p class="h4">
                            Articles is a similar to blogs where experts/contributor upload their 
                            articles to help young developer to understand the concepts of web security
                        </p>
                    </div>
                    <div class="col-6 m-auto text-center">
                        <p class="h4">
                            <img src="https://cdn.writermag.com/2016/12/blogs-versus-articles.jpg" alt="image"
                                 style="height: 220px" >
                        </p>
                    </div>
                </div>
                <div class="row vh-90" style="min-height: 80vh ">
                    <div class="col-6 m-auto text-center">
                        <p class="h4">
                            <img src="data:image/png;base64,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" alt="image"
                                 style="height: 220px" >
                        </p>
                    </div>
                    <div class="col-6 m-auto text-center">
                        <p class="h2">
                            View MiniTools
                        </p>
                        <p class="h4">
                            MiniTools are programs coded by contributors to help user easy some day-to-day
                            task and help user to safeguard their security.
                        </p>
                    </div>
                    
                </div>
                <div class="row vh-90" style="min-height: 80vh ">
                    <div class="col-6 m-auto text-center">
                        <p class="h2">
                            View/Edit Projects
                        </p>
                        <p class="h4">
                            Its difficult to track articles and blogs to solve and build security 
                            modules using the create project feature you can build and track the 
                            articles yuh have read.
                        </p>
                    </div>
                    <div class="col-6 m-auto text-center">
                        <p class="h4">
                            <img src="https://img.freepik.com/free-vector/list-flat-illustration_183665-75.jpg?size=626&ext=jpg" alt="image"
                                 style="height: 220px" >
                        </p>
                    </div>
                </div>

                <div class="line"></div>

                <h2>Security News</h2>
                <p>........Today's News....</p>

                <div class="newsBlock">
                    <!--                    <div class="row rounded border-default shadow m-2 mt-5">
                                            <div class="col-2 p-2">
                                                <img width="auto" height="100px"
                                                    src="data:image/png;base64,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"
                                                    >
                                            </div>
                                            <div class="col-10">
                                                <h3>Quickstrom: High-confidence browser testing</h3>
                                                <span><a>https://wickstrom.tech/programming/2020/08/27/introducing-quickstrom-high-confidence-brows</a></span><br/>
                                                <span>Author: "todsacerdoti"</span>&nbsp;&nbsp;&nbsp;&nbsp;<span> Date: "2020-08-28T04:25:10.000Z"</span>
                                            </div>
                                        </div>
                                        <div class="row rounded border-default shadow m-2 mt-5">
                                            <div class="col-2 p-2">
                                                <img width="auto" height="100px"
                                                    src="data:image/png;base64,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"
                                                    >
                                            </div>
                                            <div class="col-10">
                                                <h3>How to use your Android smartphone as the speaker of your Window's PC</h3>
                                                <span><a>https://www.brumpost.com/use-android-phone-as-pc-speaker/</a></span><br/>
                                                <span>Author: "todsacerdoti"</span>&nbsp;&nbsp;&nbsp;&nbsp;<span> Date: "2020-08-28T04:25:10.000Z"</span>
                                            </div>
                                        </div>-->
                </div>
            </div>
        </div>
        <script type="text/javascript">
            $(document).ready(function () {
                $("#sidebar").mCustomScrollbar({
                    theme: "minimal"
                });

                $('#sidebarCollapse').on('click', function () {
                    $('#sidebar, #content').toggleClass('active');
                    $('.collapse.in').toggleClass('in');
                    $('a[aria-expanded=true]').attr('aria-expanded', 'false');
                });

                $.ajax({
                    url: "/DiTuSte_Cryto/redirectController?action=newsAPI",
                    method: "GET",
                    dataType: "JSON"
                }).done(function (data) {
                    console.log(data);
                    data = JSON.parse(data).hits;
                    $.each(data, function (index, news) {
                        $(".newsBlock").append(
                                '<div class="row rounded border-default shadow m-2 mt-5">' +
                                '<div class="col-2 p-2">' +
                                '<img width="auto" height="100px"' +
                                'src="data:image/png;base64,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"' +
                                '>' +
                                '</div>' +
                                '<div class="col-10">' +
                                '<h3>' + news.title + '</h3>' +
                                '<span><a href="' + news.url + '">' + news.url + '</a></span><br/>' +
                                '<span style="float: right;padding-left: 20px;margin-top: 20px;">Author: ' + news.author + ' </span><span  style="float: right;padding-left: 20px;margin-top: 20px;"> Date: ' + (news.created_at ? news.created_at.slice(0, 11) : 'N/A') + '</span>' +
                                '</div>' +
                                '</div>'
                                );
                    })
                }).fail(function (html) {
                    console.log(html);
                });
            });
        </script>
    </body>

</html>

