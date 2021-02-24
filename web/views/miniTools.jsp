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
                        <div class="col-12">
                            <h2 class="text-center"> Mini Tools </h2>
                            <p class="h5">
                                &nbsp;&nbsp;&nbsp;&nbsp;Download the tools and use to help make your software cyber-threat free. 
                                Each tools have its own instruction file, kindly download the file and 
                                read the instructions carefully for installing and utilizing it. TY.
                            </p>
                            <small>Download and use. Keep your web security strong</small>
                            <hr/>
                        </div>
                        <div class="col-12 row justify-content-around text-center p-5 minitools">

                            <div class="col-3 card card-body">
                                <div class="p-5"> Tool-Title </div>
                                <hr/>
                                <div class="row">
                                    <div class="col-4" title="Download"> <i class="fas fa-download"></i> </div>
                                    <div class="col-4" title="Instructions"> <i class="fas fa-book"></i> </div>
                                    <div class="col-4" title="Upvote"> <i class="fas fa-heart"></i> </div>
                                </div>
                            </div>
                            <div class="col-3 card card-body">
                                <div class="p-5"> Tool-Title </div>
                                <hr/>
                                <div class="row">
                                    <div class="col-4"> 
                                        <i class="fas fa-download"></i> 
                                        
                                    </div>
                                    <div class="col-4"> <i class="fas fa-book"></i> </div>
                                    <div class="col-4"> <i class="fas fa-heart"></i> </div>
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
                method: "GET",
                url: "/DiTuSte_Cryto/miniToolsServlet?action=_all",
                dataType: 'JSON'
            }).done(function (data) {
                console.log(data);
                $('.minitools').empty();
                var html = "";
                $.each(data, function (i, v) {
                    html += "<div class='col-3 card card-body'>"
                            + "<div class='p-1'>" + v.title + "</div>"
                            + "<div class='px-1 py-2'>" + v.desc + "</div><hr/>"
                            + "<div class='row'>"
                            + "<div class='col-4 px-0 downloadMTool cursorOnHover text-success' data-lab-id='" + v.lab_id + "'> <i class='fas fa-download'></i><span class='text-dark' style='display:block;font-size: 9px'>Download</span> </div>"
                            + "<div class='col-4 px-0 downloadITool cursorOnHover text-info' data-lab-id='" + v.lab_id + "'> <i class='fas fa-book'></i><span class='text-dark' style='display:block;font-size: 9px'>Instruction</span> </div>"
                            + "<div class='col-4 px-0 likeTool cursorOnHover text-secondary' data-lab-id='" + v.lab_id + "'> <i class='fas fa-heart'></i><span class='text-dark' style='display:block;font-size: 9px'>Like</span> "
                            + "</div></div></div>";
                    $('.minitools').html(html);
                });
            }).fail(function (jqXHR, textStatus) {
                alert("Request failed: " + textStatus.reponseText());
            });

            $(document).on("click", ".downloadMTool", function (e) {
                e.preventDefault();
                window.location.href = "/DiTuSte_Cryto/miniToolsServlet?action=_downloadTool&lab_id=" + $(this).data("lab-id");
            });
            $(document).on("click", ".downloadITool", function (e) {
                e.preventDefault();
                window.location.href = "/DiTuSte_Cryto/miniToolsServlet?action=_downloadInstruct&lab_id=" + $(this).data("lab-id");
            });
            $(document).on("click", ".likeTool", function (e) {
                e.preventDefault();
                
                var this1 = $(this);
                $.ajax({
                    method: "GET",
                    url: "/DiTuSte_Cryto/miniToolsServlet?action=_upvoteTool&lab_id=" + $(this).data("lab-id"),
                    dataType: 'JSON'
                }).done(function (data) {
                    console.log(data);
                    if (data.response == "Updated") {
                        this1.removeClass("text-secondary");
                        this1.addClass("text-danger");
                    } else {
                        Swal.fire({
                            icon: 'danger',
                            title: 'Failed to vote',
                            showConfirmButton: false,
                            timer: 1500
                        });
                    }
                }).fail(function (jqXHR, textStatus) {
                    alert("Request failed: " + textStatus.reponseText());
                });
//                window.location.href = "/DiTuSte_Cryto/miniToolsServlet?action=_upvoteTool&lab_id=" + $(this).data("lab-id");
            });
        });
    </script>
</body>

</html>