<%-- 
    Document   : register
    Created on : 12 Aug, 2020, 8:04:58 PM
    Author     : Nevets
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <title>Crypto</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <%@ include file="/WEB-INF/jspf/linkFiles.jspf" %>
        <style>
            .form-signup{
                margin: 0 auto;
                margin-top: 50px;
            }
        </style>
    </head>
    <body class="">
        <div class="container">
            <div class="row justify-content-center">
                <% if(request.getAttribute("message")!=null){ %>
                    <div class="col-12 text-center mt-3">
                        <div class="alert alert-danger" role="alert">
                            <%= request.getAttribute("message")%>
                        </div>
                    </div>
                <% } %>
                <div class="col-md-6 col-sm-10 col-lg-6">
                    <form action="${pageContext.request.contextPath}/loginServlet" method="POST">
                        <div class="form-signup border shadow rounded p-2 pl-5 pr-5">
                            <h1 class="h3 mb-5 font-weight-normal text-center">Sign Up Form</h1>
                            <hr/>
                            <div class="form-group row">
                                <div class="col">
                                    <label for="inputName" class="col-form-label">Name:<span class="text-danger">*</span></label>
                                    <input type="text" class="form-control" id="inputName" name="name" placeholder="First | Middle | Last Name" value="" required>
                                </div>
                                <div class="col">
                                    <label for="inputEmail" class="col-sm-3 col-form-label">Email:<span class="text-danger">*</span></label>
                                    <input type="email" class="form-control" id="inputEmail" name="email" placeholder="e.g. dummy@gmail.com" value="" required>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col">
                                    <label for="inputName" class="col-form-label">Age:</label>
                                    <input type="number" class="form-control" id="inputName" name="age" placeholder="" value="">
                                </div>
                                <div class="col">
                                    <label for="inputGender" class="col-12 col-form-label">Gender:</label>
                                    <div class="m-1 mb-0">
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" id="inlineRadio2" name="gender" value="female">
                                            <label class="form-check-label" for="inlineRadio1">Female</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" id="inlineRadio2" name="gender" value="male">
                                            <label class="form-check-label" for="inlineRadio2">Male</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col">
                                    <label for="inputTA" class="col-form-label">Address:<span class="text-danger">*</span></label>
                                    <textarea id="inputTA" class="form-control" name="address" rows="3" required>e.g. NY, USA</textarea>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-8">
                                    <label for="inputEmail3" class="col-form-label">User Role:<span class="text-danger">*</span></label>
                                    <select class="form-control" name="role" required>
                                        <option value="">Select..</option>
                                        <option value="EndUser" selected>Programmer</option>
                                        <option value="LabUser">Contributor</option>
                                    </select>
                                </div>
                                <div class="col-4">
                                    <label for="inputExp" class="col-form-label">Experience:<span class="text-danger">*</span></label>
                                    <input type="number" class="form-control" id="inputExp" name="exp" value="2" required>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col">
                                    <label for="inputLang" class="col-form-label">Known Languages:<span class="text-danger">*</span></label>
                                    <input type="text" class="form-control" id="inputLang" name="lang" placeholder="e.g.Python, Mysql" required>
                                    <small class="text-lead"> list all programming languages (use comma as separator)</small>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col">
                                    <label for="inputPwd" class="col-form-label">Password:<span class="text-danger">*</span></label>
                                    <input type="password" class="form-control" id="inputPwd" name="pass" minlength="6" required>
                                </div>
                                <div class="col">
                                    <label for="inputCfPwd" class="col-form-label">Confirm Password:<span class="text-danger">*</span></label>
                                    <input type="password" class="form-control" id="inputCfPwd" name="pass2" minlength="6" required>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-7 col-sm-1">

                                </div>
                                <div class="col-2 col-sm-5">
                                    <button type="reset" class="btn btn-danger">Reset</button>
                                </div>
                                <div class="col-2 col-sm-5">
                                    <button type="submit" class="btn btn-danger">Submit</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
