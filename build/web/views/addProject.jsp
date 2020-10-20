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
                <div class="container">
                    <div class="row">
                        <div class="col">
                            <form id="projectForm">
                                <div class="form">
                                    <p class="h2 text-center">Project Form</p>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="pname">Title</label>
                                        <input type="text" class="form-control" id="pname" name="pname" placeholder="Enter Project Title" value="My Custom Project 1">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="pid">Special ID</label>
                                        <input type="text" class="form-control" id="pid" name="pid" placeholder="Add a Special Key to identify your project" value="MyProject777">
                                    </div>
                                </div>
                                <div class="form-group">
                                        <label for="ppath">Special ID</label>
                                        <input type="text" class="form-control" id="ppath" name="ppath" placeholder="Enter the physical path to your project for reference" value="C:/projects/customProject">
                                    </div>
                                <div class="form-group">
                                    <label for="pdesc">Description</label>
                                    <textarea type="text" class="form-control" id="pdesc" name="pdesc" rows="3">
                                        This is a custom build project i have create for self purpose
                                    </textarea>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="ptype">Private/Public</label>
                                        <select class="form-control" id="ptype" name="ptype">
                                            <option>Select..</option>
                                            <option selected>Private</option>
                                            <option>Public</option>
                                        </select>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="ptech">Technology</label>
                                        <select class="form-control" id="ptech" name="ptech">
                                            <option>Select..</option>
                                            <option selected>Web-Based</option>
                                            <option>Software</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-12">
                                        <label for="plang">List all the languages Used:</label>
                                        <input type="text" class="form-control" id="plang" name="plang" placeholder="eg. python, sql,.." value="Python, MySql, Django">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="border-primary w-100 list-articles row" style="min-height: 100vh">
                                        
                                    </div>
                                </div>
                                <div class="form-group text-right">
                                    <button type="submit" class="btn btn-success" id="submitProject">Build Project</button>
                                </div>
                            </form>
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
                    url: "/DiTuSte_Cryto/articleAddServlet?action=_all",
                    method: "GET",
                    dataType: "JSON"
                }).done(function (data) {
                    console.log(data);
                    $('.list-articles').empty();
                    $.each(data, function (i, v) {
                        $('.list-articles').append("" +
                                "<div class='article-item col-12'>" +
                                "<div id='articleId-1' class='row rounded border my-4 ml-2 p-2 mouseOnHover articleId-1' data-id='" + v.lab_id + "' data-by='" + v.lab_user + "' data-date='" + v.posted_on + "'>" +
                                "<div class='col-2'>" +
                                "<img " +
                                "src='https://cdn0.iconfinder.com/data/icons/cyber-crime-or-threats-glyph/120/ddos_attack_denial_of_service-512.png' " +
                                "class='img-fluid img-thumbnai' alt='Not found'>" +
                                "</div>" +
                                "<div class='col-10 article_content'>" +
                                "<h3 class='color-lightslategray float-left'><u>" + v.title + "</u></h3>" +
                                "<label class='checkbox float-right'>" +
                                "<input type='checkbox' class='tracker-items' data-art-id='" + v.lab_id + "' /><span class='success'></span>" +
                                "</label>" +
                                "<div class='small float-left'>" +
                                v.description +
                                "</div>" +
                                "<div class='row color-darkgrey float-right small'>" +
                                "<div class='col-4'>" +
                                "<em><i>Uploaded by:</i> " + v.lab_user + "</em>" +
                                "</div>" +
                                "<div class='col-4'>" +
                                "<em><i>Uploaded date:</i>" + v.posted_on.slice(0, 10) + "</em>" +
                                "</div>" +
                                "<div class='col-4'>" +
                                " <em><i>Upvotes:</i> " + v.rating + "</em>" +
                                "</div>" +
                                "</div>" +
                                "</div>" +
                                "</div>" +
                                "</div>" +
                                "");
                    });
                }).fail(function (e) {
                    console.log(e);
                });

                $(document).on("click", "#submitProject", function (e) {
                    e.preventDefault();
                    var art = [];
                    var lang = [];
                    if ($('.tracker-items:checkbox:checked').length > 0) {
                        $('.tracker-items:checkbox:checked').each(function () {
                            art.push($(this).data('art-id'));
                        });
                        
                        lang = $('#plang').val().split(',').map((a) =>  a.trim());
                        $.ajax({
                            method: "POST",
                            url: "/DiTuSte_Cryto/addProjectServlet?"+$('#projectForm').serialize(),
                            data:{
                                'art_items':art,
                                'lang':lang
                            },
                            dataType: 'JSON'
                        }).done(function (data) {
                            console.log(data);
                            
                        }).fail(function (jqXHR, textStatus) {
                            console.log(jqXHR);
                            console.log(textStatus);
                            alert("Request failed: " + textStatus);
                        });
                    }
                });
            });
        </script>
    </body>

</html>