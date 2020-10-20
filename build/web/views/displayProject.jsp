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
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12">
                            <h2 class="text-center proj_name">Project Name</h2>
                        </div>
                        <div class="col-12">
                            <p>
                                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                                    Project Details<small> (click to expand) </small>
                                </button>
                            </p>
                            <div class="collapse" id="collapseExample">
                                <div class="card card-body row">
                                    <div class="col-6">
                                        <label>Special Id: </label><span class="proj_spec">ISOSO</span>
                                    </div>
                                    <div class="col-6">
                                        <label>View: </label><span class="proj_view">Public</span>
                                    </div>
                                    <div class="col-12">
                                        <label>Description: </label><span class="proj_view">Public</span>
                                    </div>
                                    <div class="col-6">
                                        <label>Project Path: </label><span class="proj_path">ISOSO</span>
                                    </div>
                                    <div class="col-6">
                                        <label>Languages: </label>
                                        <span class="proj_language">
                                            <span class="badge badge-primary">MySql</span>
                                            <span class="badge badge-danger">Python</span>
                                            <span class="badge badge-info">Java</span>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12">
                            <hr/>
                            <p>
                                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample1" aria-expanded="false" aria-controls="collapseExample1">
                                    To-Do List<small> (click to expand) </small>
                                </button>
                            </p> 
                            <div class="collapse" id="collapseExample1">
                                <div class="card card-body p-2 mb-1">
                                    <div class="row">
                                        <div class="col-1">
                                            <label class='checkbox float-right m-3'>
                                                <input type='checkbox' class='tracker-items'/><span class='success'></span>
                                            </label>
                                        </div>
                                        <div class="col-11">
                                            <p class="h5">Task 1: Article Name</p>
                                            <p>Completed: <span class="text-success">YES</span></p>
                                        </div>
                                    </div>
                                </div>
                                <div class="card card-body p-2 mb-1">
                                    <div class="row">
                                        <div class="col-1">
                                            <label class='checkbox float-right m-3'>
                                                <input type='checkbox' class='tracker-items'/><span class='success'></span>
                                            </label>
                                        </div>
                                        <div class="col-11">
                                            <p class="h5">Task 1: Article Name</p>
                                            <p>Completed: <span class="text-success">YES</span></p>
                                        </div>
                                    </div>
                                </div>
                                <div class="card card-body p-2 mb-1">
                                    <div class="row">
                                        <div class="col-1">
                                            <label class='checkbox float-right m-3'>
                                                <input type='checkbox' class='tracker-items'/><span class='success'></span>
                                            </label>
                                        </div>
                                        <div class="col-11">
                                            <p class="h5">Task 1: Article Name</p>
                                            <p>Completed: <span class="text-success">YES</span></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

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
                    method: "POST",
                    url: "/DiTuSte_Cryto/addProjectServlet?action=_all&proj_id=" +<%=request.getParameter("proj_id")%>,
                    dataType: 'JSON'
                }).done(function (data) {
                    console.log(data);
                }).fail(function (jqXHR, textStatus) {
                    alert("Request failed: " + textStatus.reponseText());
                });
            });

        </script>
    </body>

</html>
