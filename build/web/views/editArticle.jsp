<%-- 
    Document   : home2
    Created on : 12 Aug, 2020, 9:20:05 PM
    Author     : Nevets
--%>

<%@page import="com.database.ConnectionManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <title>DiTuSte_Crypto</title>

        <%@ include file="/WEB-INF/jspf/linkFiles.jspf" %>
    </head>
    <body>

        <%

            String articleName, articledescription, articletitle, articleTopic, articleThreat, editArticleDoc, message = "";
            String id = (String) request.getParameter("lab_Id");
            System.out.println("ID:: " + id);
            if (!"".equals(id) && id != null) {
                Connection conn = null; // connection to the database
                try {
                    DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
                    conn = ConnectionManager.getConnection();

                    // constructs SQL statement
                    String sql = "select lab_id, lab_user, docText, tittle, topic, rated, data_file, posted_on, last_modified, description from article_storage "
                            + "where lab_id = ?";

                    PreparedStatement statement = conn.prepareStatement(sql);
                    statement.setString(1, id);
                    ResultSet rs = statement.executeQuery();
                    while (rs.next()) {
                        articleName = rs.getString(2);
                        articletitle = rs.getString(4);
                        articledescription = rs.getString(10);
                        articleTopic = rs.getString(5);
                        articleThreat = rs.getString(6);
                        editArticleDoc = rs.getString(3);

                        request.setAttribute("articleName", articleName);
                        request.setAttribute("articletitle", articletitle);
                        request.setAttribute("articledescription", articledescription);
                        request.setAttribute("articleTopic", articleTopic);
                        request.setAttribute("editArticleDoc", editArticleDoc);

                        message = "<div> <p class='h3 text-center text-info border-info'> found Article of " + articleName + "</p> </div>";
                    }
                } catch (Exception e) {
                    System.out.println(e.getMessage());
                }
            } else {
                message = "<div> <p class='h3 text-center text-info border-info'> No Id found </p> </div>";
            }
            request.setAttribute("message", message);
        %>

        <div class="wrapper">
            <!-- Sidebar  -->
            <!-- Sidebar  -->

            <%@include file="constant/sidebar2.jsp" %>

            <div id="content">
                <!-- Page Content  -->
                <%@include file="constant/headerNav2.jsp" %>
                <h2 class="text-center">Build your article and Post It</h2>
                <hr/>
                <div class="container row">
                    <div class="col-12">
                        <%= (String) request.getAttribute("message")%>
                    </div>
                    <div class="col-12">
                        <form action="/DiTuSte_Cryto/articleAddServlet" method="POST" enctype = "multipart/form-data">
                            <input type="hidden" name="articleId" value="<%= (id != null ? id : "")%>">
                            <div class="form-row">
                                <div class="form-group col-6">
                                    <label for="articleName">Created By</label>
                                    <input type="text" readonly class="form-control" id="articleName" name="articleName" value="${requestScope.articleName}"  required>
                                </div>
                                <div class="form-group col-6">
                                    <label for="articletitle">Title</label>
                                    <input type="text" class="form-control" id="articletitle" name="articletitle"  aria-describedby="articleTitle" placeholder="Enter Title" value="${requestScope.articletitle}"  required>
                                    <small id="articleTitle" class="form-text text-muted">Give the article a main Title to describe it.</small>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-12">
                                    <label for="articledescription">Description</label>
                                    <textarea type="text" class="form-control w-100" id="articledescription" name="articledescription" 
                                              aria-describedby="articledescription"
                                              rows="3" maxlength="500"  required>
                                        ${requestScope.articledescription}
                                    </textarea>
                                    <small id="articleTitle" class="form-text text-muted">Write a short summary about the article.</small>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="articleTopic">Topic</label>
                                    <select class="form-control" id="articleTopic" name="articleTopic"  required>
                                        <option selected>${requestScope.articleTopic}</option>
                                        <option>DDos Attack</option>
                                        <option>Malware/Ransomware</option>
                                        <option>Computer Viruses and Worms</option>
                                        <option>Phishing Attacks</option>
                                        <option>Trojan Horse</option>
                                    </select>
                                </div>

                                <div class="form-group form-check col-md-6">
                                    <label for="articleThreat">Security Threat Level</label>
                                    <input type="range" class="form-control-range mt-3" id="articleThreat" name="articleThreat" min="1" max="3" value="${requestScope.articleThreat}"  required>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="text-right">
                                    <button class="btn btn-primary m-2" type="button" data-toggle="collapse" data-target="#viewInstruct" aria-expanded="false" aria-controls="collapseExample">
                                        <i class="fa fa-question-circle"></i> Hints
                                    </button>
                                </div>
                                <div class="collapse" id="viewInstruct">
                                    <div class="card card-body">
                                        <h2>Instructions to creating article/document.</h2><br/>
                                        <br/>
                                        For Headings<br/>
                                        Enter '#' for: <h1>Heading1</h1><br/>
                                        Enter '##' for: -> <h1>Heading2</h1><br/>
                                        Enter '####' for: -> <h1>Heading4</h1><br/>
                                        <br/>
                                        Enter '-' for: -> <ul><li>bullet points</li></ul><br/>
                                        Enter '---
                                        code...
                                        ---' for:
                                        -> code section<br/>
                                        <br/>
                                        Note: For the above mention, the symbols should start on a new line + (space) + the text to add whereas for paragraphs, write directly on a new line
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="">Article</label>
                                <ul class="nav nav-tabs" id="myTab" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active" id="edit-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Edit File</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="preview-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Preview</a>
                                    </li>
                                </ul>
                                <div class="tab-content" id="myTabContent">
                                    <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="edit-tab">
                                        <textarea  id="editArticleDoc" name="editArticleDoc" rows="40" class="form-control" maxlength="1950" required>
                                            ${requestScope.editArticleDoc}
                                        </textarea>
                                    </div>
                                    <div class="tab-pane fade p-4 mx-1 bg-white border rounded" id="profile" role="tabpanel" aria-labelledby="preview-tab"  style="min-height: 700px">
                                        <!--                                        <div class="row">
                                                                                    <div class="col-12">
                                                                                        <p class="h2 text-center">--Title--</p>
                                                                                    </div>
                                                                                </div>-->
                                        <div class="row justify-content-center">
                                            <div class="col-9 articleViewContents shadow rounded m-2 bg-white" style="min-height: 100;">

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <input type="file" id="articleFile" name="articleFile" class="form-control" required>
                            <div class="form-group">
                                <div class="row text-right">
                                    <div class="col">
                                        <button type="button" class="fileDownload" class="btn btn-primary" title="download for uploading">Download</button>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row text-right">
                                    <div class="col">
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                    </div>
                                </div>
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

            var heading1 = new RegExp('^([#][\\s].+)');
            var heading2 = new RegExp('^([#][#][\\s].+)');
            var heading4 = new RegExp('^([#][#][#][#][\\s].+)');
            var code = new RegExp('^([-][-][-])');
            var list = new RegExp('^([-][\\s].+)');
            var html = '';

            function download(filename, text) {
                var element = document.createElement('a');
                element.setAttribute('href', 'data:text/plain;charset=utf-8,' + encodeURIComponent(text));
                element.setAttribute('download', filename);

                element.style.display = 'none';
                document.body.appendChild(element);

                element.click();

                document.body.removeChild(element);
            }
            $(document).on('change', '#editArticleDoc', function () {
                var lines = $(this).val().split('\n');
                $('.articleViewContents').empty();
                var listCount = 0, codeCount = 0;
                var html = "";
                var code1 = false;
                $.each(lines, function (index, line) {

//                    line = line.trim();
                    if (listCount > 0 && !list.test(line)) {
                        html += '</ul>';
                        listCount = 0;
                    }
                    if (lines == "") {
                        html += "<br/>";
                        return true;
                    }
                    if (heading1.test(line)) {
                        html += '<p class="h1 color-lightslategray text-center custom-article-heading">';
                        html += line.slice(1);
                        html += '</p>';
                    } else if (heading2.test(line)) {
                        html += '<p class="h2 color-lightslategray custom-article-heading">';
                        html += line.slice(2);
                        html += '</p>';
                    } else if (heading4.test(line)) {
                        html += '<p class="h4 color-lightslategray custom-article-heading">';
                        html += line.slice(4);
                        html += '</p>';
                    } else if (list.test(line)) {
                        if (listCount == 0) {
                            html += '<ul>';
                        }
                        html += '<li>';
                        html += line.slice(1);
                        html += '</li>';
                        listCount++;
                    } else if (code.test(line) || code1 == true) {

                        if (code.test(line)) {
                            if (code1 == false) {
                                code1 = true;
                            } else {
                                code1 = false;
                            }
                        }
                        if (codeCount == 0) {
                            html += '<p class="custom-article-code dont-indent">';
                        } else {
                            if (code1) {
                                var i = 0, length = line.length;
                                for (i; i < length; i++) {
                                    if (line[i] == " ") {
                                        line[i] = "&nbsp;";
                                    } else {
                                        break;
                                    }
                                }
                                html += line + '<br/>';
                            }
                        }

                        codeCount++;
                        if (!code1) {
                            html += '</p>';
                        }
                    } else {
                        html += '<p class="color-lightslategray">';
                        html += line;
                        html += '</p>';
                    }
                });
                $('.articleViewContents').html(html);
            });

//            $(document).on('submit', 'form', function () {
////                $('#articleFile').prop("files", 'data:text/plain;charset=utf-8,' + encodeURIComponent($('.articleViewContents').html()));
//                    
//
//            });
            $(document).on('click', '.fileDownload', function () {
                download('myArticle' + '<%=(String) session.getAttribute("uName")%>', $('.articleViewContents').html());
            });
        });
    </script>
</body>

</html>