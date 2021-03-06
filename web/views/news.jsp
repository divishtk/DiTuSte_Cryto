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
            <%@include file="constant/sidebar1.jsp" %>

            <!-- Page Content  -->
            <div id="content">

                <%@include file="constant/headerNav1.jsp" %>

                <%
                    String name = "";
                    try {
                        name = (String) session.getAttribute("uName");
                    } catch (Exception e) {
                        e.printStackTrace();

                    }
                %>


                </br>

                <div class="container-fluid">
                    <div class="row">
                        <div class="col">
                            <div class="text-center">
                            <h2>Security News</h2>
                            <p>........Today's News....</p>
                            </div>
                            <div class="newsBlock">

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