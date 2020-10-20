

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <title>Home</title>

        <%@ include file="/WEB-INF/jspf/linkFiles.jspf" %>
    </head>
    <body>
        <div class="wrapper">
            <!-- Sidebar  -->
            <nav id="sidebar">
                <div class="sidebar-header">
                    <h3 class="mx-3">DiTuSte <br/>&nbsp;&nbsp;&nbsp; Crypto</h3>
                </div>

                <ul class="list-unstyled components">
                    <li class="active">
                        <a href="#">Dashboard</a>
                    </li>
                    <li class="">
                        <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Security</a>
                        <ul class="collapse list-unstyled" id="homeSubmenu">
                            <li>
                                <a href="#">Security Tools</a>
                            </li>
                            <li>
                                <a href="#">Security Guidance</a>
                            </li>
                        </ul>
                    </li>
                    <li>

                        <a href="UserProfile.jsp">My Profile</a>
                    

                    </li>
                    <li>
                        <a href="#">About Us</a>
                    </li>
                    <li>
                        <a href="#">Contact</a>
                    </li>
                </ul>
            </nav>

            <!-- Page Content  -->
            <div id="content">

                <nav class="navbar navbar-expand-lg navbar-light bg-light">
                    <div class="container-fluid">

                        <button type="button" id="sidebarCollapse" class="btn btn-info">
                            <i class="fas fa-align-left"></i>
                            <span>Menu</span>
                        </button>
                        <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <i class="fas fa-align-center"></i>
                        </button>

                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="nav navbar-nav ml-auto">
                                <li class="nav-item active">
                                    <a class="nav-link" href="#">My Profile <i class="fas fa-male"></i></a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">Notification <i class="fas fa-bell"></i></a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="/DiTuSte_Cryto/logoutSerlvet">Logout <i class="fas fa-sign-out-alt"></i></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>

                <%
                    String name = "";
                    try {
                        name = (String) session.getAttribute("uName");
                    } catch (Exception e) {
                        e.printStackTrace();

                    }
                %>
                <center> <h1>Welcome,<br/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <%= name%></h1></center>
                <!--     <h2><center>Web Security</center></h2>-->
                </br>



                <div class="container">
                    <h2><center>Write your Content Here..</center></h2>






                    <ul class="nav nav-tabs" id="myTab" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" id="home-tab" data-toggle="tab" href="#minitools" role="tab" aria-controls="home"
                               aria-selected="true">Mini Tools</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="profile-tab" data-toggle="tab" href="#article" role="tab" aria-controls="profile"
                               aria-selected="false">Article</a>
                        </li>
                    </ul>
                    <div class="tab-content" id="myTabContent">
                        <div class="tab-pane fade show active" id="minitools" role="tabpanel" aria-labelledby="home-tab">
                            
                                    <div class="tab">
            <table class="table table-bordered">
    <thead>
        <tr>
            <th>Id</th>
            <th>Title</th>
            <th>Description</th>
            <th>Data File</th>
            <th>Lab User</th>
            <th>Approved</th>
            <th>Last Modified</th>
            <th>Ratings</th>
            <th>Topics</th>
            
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>1</td>
            <td>Tools</td>
            <td>None</td>
            <td>None</td>
                 <td>None</td>
                      <td>None</td>
                           <td>None</td>
                                <td>None</td>
                                     <td>None</td>
            
            
        </tr>
        <tr>
               <td>1</td>
            <td>Tools</td>
            <td>None</td>
            <td>None</td>
                 <td>None</td>
                      <td>None</td>
                           <td>None</td>
                                <td>None</td>
                                     <td>None</td>
        </tr>
        <tr>
                 <td>1</td>
            <td>Tools</td>
            <td>None</td>
            <td>None</td>
                 <td>None</td>
                      <td>None</td>
                           <td>None</td>
                                <td>None</td>
                                     <td>None</td>
        </tr>     
        <tr>
                 <td>1</td>
            <td>Tools</td>
            <td>None</td>
            <td>None</td>
                 <td>None</td>
                      <td>None</td>
                           <td>None</td>
                                <td>None</td>
                                     <td>None</td>
        </tr>            
        <tr>
                 <td>1</td>
            <td>Tools</td>
            <td>None</td>
            <td>None</td>
                 <td>None</td>
                      <td>None</td>
                           <td>None</td>
                                <td>None</td>
                                     <td>None</td>
        </tr>            
        <tr>
                 <td>1</td>
            <td>Tools</td>
            <td>None</td>
            <td>None</td>
                 <td>None</td>
                      <td>None</td>
                           <td>None</td>
                                <td>None</td>
                                     <td>None</td>
        </tr>            
        <tr>
                 <td>1</td>
            <td>Tools</td>
            <td>None</td>
            <td>None</td>
                 <td>None</td>
                      <td>None</td>
                           <td>None</td>
                                <td>None</td>
                                     <td>None</td>
        </tr>            
        <tr>
                 <td>1</td>
            <td>Tools</td>
            <td>None</td>
            <td>None</td>
                 <td>None</td>
                      <td>None</td>
                           <td>None</td>
                                <td>None</td>
                                     <td>None</td>
        </tr>            
        <tr>
                 <td>1</td>
            <td>Tools</td>
            <td>None</td>
            <td>None</td>
                 <td>None</td>
                      <td>None</td>
                           <td>None</td>
                                <td>None</td>
                                     <td>None</td>
        </tr>            
        
    </tbody>
</table>
        </div>
                            
                            </div>
                        <div class="tab-pane fade" id="article" role="tabpanel" aria-labelledby="profile-tab">
                            
                                        <div class="tab">
            <table class="table table-bordered">
    <thead>
        <tr>
            <th>Id</th>
            <th>Title</th>
            <th>Topic</th>
            <th>Rated</th>
            <th>Posted On</th>
            <th>Lab User</th>
            <th>last Modified</th>
            <th>Data File</th>
            <th>Ratings</th>
            
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>1</td>
            <td>Tools</td>
            <td>None</td>
            <td>None</td>
                 <td>None</td>
                      <td>None</td>
                           <td>None</td>
                                <td>None</td>
                                     <td>None</td>
            
            
        </tr>
        <tr>
               <td>1</td>
            <td>Tools</td>
            <td>None</td>
            <td>None</td>
                 <td>None</td>
                      <td>None</td>
                           <td>None</td>
                                <td>None</td>
                                     <td>None</td>
        </tr>
        <tr>
                 <td>1</td>
            <td>Tools</td>
            <td>None</td>
            <td>None</td>
                 <td>None</td>
                      <td>None</td>
                           <td>None</td>
                                <td>None</td>
                                     <td>None</td>
        </tr>     
        <tr>
                 <td>1</td>
            <td>Tools</td>
            <td>None</td>
            <td>None</td>
                 <td>None</td>
                      <td>None</td>
                           <td>None</td>
                                <td>None</td>
                                     <td>None</td>
        </tr>            
        <tr>
                 <td>1</td>
            <td>Tools</td>
            <td>None</td>
            <td>None</td>
                 <td>None</td>
                      <td>None</td>
                           <td>None</td>
                                <td>None</td>
                                     <td>None</td>
        </tr>            
        <tr>
                 <td>1</td>
            <td>Tools</td>
            <td>None</td>
            <td>None</td>
                 <td>None</td>
                      <td>None</td>
                           <td>None</td>
                                <td>None</td>
                                     <td>None</td>
        </tr>            
        <tr>
                 <td>1</td>
            <td>Tools</td>
            <td>None</td>
            <td>None</td>
                 <td>None</td>
                      <td>None</td>
                           <td>None</td>
                                <td>None</td>
                                     <td>None</td>
        </tr>            
        <tr>
                 <td>1</td>
            <td>Tools</td>
            <td>None</td>
            <td>None</td>
                 <td>None</td>
                      <td>None</td>
                           <td>None</td>
                                <td>None</td>
                                     <td>None</td>
        </tr>            
        <tr>
                 <td>1</td>
            <td>Tools</td>
            <td>None</td>
            <td>None</td>
                 <td>None</td>
                      <td>None</td>
                           <td>None</td>
                                <td>None</td>
                                     <td>None</td>
        </tr>            
        
    </tbody>
</table>
        </div>



                </div>

            </div>




        </div>

                <div class="container-fluid">
                    <div class="row">
                        <div class="col"></div>
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
            });
        </script>
    </body>

</html>











# Security
# Sub Class

- one 
- two
- three

okay it is a paragraph

<div class="row">
    <div class="col-12">
        <p class="h2 text-center">Denial Of Service</p>
    </div>
</div>
<div class="row">
    <div class="col-9">
        <hr/>




    </div>


</body>

</html>

</div>
</div>




<!--
                    <div class="col-9 art_doc">
                        <hr/>
                        <p class="h4 color-lightslategray">What is a denial-of-service attack?</p>
                        <p>
                            A denial-of-service (DoS) attack is a type of cyber attack in which a malicious 
                            actor aims to render a computer or other device unavailable to its intended users 
                            by interrupting the device's normal functioning. DoS attacks typically function by 
                            overwhelming or flooding a targeted machine with requests until normal traffic is unable 
                            to be processed, resulting in denial-of-service to addition users. A DoS attack is 
                            characterized by using a single computer to launch the attack.

                            A distributed denial-of-service (DDoS) attack is a type of DoS attack that comes from 
                            many distributed sources, such as a botnet DDoS attack.
                        </p>

                        <p class="h4 color-lightslategray">Examples of attacks include:</p>
                        <p class="">
                        <ul>
                            <li>Requesting a large image size for vector graphics. For instance, SVG and font files.</li>
                            <li>Integer overflow errors can cause sanity checking of sizes to fail.</li>
                            <li>An object graph constructed by parsing a text or binary stream may have memory requirements many times that of the original data.</li>
                            <li>"Zip bombs" whereby a short file is very highly compressed. For instance, ZIPs, GIFs and gzip encoded HTTP contents. When decompressing files, it is better to set limits on the decompressed data size rather than relying upon compressed size or meta-data.</li>
                            <li>"Billion laughs attack" whereby XML entity expansion causes an XML document to grow dramatically during parsing. Set the XMLConstants.FEATURE_SECURE_PROCESSING feature to enforce reasonable limits.</li>
                            <li>Regular expressions may exhibit catastrophic backtracking.</li>
                            <li>Causing many keys to be inserted into a hash table with the same hash code, turning an algorithm of around O(n) into O(n2).</li>
                            <li>Java deserialization and Java Beans XML deserialization of malicious data may result in unbounded memory or CPU usage.</li>
                            <li>XPath expressions may consume arbitrary amounts of processor time.</li>
                            <li>Detailed logging of unusual behavior may result in excessive output to log files.</li>
                            <li>Infinite loops can be caused by parsing some corner case data. Ensure that each iteration of a loop makes some progress.</li>
                        </ul>

                        </p>
                        <p class="h4 color-lightslategray"> Release resources in all cases</p>
                        <p class="">
                            Some objects, such as open files, locks and manually allocated memory, behave as resources which require every acquire operation to be paired with a definite release. It is easy to overlook the vast possibilities for executions paths when exceptions are thrown. Resources should always be released promptly no matter what.

                            Even experienced programmers often handle resources incorrectly. In order to reduce errors, duplication should be minimized and resource handling concerns should be separated. The Execute Around Method pattern provides an excellent way of extracting the paired acquire and release operations. 
                        </p>
                        <p >The pattern can be used concisely using the Java SE 8 lambda feature.</p>
                        <blockquote>
                            <p class="mb-0">
                            <pre>
                                <code>
long sum = readFileBuffered(InputStream in -> {
    long current = 0;
    for (;;) {
        int b = in.read();
        if (b == -1) {
            return current;
        }
        current += b;
    }
});
                                </code>
                            </pre>
                            </p>
                        </blockquote>
                        <p >The try-with-resource syntax introduced in Java SE 7 automatically handles the release of many resource types.</p>
                        <blockquote>
                            <p class="mb-0">
                            <pre>
                                <code>
public R readFileBuffered(
    InputStreamHandler handler
    ) throws IOException {
        try (final InputStream in = Files.newInputStream(path)) {
            handler.handle(new BufferedInputStream(in));
        }
    }
                                </code>
                            </pre>
                            </p>
                        </blockquote>
                        <p >Ensure that any output buffers are flushed in the case that output was otherwise successful. If the flush fails, the code should exit via an exception.</p>
                        <blockquote>
                            <p class="mb-0">
                            <pre>
                                <code>
public void writeFile(
    OutputStreamHandler handler
        ) throws IOException {
            try (final OutputStream rawOut = Files.newOutputStream(path)) {
                final BufferedOutputStream out =
                    new BufferedOutputStream(rawOut);
                handler.handle(out);
                out.flush();
            }
        }
                                </code>
                            </pre>
                            </p>
                        </blockquote>
                        <p class="h4 color-lightslategray">DoS User Input as a Loop Counter</p>
                        <p>
                            Similar to the previous problem of User Specified Object Allocation, if the user can directly or indirectly assign a value that will be used as a counter in a loop function, this can cause performance problems on the server.

                            <br/>The following is an example of vulnerable code in Java:
                        </p>
                        <blockquote>
                            <pre>
                                <code>
public class MyServlet extends ActionServlet {    
        public void doPost(HttpServletRequest request, HttpServletResponse response)           
            throws ServletException, IOException {           . . .            
            String [] values = request.getParameterValues("CheckboxField");       
            // Process the data without length check for reasonable range – wrong!           
            for ( int i=0; i < values.length; i++) {                 
                // lots of logic to process the request          
            }     
    }     
}
                                </code>
                            </pre>
                        </blockquote>
                        <p>
                            As we can see in this simple example, the user has control over the loop counter. If the code inside the loop is very demanding in terms of resources, and an attacker forces it to be executed a very high number of times, this might decrease the performance of the server in handling other requests, causing a DoS condition.
                        </p>
                        <p class="h4 color-lightslategray">DoS Storing too Much Data in Session</p>
                        <p>
                            Care must be taken not to store too much data in a user session object. Storing too much information in the session, such as large quantities of data retrieved from the database, can cause denial of service issues. This problem is exacerbated if session data is also tracked prior to a login, as a user can launch the attack without the need of an account.
                        </p>
                        <p class="h4 color-lightslategray">DoS Locking Customer Accounts</p>
                        <p>
                            The first DoS case to consider involves the authentication system of the target application. A common defense to prevent brute-force discovery of user passwords is to lock an account from use after between three to five failed attempts to login. This means that even if a legitimate user were to provide their valid password, they would be unable to login to the system until their account has been unlocked. This defense mechanism can be turned into a DoS attack against an application if there is a way to predict valid login accounts.
                            <br/>
                            Note, there is a business vs. security balance that must be reached based on the specific circumstances surrounding a given application. There are pros and cons to locking accounts, to customers being able to choose their own account names, to using systems such as CAPTCHA, and the like. Each enterprise will need to balance these risks and benefits, but not all of the details of those decisions are covered here.
                        </p>
                        <p class="h4 color-lightslategray">Use Externial Service Provider</p>
                        <p>
                            Cloudflare's distributed, redundant network helps absorb the flood of traffic associated with DDoS attacks. In addition to this built-in DDoS protection, Cloudflare provides additional protections you can enable, such as “I'm under attack” mode. This is a security level you enable when your site is under active attack. When enabled, this mode adds additional protections to stop potentially malicious HTTP traffic from reaching your site. Legitimate visitors see the following page for about five seconds while Cloudflare runs checks on the browser.
                        </p>
                    </div>-->

