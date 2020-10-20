<%-- 
    Document   : home2
    Created on : 12 Aug, 2020, 9:20:05 PM
    Author     : Nevets
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <title>Home</title>

        <%@ include file="/WEB-INF/jspf/linkFiles.jspf" %>
        <style>

            .color-darkgrey{
                color: darkgrey;
            }
            .color-lightslategray{
                color: lightslategray;
            }
            blockquote{
                background-color: #f6f6f6;
            }
            pre{
                padding: 5px 10px;
            }
            .stickyFeature{
                position: sticky;
                top:0;
                padding-top:50px;
            }
            .list-group-item{
                width: 250px;
            }
        </style>
    </head>
    <body>
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
                <div class="row">
                    <div class="col-12">
                        <p class="h2 text-center">Denial Of Service</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-9 art_doc">

                    </div>
                    <div class="row">
                        <div class="col-3 small">
                            <ul class="list-group stickyFeature">
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                    Uploaded by:
                                    <span class="uploadBy">Steven</span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                    Uploaded date:
                                    <span class="uploadDate">03-09-2020</span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                    Upvotes
                                    <span class="badge badge-success badge-pill uploadRating">210</span>
                                </li>
                            </ul>
                        </div>
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
                        url: "/DiTuSte_Cryto/articleAddServlet?action=_labId&lab_id=" +<%=request.getParameter("art_id")%>,
                        method: "GET",
                        dataType: "JSON"
                    }).done(function (data) {
                        console.log(data);
                        $('.art_doc').empty();
                        let bytesView = new Uint8Array(data.data_file.binaryData);
                        // convert bytes to string
                        // encoding can be specfied, defaults to utf-8 which is ascii.
                        let str = new TextDecoder().decode(bytesView);
                        console.log(str);
                        $('.uploadBy').text(data.lab_user);
                        $('.uploadDate').text(data.posted_on.slice(0,10));
                        $('.uploadRating').text(data.rating);
                        $('.art_doc').html(str);
                    }).fail(function (e) {
                        console.log(e);
                    });
                });
            </script>
    </body>
</html>
