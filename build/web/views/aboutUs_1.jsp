<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <title>DiTuSte_Crypto</title>

        <%@ include file="/WEB-INF/jspf/linkFiles.jspf" %>
        <style type="text/css">
            *{
                margin: 0;
                padding: 0;
                font-family: sans-serif;

            }
            .team-section{
                overflow: hidden;
                text-align: center;
                background:#34495e;
                padding: 60px;
            }
            .team-section h1{
                text-transform: uppercase;
                margin-bottom: 60px;
                color: white;
                font-size: 40px;
            }
            .border{
                display: block;
                margin: auto;
                width:160px;
                height: 3px;
                background:#3498db;
                margin-bottom: 40px; 
            }
            .ps a{
                display: inline-block;
                margin:0 30px;
                width: 160px;
                height: 160px;
                overflow: hidden;
                border-radius: 50%;
            }
            .ps a img{
                width: 100%;
                filter:grayscale(100%);
                transition: 0.4s all;

            }
            .ps a:hover >img{
                filter:none;
            }
            .section{
                width: 600px;
                margin: auto;
                font-size: 20px;
                color: white;
                text-align: justify;
                height: 0;
                overflow: hidden;
            }
            .section:target{
                height: auto;
            }
            .name{
                display: block;
                margin-bottom: 30px;
                text-align: center;
                text-transform: uppercase;
                font-size: 22px;
            }
        </style>
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
                <div class="container p-5">
                    <div class="container-fluid">
                        <div class="fluid-container" style="overflow: hidden">
                            <!--add about page here-->
                            <div class="row d-flex align-items-center">
                                <div class="col-12 text-center">
                                    <h1 class="font-weight-bold">About Us</h1>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div class="team-section">
                                        <h1>Our Team</h1>
                                        <span class="border"></span>
                                        <div class="ps">
                                            <a href="#alpha"><img src="../resources/images/Divisht_Img.jpeg" alt="Divisht Kori"></a>
                                            <a href="#beta"><img src="../resources/images/Tushar_Img.jpeg" alt="Tushar Gupta"></a>
                                            <a href="#delta"><img src="../resources/images/Steven_Img.jpeg" alt="Steven "></a>
                                        </div>
                                        <div class="section" id="alpha">
                                            <span class="name">Divisht Kori</span>
                                            <span class="border"></span>
                                            <p style="color:white">
                                                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                                                tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.
                                            </p>
                                        </div>
                                        <div class="section" id="beta">
                                            <span class="name">Tushar Gupta</span>
                                            <span class="border"></span>
                                            <p style="color:white">
                                                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                                                tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.
                                            </p>
                                        </div>
                                        <div class="section" id="delta">
                                            <span class="name">Steven Ferns</span>
                                            <span class="border"></span>
                                            <p style="color:white">
                                                A Full Stack Developer, interested in building new project and innovate 
                                                new ideas for a small company or startup
                                            </p>
                                        </div>
                                    </div>

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

            $(document).on("click", "#submitEnquiry", function (e) {
                e.preventDefault();
                var name = $('#formI').find('input[name=name]').val();
                var email = $('#formI').find('input[name=email]').val();
                var subj = $('#formI').find('input[name=subject]').val();
                var msg = $('#formI').find('textarea[name=message]').val();
                if (name && email && subj && msg) {
                    $.ajax({
                        method: "GET",
                        url: "/pooBabySitting/sendEmail?" + $('#formI').serialize(),
                        dataType: 'JSON'
                    }).done(function (data) {
                        Swal.fire({
                            title: 'Status!',
                            text: data.Resp,
                            icon: 'info',
                            confirmButtonText: 'Okay'
                        });
                    }).fail(function (jqXHR, textStatus) {
                        alert("Request failed: " + textStatus.reponseText());
                    });
                } else {
                    Swal.fire({
                        title: 'Invalid!',
                        text: "All the fields are required",
                        icon: 'error',
                        confirmButtonText: 'Okay'
                    });
                }
            });
        });
    </script>
</body>

</html>
