
<html>
    <head>
        <title>Crypto</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <%@ include file="WEB-INF/jspf/linkFiles.jspf" %>
        <style>
            .form-signin{
                width: 100%;
                margin: 0 auto;
                margin-top: 80px;
            }
            a{
                cursor: pointer;
            }
        </style>
    </head>
    <body class="text-center">
        <div class="row justify-content-center">
            <div class="col-md-5 col-sm-7 col-lg-4">
                <form action="${pageContext.request.contextPath}/loginServlet" method="GET" class="form-signin border border-primary rounded shadow p-5 mb-3">
                    <img class="mb-4" src="https://cdn4.iconfinder.com/data/icons/flat-design-security-set-one/24/shield-gray-contour-512.png" alt="" width="72" height="72">
                    <h1 class="h3 mb-3 font-weight-normal">Please sign in</h1>
                    <div>
                        <label for="inputEmail" class="sr-only">User Name</label>
                        <input type="text" id="inputEmail" name="uname" class="form-control m-1" placeholder="Enter username" required="" autofocus="" value="">
                        <label for= "inputPassword" class="sr-only">Password</label>
                        <input type="password" id="inputPassword" name="upass" class="form-control m-1" placeholder="Enter password" required="" value="" >
                    </div>
                    <button class="btn btn-lg btn-primary btn-block mt-3" type="submit">Sign in</button>
                    <div class="d-block text-right text-decoration-none cu">
                        <span><a class="text-monospace fs-2" href="register.jsp">New User?</a></span>
                        <!--<span><a class="">Forgot Password?</a></span>-->
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
