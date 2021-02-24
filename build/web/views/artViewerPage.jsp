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

            <%@include file="constant/sidebar2.jsp" %>

            <div id="content">
                <!-- Page Content  -->
                <%@include file="constant/headerNav2.jsp" %>
                <div class="row">
                    <div class="col-12">
                        <p class="h2 text-center">Article File</p>
                        <hr/>
                    </div>
                </div>
                <div class="row justify-content-between">
                    <div class="col-9 art_doc" style="border: 2px solid darkgrey;border-radius: 5px;padding: 25px 10px">

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
