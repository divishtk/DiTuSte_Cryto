
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
                    <h2>My Project</h2>

                    <div class="row justify-content-between">
                        <div class="col-8">
                            <ul class="list-projects card card-body">
                                <ul class="list-group list-projects-1">
                                    <li class="list-group-item active">
                                        <span>Project Id</span> 
                                        |
                                        <span>Project Name</span> 
                                        |
                                        <span>Date</span>
                                    </li>
                                    <li class="list-group-item">
                                        <span>Project Id</span> 
                                        |
                                        <span>Project Name</span> 
                                        |
                                        <span>Date</span>
                                    </li>
                                    <li class="list-group-item">
                                        <span>Project Id</span> 
                                        |
                                        <span>Project Name</span> 
                                        |
                                        <span>Date</span>
                                    </li>
                                    <li class="list-group-item">
                                        <span>Project Id</span> 
                                        |
                                        <span>Project Name</span> 
                                        |
                                        <span>Date</span>
                                    </li>
                                </ul>
                            </ul>
                        </div>
                        <div class="col-4">
                            <div class="card card-body">
                                <h4>Projects</h4>
                                <hr/>
                                <p>
                                    Here is the list of all uar projects created to help stored 
                                    uar trackers and improve the security of uar project by to do list.
                                </p>
                                <button class="btn btn-block btn-info addProject">Create Project</button>
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
                $(document).on('click', '.addProject', function () {
                    var id = $(this).data('id');
                    window.location.replace("addProject.jsp");
                })
                $('#sidebarCollapse').on('click', function () {
                    $('#sidebar, #content').toggleClass('active');
                    $('.collapse.in').toggleClass('in');
                    $('a[aria-expanded=true]').attr('aria-expanded', 'false');
                });

                $.ajax({
                    method: "GET",
                    url: "/DiTuSte_Cryto/addProjectServlet?action=_all",
                    dataType: 'JSON'
                }).done(function (data) {
                    console.log(data);
                    if (data.length > 0) {
                        $('.list-projects-1').empty();
                        $.each(data, function (i, v) {
                            $('.list-projects-1').append("" +
                                    "<li class='list-group-item cursorOnHover' data-projid='" + v.proj_Id + "'>" +
                                    "<span>" + v.spec_id + "</span> ] <span class='font-weight-bold'> " + v.proj_name + " </span><br/><span  class='pull-right'>Dated: " + v.modified_date + "</span>" +
                                    "<p class='' style='font-size:12px'>Description: <br/>" + v.proj_desc + "</p></li>");
                        });
                    }
                }).fail(function (jqXHR, textStatus) {
                    console.log(jqXHR);
                    console.log(textStatus);
                    alert("Request failed: " + textStatus);
                });
                
                $(document).on("click", ".list-group-item", function (e) {
                    e.preventDefault();
                    var proj_Id = $(this).data("projid");
                    window.location.href = "displayProject.jsp?proj_Id=" + proj_Id;
                });
            });
        </script>
    </body>
</html>