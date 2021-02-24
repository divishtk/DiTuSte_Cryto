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
        <style>
            .articles > .articleCols > div.row > .article_content > p {
                overflow: hidden;
                width:100%;
                display: -webkit-box;
                -webkit-line-clamp: 3;
                -webkit-box-orient: vertical;
            }
            .color-darkgrey{
                color: darkgrey;
            }
            .color-lightslategray{
                color: lightslategray;
            }
        </style>
    </head>
    <body>
        <div class="wrapper">
            <!-- Sidebar  -->
            <!-- Sidebar  -->

            <%@include file="constant/sidebar2.jsp" %>

            <div id="content">
                <!-- Page Content  -->
                <%@include file="constant/headerNav2.jsp" %>
                <h1 class="text-center mt-3">My Article</h1>
                <hr/>
                <p class="dont-indent">
                <div class="px-4">
                    Articles is the page where one needs to discover how to resolve and prevent cyber attack on hosted 
                    project. 
                    <br/>
                    <br/>
                    <br/>
                    <div class="">
                        <a href="/DiTuSte_Cryto/views/editArticle.jsp"><button class="btn btn-danger"><i class="fa fa-plus"></i> Add Article</button></a>
                    </div>
                    
                    <br/>
                    <span class="text-danger">Click the below article yuh need to update.</span>
                </div>

                </p>
                <div class="container-fluid">
                    <div class="row justify-content-center articles">
                        <div class="articleCols col-12">
                            <div id="articleId-1" class="row rounded border my-4 ml-2 p-2 mouseOnHover" data-by="" data-date="">
                                <div class="col-2">
                                    <img 
                                        src="https://cdn0.iconfinder.com/data/icons/cyber-crime-or-threats-glyph/120/ddos_attack_denial_of_service-512.png" 
                                        class="img-fluid img-thumbnail" alt="Not found">
                                </div>
                                <div class="col-10 article_content">
                                    <h3 class="color-lightslategray"><u>Dummy Article</u></h3>
                                    <p class="small">Denial of Service (DOS) is a cyber-attack on an individual Computer or 
                                        Website with intent to deny services to intended users.Their purpose is 
                                        to disrupt an organization’s network operations by denying access to its 
                                        users.Denial of service is typically accomplished by flooding the targeted 
                                        machine or resource with surplus requests in an attempt to overload systems 
                                        and prevent some or all legitimate requests from being fulfilled.
                                    </p>
                                    <div class="row color-darkgrey">
                                        <div class="col-4">
                                            <em><i>Uploaded by:</i> Steven</em>
                                        </div>
                                        <div class="col-4">
                                            <em><i>Uploaded date:</i> 03-09-2020</em>
                                        </div>
                                        <div class="col-4">
                                            <em><i>Upvotes:</i> 210</em>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="articleCols col-12">
                            <div id="articleId-1" class="row rounded border my-3 ml-2 p-2 mouseOnHover" data-by="" data-date="">
                                <div class="col-2">
                                    <img 
                                        src="https://cdn0.iconfinder.com/data/icons/cyber-crime-or-threats-glyph/120/ddos_attack_denial_of_service-512.png" 
                                        class="img-fluid img-thumbnail" alt="Not found">
                                </div>
                                <div class="col-10 article_content">
                                    <h3 class="color-lightslategray"><u>Dummy Article</u></h3>
                                    <p class="small">Denial of Service (DOS) is a cyber-attack on an individual Computer or 
                                        Website with intent to deny services to intended users.Their purpose is 
                                        to disrupt an organization’s network operations by denying access to its 
                                        users.Denial of service is typically accomplished by flooding the targeted 
                                        machine or resource with surplus requests in an attempt to overload systems 
                                        and prevent some or all legitimate requests from being fulfilled.
                                    </p>
                                    <div class="row color-darkgrey">
                                        <div class="col-4">
                                            <em><i>Uploaded by:</i> Steven2</em>
                                        </div>
                                        <div class="col-4">
                                            <em><i>Uploaded date:</i> 03-09-2020</em>
                                        </div>
                                        <div class="col-4">
                                            <em><i>Upvotes:</i> 210</em>
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
                    $(document).on('click', '.articleId-1', function () {
                        var id = $(this).data('id');
                        window.location.replace("editArticle.jsp?lab_Id=" + id);
                    });
                    $.ajax({
                        url: "/DiTuSte_Cryto/articleAddServlet?action=_all",
                        method: "GET",
                        dataType: "JSON"
                    }).done(function (data) {
                        console.log(data);
                        $('.articles').empty();
                        $.each(data, function (i, v) {
                            $('.articles').append("" +
                                    "<div class='articleCols col-12'>" +
                                    "<div id='articleId-1' class='row rounded border my-4 ml-2 p-2 mouseOnHover articleId-1' data-id='" + v.lab_id + "' data-by='" + v.lab_user + "' data-date='" + v.posted_on + "'>" +
                                    "<div class='col-2'>" +
                                    "<img " +
                                    "src='https://cdn0.iconfinder.com/data/icons/cyber-crime-or-threats-glyph/120/ddos_attack_denial_of_service-512.png' " +
                                    "class='img-fluid img-thumbnai' alt='Not found'>" +
                                    "</div>" +
                                    "<div class='col-10 article_content'>" +
                                    "<h3 class='color-lightslategray'><u>" + v.title + "</u></h3>" +
                                    "<p class='small'>" +
                                    v.description +
                                    "</p>" +
                                    "<div class='row color-darkgrey'>" +
                                    "<div class='col-4'>" +
                                    "<em><i>Uploaded by:</i> " + v.lab_user + "</em>" +
                                    "</div>" +
                                    "<div class='col-4'>" +
                                    "<em><i>Uploaded date:</i>" + v.posted_on + "</em>" +
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
                });
            </script>

        </div>
    </body>

</html>