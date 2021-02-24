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
            <%@include file="constant/sidebar1.jsp" %>

            <!-- Page Content  -->
            <div id="content">

                <%@include file="constant/headerNav1.jsp" %>
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
                            <div class="collapse show" id="collapseExample">
                                <div class="card card-body row">
                                    <div class="col-6">
                                        <label class="font-weight-bold">Special Id: </label>&nbsp;<span class="proj_spec">ISOSO</span>
                                    </div>
                                    <div class="col-6">
                                        <label class="font-weight-bold">View: </label>&nbsp;<span class="proj_view">Public</span>
                                    </div>
                                    <div class="col-12">
                                        <label class="font-weight-bold">Description: </label>&nbsp;<span class="proj_desc">Description</span>
                                    </div>
                                    <div class="col-6">
                                        <label class="font-weight-bold">Project Path: </label>&nbsp;<span class="proj_path">ISOSO</span>
                                    </div>
                                    <div class="col-6">
                                        <label class="font-weight-bold">Languages: </label>
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
                            <p class="h4 mx-2">
                                Any Notes:
                            </p>
                            <hr/>
                            <p>
                                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample1" aria-expanded="false" aria-controls="collapseExample1">
                                    To-Do List<small> (click to expand) </small>
                                </button>
                                <button id="saveTask" class="btn btn-success">Save Checked Task</button>
                            </p>
                            <div class="mb-2 mx-2">
                                <textarea id="task_notes" rows="3" maxlength="300" class="form-control"></textarea>
                            </div>
                            <div class="collapse article-selected show" id="collapseExample1">
                                <!--//articles-->
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
                    url: "/DiTuSte_Cryto/addProjectServlet?action=_proj_Id&proj_Id=" +<%=request.getParameter("proj_Id")%>,
                    dataType: 'JSON'
                }).done(function (data) {
                    console.log(data);
                    $('.proj_name').text(data.proj_name);
                    $('.proj_spec').text(data.spec_id);
                    $('.proj_view').text(data.proj_view_type);
                    $('.proj_desc').text(data.proj_desc);
                    $('.proj_path').text(data.proj_path);
                    $('.proj_language').append(data.proj_language.split(','));
                    var html = "";
                    $.each(data.proj_language.split(','), function (i, v) {
                        html += '<span class="badge badge-info"> ';
                        html += v;
                        html += ' </span>&nbsp;';
                    });
                    $('.proj_language').html(html);
                }).fail(function (jqXHR, textStatus) {
                    alert("Request failed: " + textStatus);
                });

                $.ajax({
                    method: "GET",
                    url: "/DiTuSte_Cryto/articleAddServlet?action=_projId&projId=" +<%=request.getParameter("proj_Id")%>,
                    dataType: "JSON"
                }).done(function (data) {//row [1 ,2 ,3 ,4, 5] //artList
                    console.log(data);
                    $('.article-selected').empty();
                    var html = "";
                    $.each(data, function (i, v) {//for loop
                        html += "<div class='card card-body p-2 mb-1'>" +
                                "<div class='row'>" +
                                "<div class='col-1'>" +
                                "<label class='checkbox float-right m-3'>" +
                                "<input type='checkbox' class='tracker-items success' data-art-id='" + v.lab_id + "'/><span class='success'></span>" +
                                "</label>" +
                                "</div>" +
                                "<div class='col-11'>" +
                                "<p class='h5 dont-indent'>Task " + (i + 1) + ": " + v.title + "</p>" +
                                "<p class='dont-indent'>Description: <br/><span class='small'>" + v.description + "</span></p>" +
                                "</div>" +
                                "</div>" +
                                "</div>";
                    });
                    console.log(html);
                    $('.article-selected').html(html);
                    if (html) {
                        $.ajax({
                            method: "GET",
                            url: "/DiTuSte_Cryto/addTracker?action=_proj_Id&proj_Id=" +<%=request.getParameter("proj_Id")%>,
                            dataType: 'JSON'
                        }).done(function (data) {
                            console.log(data);
                            $('#task_notes').val(data.take_notes);
                            $("input.tracker-items").each(function (i, v) {
                                if ($.inArray($(v).data('art-id').toString(), data.task_done.split(',')) != -1) {
                                    $(v).prop('checked', true).trigger('change');
                                }
                            })
                        }).fail(function (jqXHR, textStatus) {
                            alert("Request failed: " + textStatus);
                        });
                    }

                }).fail(function (jqXHR, textStatus) {
                    alert("Request failed: " + textStatus);
                });

                $(document).on('change', '.tracker-items', function () {
                    var sel = $(this).parent().parent().parent().find('.h5');
                    if (sel.css('text-decoration-line') == 'none') {
                        sel.css('text-decoration-line', 'line-through');
                    } else {
                        sel.css('text-decoration-line', 'none');
                    }
                });

                $(document).on("click", "#saveTask", function (e) {
                    e.preventDefault();
                    var task_notes = $('#task_notes').val();
                    var all_arr = [], done_arr = [], remain_arr = [];
                    $('.tracker-items:checkbox:checked').each(function () {
                        done_arr.push($(this).data('art-id'));
                    });
                    $('.tracker-items:checkbox:not(:checked)').each(function () {
                        remain_arr.push($(this).data('art-id'));
                    });
                    $.ajax({
                        method: "PUT",
                        url: "/DiTuSte_Cryto/addTracker?proj_id=" +<%=request.getParameter("proj_Id")%> + "&task_done=" + done_arr.join(',') + "&task_remain=" + remain_arr.join(',') + "&task_notes=" + task_notes,
                        dataType: 'JSON'
                    }).done(function (data) {
                        console.log(data);
                        Swal.fire({
                            icon: 'success',
                            title: 'Task Saved',
                            showConfirmButton: false,
                            timer: 1500
                        });
                    }).fail(function (jqXHR, textStatus) {
                        alert("Request failed: " + textStatus);
                    });
                });
            });

        </script>
    </body>

</html>
