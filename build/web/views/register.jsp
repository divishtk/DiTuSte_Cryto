<%-- 
    Document   : register
    Created on : 12 Aug, 2020, 8:04:58 PM
    Author     : Nevets
--%>

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
                <div class="col-md-6 col-sm-10 col-lg-6">
                    <form action="${pageContext.request.contextPath}/loginServlet" method="POST">
                        <div class="form-signup border shadow rounded p-2 pl-5 pr-5">
                            <h1 class="h3 mb-5 font-weight-normal text-center">Sign Up Form</h1>
                            <hr>
                            <div class="form-group row">
                                <div class="col">
                                    <label for="inputName" class="col-form-label">Name:</label>
                                    <input type="text" class="form-control" id="inputName" name="name" placeholder="First | Middle | Last Name" value="Divisht" required>
                                </div>
                                <div class="col">
                                    <label for="inputEmail" class="col-sm-3 col-form-label">Email:</label>
                                    <input type="email" class="form-control" id="inputEmail" name="email" placeholder="abc@gmail.com" value="divisht@email.com" required>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col">
                                    <label for="inputName" class="col-form-label">Age:</label>
                                    <input type="number" class="form-control" id="inputName" name="age" placeholder="" value="21">
                                </div>
                                <div class="col">
                                    <label for="inputGender" class="col-12 col-form-label">Gender:</label>
                                    <div class="m-1 mb-0">
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" name="gender" value="female">
                                            <label class="form-check-label" for="inlineRadio1">Female</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" name="gender" value="male">
                                            <label class="form-check-label" for="inlineRadio2">Male</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col">
                                    <label for="inputTA" class="col-form-label">Address:</label>
                                    <textarea id="inputTA" class="form-control" name="address" rows="3">somewhere someplace idk</textarea>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-5">
                                    <label for="inputEmail3" class="col-form-label">User Role:</label>
                                    <select class="form-control" name="role" required>
                                        <option value="">Select..</option>
                                        <option value="EndUser" selected>Programmer</option>
                                        <option value="LabUser">Contributor</option>
                                    </select>
                                </div>
                                <div class="col-7">
                                    <label for="inputExp" class="col-form-label">Experience:</label>
                                    <input type="number" class="form-control" id="inputExp" name="exp"  value="2">
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col">
                                    <label for="inputLang" class="col-form-label">Known Languages:</label>
                                    <input type="text" class="form-control" id="inputLang" name="lang" placeholder="list all programming languages (use comma as separator)">
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col">
                                    <label for="inputPwd" class="col-form-label">Password:</label>
                                    <input type="password" class="form-control" id="inputPwd" name="pass"  required>
                                </div>
                                <div class="col">
                                    <label for="inputCfPwd" class="col-form-label">Confirm Password:</label>
                                    <input type="password" class="form-control" id="inputCfPwd" name="pass2" >

                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-7 col-sm-1">

                                </div>
                                <div class="col-2 col-sm-5">
                                    <button type="submit" class="btn btn-danger">Reset</button>
                                </div>
                                <div class="col-2 col-sm-5">
                                    <!--<button type="submit" class="btn btn-primary">Submit</button>-->
                                    <!--<button type="submit" class="btn btn-danger"><a href="home.jsp">Submit</a></button>-->
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
