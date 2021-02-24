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
                                        <input type="text" class="form-control" id="pname" name="pname" placeholder="Enter Project Title" value="" maxlength="35" required>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="pid">Special ID</label>
                                        <input type="text" class="form-control" id="pid" name="pid" placeholder="Add a Special Key to identify your project" value="" maxlength="19" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="ppath">Path</label>
                                    <input type="text" class="form-control" id="ppath" name="ppath" placeholder="Enter the physical path to your project for reference e.g. C:/path/customProject" value="" maxlength="90" required>
                                </div>
                                <div class="form-group">
                                    <label for="pdesc">Description</label>
                                    <textarea type="text" class="form-control" id="pdesc" name="pdesc" rows="3" maxlength="400" required>Write about your project</textarea>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="ptype">Private/Public</label>
                                        <select class="form-control" id="ptype" name="ptype" required>
                                            <option>Select..</option>
                                            <option value="private" selected>Private</option>
                                            <option value="public">Public</option>
                                        </select>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="ptech">Technology</label>
                                        <select class="form-control" id="ptech" name="ptech" required>
                                            <option>Select..</option>
                                            <option value="Web-Based" selected>Web-Based</option>
                                            <option value="Software-Based">Software-Software</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-12">
                                        <label for="plang">List all the languages Used:</label>
                                        <input type="text" class="form-control" id="plang" name="plang" placeholder="eg. python, sql,.." value="Python, MySql, Django" required>
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
                                "<div id='articleId-1' class='row rounded border my-4 ml-2 p-2 articleId-1' data-id='" + v.lab_id + "' data-by='" + v.lab_user + "' data-date='" + v.posted_on + "'>" +
                                "<div class='col-2'>" +
                                "<img " +
                                "src='https://cdn0.iconfinder.com/data/icons/cyber-crime-or-threats-glyph/120/ddos_attack_denial_of_service-512.png' " +
                                "class='img-fluid img-thumbnai' alt='Not found'>" +
                                "</div>" +
                                "<div class='col-10 article_content'>" +
                                "<h3 class='color-lightslategray float-left'><u>" + v.title + "</u><a href='http://localhost:8080/DiTuSte_Cryto/views/artViewerPage.jsp?art_id=" + v.lab_id + "' class='small text-primary' target='_blank'> View</a></h3>" +
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

                        lang = $('#plang').val().split(',').map((a) => a.trim());
                        $.ajax({
                            method: "POST",
                            url: "/DiTuSte_Cryto/addProjectServlet?" + $('#projectForm').serialize(),
                            data: {"art_items": art.toString(), "lang": lang.toString(), "received": "Yes"},
                            dataType: 'JSON'
                        }).done(function (data) {
                            console.log(data);
                            Swal.fire({
                                icon: 'success',
                                title: 'Project Created',
                                showConfirmButton: false,
                                timer: 1500
                            });
                        }).fail(function (jqXHR, textStatus) {
                            console.log(jqXHR);
                            console.log(textStatus);
                            alert("Request failed: " + textStatus);
                        });
                    } else {
                        Swal.fire({
                            icon: 'error',
                            title: 'Oops...',
                            text: 'Something went wrong! Make Sure to select one or more articles',
                            showConfirmButton: false,
                            timer: 1500
                        });
                    }
                });
            });
        </script>
    </body>
</html>