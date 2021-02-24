
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
                <div class="container-fluid">
                    <h2>My Project</h2>

                    <div class="row justify-content-between">
                        <div class="col-8">
                            <div class="list-projects card card-body">
                                <ul class="list-group list-projects-1">
                                    
                                </ul>
                            </div>
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
                    }else{
                        $('.list-projects-1').append("" +
                                    "<li class='list-group-item cursorOnHover'>" +
                                    "<p class='' style='font-size:12px'> No Projects Created!!</p></li>");
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