<%-- 
    Document   : UpdatedProfile
    Created on : 14 Oct, 2020, 9:44:49 PM
    Author     : divisht
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <%@ include file="/WEB-INF/jspf/linkFiles.jspf" %>
         <link href="https://fonts.googleapis.com/icon?family=Material+Icons"  rel="stylesheet">
         
         
         <style>
            .form-signin{
                width: 100%;
                margin: 0 auto;
                margin-top: 80px;
            }
            a{
                cursor: pointer;
            }
            #cust
            {
                font-size: 48px;
            }
        </style>
    </head>
    <body class="text-center">
        <div class="row justify-content-center">
            <div class="col-md-5 col-sm-7 col-lg-4">
                <form action="#" method="" class="form-signin border border-primary rounded shadow p-5 mb-3">
                    
                    <i class="material-icons"  id="cust">
                    check_circle
                    </i>
                    <h1 class="h3 mb-3 font-weight-normal">Mini Tools Updated</h1>
                  
                   
                </form>
                 <button class="btn btn-lg btn-primary btn-block" onclick="window.location.href='labUser.jsp'"type="submit">Go Back</button>
            </div>
        </div>
    </body>
</html>
