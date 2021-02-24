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
                            <br/>
                            <br/>
                            <!--add about page here-->
                            <div class="row d-flex align-items-center">
                                <div class="col-12 text-center">
                                    <h1 class="font-weight-bold">Contact Us</h1>
                                </div>
                            </div>

                            <div class="row bodyAboutUs d-flex align-items-center justify-content-center font-style-3">
                                <div class="col-sm-12 col-md-6 col-lg-4">
                                    <p class="h4 py-2 text-center">Feel Free to Contact US </p>
                                    <p class="text-justify">
                                        We accept all doubts, complaints and suggestion. Together we can build community of cyber-threats free.
                                    </p>
                                </div>
                                <div class="col-sm-12 col-md-6 col-lg-4">
                                    <img class="image-responsive w-100" src="https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.coca-colaindia.com%2Fcontact-us&psig=AOvVaw3DzWm6hdreG2HLe6ByFCzT&ust=1603645394549000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCIDdqObazewCFQAAAAAdAAAAABAD">
                                </div>
                            </div>
                            <form id="formI" action="/pooBabySitting/sendEmail" method="GET">
                                <div class="row bodyAboutUs3 d-flex align-content-center justify-content-center">
                                    <div class="col-12">
                                        <p class="h3 text-center font-weight-bold py-3">Get in touch</p>
                                    </div>
                                    <div class="col-sm-12 col-md-4">
                                        <label class="font-weight-bold">Name:<span class="text-danger">*</span></label>
                                        <input type="text" name="name" class="form-control" placeholder="" required/>
                                    </div>
                                    <div class="col-sm-12 col-md-4">
                                        <label class="font-weight-bold">Email Address:<span class="text-danger">*</span></label>
                                        <input type="text" name="email" class="form-control" placeholder="" required/>
                                    </div>
                                    <div class="col-sm-12 col-md-8">
                                        <label class="font-weight-bold">Subject:<span class="text-danger">*</span></label>
                                        <input type="text" name="subject" class="form-control" placeholder="" required/>
                                    </div>
                                    <div class="col-sm-12 col-md-8">
                                        <label class="font-weight-bold">Message:<span class="text-danger">*</span></label>
                                        <textarea name="message" class="form-control" rows="6" required></textarea>
                                    </div>
                                    <div class="col-sm-12 col-md-8 text-right">
                                        <button id="submitEnquiry" type="submit" class="font-weight-bold btn btn-outline-info my-2 px-5 btn-sm">High Five</button>
                                    </div>
                                </div>
                            </form>
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
                        url: "/DiTuSte_Cryto/sendEmail?" + $('#formI').serialize(),
                        dataType: 'JSON'
                    }).done(function (data) {
                        console.log(data.Resp);
                        Swal.fire({
                            title: 'Status!',
                            text: data.Resp,
                            icon: 'info',
                            confirmButtonText: 'Okay'
                        });
                    }).fail(function (jqXHR, textStatus) {
                        alert("Request failed: " + textStatus);
                    });
                } else {
//                    console.log("All the fields are required");
                    Swal.fire({
                        title: 'Invalid!',
                        text: "Enter all fields",
                        icon: 'error',
                        confirmButtonText: 'Okay'
                    });
                }
            });
        });
    </script>
</body>

</html>
