<%@page import="com.database.ConnectionManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <title>Home</title>

        <%@ include file="/WEB-INF/jspf/linkFiles.jspf" %>

        <style>


        </style>
    </head>
    <body


        <%

            String n = "";
            String p = "";
            String uid = "";
            String t = "";
            String d = "";
            String r = "";
            String top = "";
            try {
                n = (String) session.getAttribute("uName");
                p = (String) session.getAttribute("uemailId");
                uid = (String) session.getAttribute("userid");

                System.out.println("Name is " + n);
                System.out.println("Password is " + p);

                System.out.println("User id of lab is " + uid);

                //getting lab id for updating
                String labid = null;
//
//                Connection dbConn = ConnectionManager.getConnection();
//
//                Statement st = dbConn.createStatement();
//                // st.execute("select userName, userPassword, userEmailId, userType from Users2 where userName=name and userPassword=pass");
//
//                ResultSet rs1 = st.executeQuery(""
//                        + "select title, description, data_file, instruction_file,uploaded,"
//                        + "approved,last_modified,ratings,topic from minitools_storage where "
//                        + "lab_user='" + uid + "'");
//
//                while (rs1.next()) {
//                    //   t = rs.getString(1);
//                    // d = rs.getString("description");
//                    //r = rs.getString(8);
//                    //top = rs.getString(9);
//
//                }
            } catch (Exception e) {
                System.out.println(e);
            }

            System.out.println("DESS " + d);
        %>

        <div class="wrapper">
            <!-- Sidebar  -->

            <%@include file="constant/sidebar2.jsp" %>

            <div id="content">
                <!-- Page Content  -->
                <%@include file="constant/headerNav2.jsp" %>
                <%
                    String name = (String) session.getAttribute("uName");
                %>

                <div>
                    <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" id="pills-basicinfo-tab" data-toggle="pill" href="#pills-basicinfo" role="tab" aria-controls="pills-basicinfo" aria-selected="true">Basic Info</a>
                        </li>



                        <li class="nav-item">
                            <a class="nav-link" id="pills-summary-tab" data-toggle="pill" href="#pills-summary" role="tab" aria-controls="pills-summary" aria-selected="false">Summary</a>

                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="pills-newtool-tab" data-toggle="pill" href="#pills-newtool" role="tab" aria-controls="pills-newtool" aria-selected="false">New Tool</a>
                        </li>
                    </ul>
                    <div class="tab-content" id="pills-tabContent">
                        <div class="tab-pane fade show active" id="pills-basicinfo" role="tabpanel" aria-labelledby="pills-basicinfo-tab">
                            <div>
                                <img src="https://us.123rf.com/450wm/pe3check/pe3check1710/pe3check171000054/88673746-stock-vector-no-image-available-sign-internet-web-icon-to-indicate-the-absence-of-image-until-it-will-be-download.jpg?ver=6" class="rounded float-right" alt="...">
                            </div>
                        </div>
                        <div class="tab-pane fade" id="pills-summary" role="tabpanel" aria-labelledby="pills-summary-tab">

                            <!--MODAL-->         

                            <div class="tab">
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th> Lab Id</th>
                                            <th>Title</th>
                                            <th>Description</th>
                                            <th>Data File</th>
                                            <th>Instruction File</th> 
                                            <th>Topics</th>
                                            <th> Ratings</th>
                                            <th>Update</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <%
                                            Connection dbConn = ConnectionManager.getConnection();

                                            Statement st = dbConn.createStatement();
                                            // st.execute("select userName, userPassword, userEmailId, userType from Users2 where userName=name and userPassword=pass");

                                            ResultSet rs2 = st.executeQuery(""
                                                    + "select lab_id,title, description, data_file, instruction_file,"
                                                    + "uploaded,approved,last_modified,ratings,topic "
                                                    + "from minitools_storage where userId='" + uid + "'");
                                            String labid = null;
                                            while (rs2.next()) {
                                                // t=rs.getString(1);
                                                //d=rs.getString("description");
                                                //r=rs.getString(8);
                                                //top=rs.getString(9);

                                                labid = rs2.getString("lab_id");
                                                String desc = rs2.getString(3);
                                                String title = rs2.getString(2);
                                                String algo = rs2.getString(10);
                                                String rats = rs2.getString(9);
                                        %>

                                        <tr>
                                            <td><%=labid%></td>
                                            <td class="tdTitle"><%=title%></td>
                                            <td class="tdDesc"><%=desc%></td>
                                            <td >BLOB</td> 
                                            <td>BLOB</td>
                                            <td class="algo"><%=algo%></td>
                                            <td class="rats"><%=rats%></td>
                                            <td>
                                                <!--   <button type="submit" href="" class="btn btn-primary" name="">Update</button>-->
                                                <button type="button" class="btn btn-primary updateTools" data-toggle="modal" data-target="#exampleModalCenter" data-labid="<%=labid%>">Update
                                                </button>
                                            </td>
                                        </tr>
                                        <%
                                            }
                                        %>
                                    </tbody>
                                </table>
                            </div>






                        </div>
                        <div class="tab-pane fade" id="pills-newtool" role="tabpanel" aria-labelledby="pills-newtool-tab">
                            <div>

                                <div class="container">
                                    <div class="row">
                                        <form action="/DiTuSte_Cryto/labUser" class="col" method="POST" enctype="multipart/form-data">
                                            <div class="form-group">
                                                <div class="row">
                                                    <div class="col">
                                                        <input type="hidden" name="labid">
                                                        <label for="formGroupExampleInput">Name Of the tool<span class="text-danger">*</span></label>
                                                        <input type="text" class="form-control" name="title" id="formGroupExampleInput" placeholder="Enter Title for tool" required>
                                                    </div>
                                                    <div class="col">
                                                        <label for="formGroupExampleInput">Topic <span class="text-danger">*</span></label>
                                                        <select class="custom-select mr-sm-2" id="inlineFormCustomSelect" name="topic" required>
                                                            <option selected>Choose...</option>
                                                            <option value="for Database">Database</option>
                                                            <option value="for Password Hashing">Password Hashing</option>
                                                            <option value="for Others">Others</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="formGroupExampleInput2">Description <span class="text-danger">*</span></label>
                                                <textarea class="form-control" rows="" name="description" required="" placeholder="Uses of tools In Brief" ></textarea>
                                            </div>
                                            <div class="form-group">
                                                <label for="formGroupExampleInput">Data File <span class="text-danger">*</span></label>
                                                <div class="input-group mb-3">
                                                    <div class="custom-file">
                                                        <input type="file" class="custom-file-input" id="inputGroupFile01" required="" name="inputGroupFile01">
                                                        <label class="custom-file-label fileUploadLabel1" for="inputGroupFile01" aria-describedby="inputGroupFileAddon02" >Choose file</label>
                                                    </div>

                                                </div>
                                            </div>
                                            <div>
                                                <label for="formGroupExampleInput">Instruction File<span class="text-danger">*</span></label>
                                                <div class="input-group mb-3">
                                                    <div class="custom-file">
                                                        <input type="file" class="custom-file-input" id="inputGroupFile02" name="inputGroupFile02" required="">
                                                        <label class="custom-file-label fileUploadLabel2" for="inputGroupFile02" aria-describedby="inputGroupFileAddon02">Choose file</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-row align-items-center" style="display: none;">
                                                <label for="formGroupExampleInput">Rating<span class="text-danger">*</span></label>
                                                <div class="col-auto my-1">
                                                    <label class="mr-sm-2 sr-only" for="inlineFormCustomSelect">Rating</label>
                                                    <select class="custom-select mr-sm-2" id="inlineFormCustomSelect" required name="ratings">
                                                        <option selected value="0">Choose...</option>
                                                        <option value="1">Level 1</option>
                                                        <option value="2">Level 2</option>
                                                        <option value="3">Level 3</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-row align-items-center">
                                                <div class="col-auto my-1">
                                                    <button type="submit" class="btn btn-primary" >Submit</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>  

                            </div>
                        </div>
                        



                    </div>

                </div>
            </div>
        </div>


        <div class="modal fade cust" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Update Here</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body ">

                        <div class="row justify-content-center">
                            <div class="col-md-5 col-sm-7 col-lg-4">
                                <form action="${pageContext.request.contextPath}/UpdateToolsServlet" method="POST">
                                    <input type="hidden" id="modalId"  name="modalId" value="<%=labid%>">
                                    <div>
                                        <label class="sr-only">Title</label>        
                                        Title    <input type="text" id="modalName" name="modalName" class="form-control m-1" required>
                                    </div>

                                    <div>
                                        <label class="sr-only">Descirption</label>
                                        Description  <input type="text" id="modalDesc" name="modalDesc" class="form-control m-1" required>
                                    </div>
                                    <div>
                                        <label class="sr-only">Topics</label>
                                        Topics <input type="text" id="modalTopics" name="modalTopics" class="form-control m-1" required>
                                    </div>
                                    <div>
                                        <label class="sr-only">Ratings</label>
                                        Ratings  <input type="text" id="modalRats" name="modalRats" class="form-control m-1" readonly>
                                    </div>


                            </div>
                        </div>


                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary" name ="lol" value="<%=labid%>">Save & Update</button>
                    </div>
                    </form>
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


                $(document).on('click', '.updateTools', function ()
                {
                    var labId = $(this).data('labid');//data-labid
                    console.log(labId);
                    $('#modalId').val(labId); //injecting labid 

                    var toolName = $(this).parents('tr').find('.tdTitle').text();
                    var desccription = $(this).parents('tr').find('.tdDesc').text();
                    var topics = $(this).parents('tr').find('.algo').text();
                    var ratings = $(this).parents('tr').find('.rats').text();

                    $('#modalId').val(labId);//
                    $('#modalName').val(toolName);//
                    $('#modalDesc').val(desccription);
                    $('#modalTopics').val(topics);//
                    $('#modalRats').val(ratings);
                });

                $(document).on("change", "#inputGroupFile01", function (e) {
                    $('.fileUploadLabel1').text($(this).val());
                });
                $(document).on("change", "#inputGroupFile02", function (e) {
                    $('.fileUploadLabel2').text($(this).val());
                });
            });
        </script>
    </body>

</html>