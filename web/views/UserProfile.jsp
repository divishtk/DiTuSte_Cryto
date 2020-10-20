<%-- 
    Document   : UserProfile
    Created on : 5 Sep, 2020, 8:50:22 PM
    Author     : divisht
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
          <%@ include file="/WEB-INF/jspf/linkFiles.jspf" %>
         
    </head>
    <style>
        .form-signup{
                
                margin: 0 auto;
                margin-top: 10px;
               margin-left: -127px;
                 width: 460px;
                
            }
        
      .bs-example{
        margin: 20px ;
        margin-top: 50px;
        margin-left: 500px;
        
    }
    
    
    
    .cen
    {
margin-top: 40px;        
    }
    
    
    .user-row {
    margin-bottom: 14px;
}

.user-row:last-child {
    margin-bottom: 0;
}

.dropdown-user {
    margin: 13px 0;
    padding: 5px;
    height: 100%;
}

.dropdown-user:hover {
    cursor: pointer;
}

.table-user-information > tbody > tr {
    border-top: 1px solid rgb(221, 221, 221);
}

.table-user-information > tbody > tr:first-child {
    border-top: 0;
}


.table-user-information > tbody > tr > td {
    border-top: 0;
}
.toppad
{margin-top:20px;
}

    
    
    .lol
    {
        margin-left: -120px;
    }
    
    
    
    
    
    
           </style>
    <body>
    <%@ page import="java.util.*;"%>
    <%
  /*HashMap<String, String> userDetails = (HashMap) session
    .getAttribute("name");
  String firstName = "";
  String emailAddress = "";
  String password="";
  String role="";
  if (userDetails != null) {
   firstName = userDetails.get("firstName");
   emailAddress = userDetails.get("email");
   password=userDetails.get("password");
   role=userDetails.get("role");
  }
  else {

   firstName = null;
   emailAddress = null;
     password=null;
     role=null;

  }*/
  
  
  


        HttpSession se=request.getSession();
          String na;
          String emil;
          String pass;
          String role;
        na=se.getAttribute("name").toString();
       //emil=se.getAttribute("EmailId").toString();
      // System.out.println(emil);
           //pass=se.getAttribute("pass").toString();
            //  role=se.getAttribute("type").toString();
       
       

          //  request.setAttribute("keyname", na);
             //   request.setAttribute("keyemail", emil);
               //request.setAttribute("keypass", pass);
               //request.setAttribute("keyrole", role);
            //    RequestDispatcher rd=request.getRequestDispatcher("/UpdateProfileServlet");
              //  rd.forward(request, response);
                
                    
                    



 %>
  
    

          
          
 
    <!--  <div class="bs-example">  
      
    <div class="card" style="width: 400px;">
        <img src="${pageContext.request.contextPath}/resources/images/pic.png" class="card-img-top" alt="...">
        <div class="card-body text-center">
            <h5 class="card-title"><%=na%></h5>
               <h6 class="card-title">${sessionScope.EmailId}</h6>
                  <h6 class="card-title">${sessionScope.pass}</h6>
                     <h6 class="card-title">${sessionScope.type}</h6>
                     <h6 class="card-title">${sessionScope.age}</h6>
                      <h6 class="card-title">${sessionScope.gender}</h6>
                     <h6 class="card-title">${sessionScope.address}</h6>
                     <h6 class="card-title">${sessionScope.exp}</h6>
            <p class="card-text"></p>
         
        </div>
            
    </div>
            
</div>-->
        
            
            
                   <center class="cen">  <h1>User Profile</h1></center>
          
          
          
          
          
          <div class="container">
      <div class="row">
      <div class="col-md-5  toppad  pull-right col-md-offset-3 ">
           
          
          
      </div>
        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 col-lg-offset-3 toppad" >
             <div class="panel panel-info">
            <div class="panel-heading">
                <h3 class="panel-title"></h3>
            </div>
            <div class="panel-body">
              <div class="row">
                  <div class="col-md-3 col-lg-3 " align="center"> <img alt="User Pic" src="http://www.pngall.com/wp-content/uploads/5/User-Profile-Transparent.png" class="img-circle img-responsive lol" width="230px" height="190px  "> </div>
               <div class=" col-md-9 col-lg-9 "> 
                  <table class="table table-user-information">
                    <tbody>
                      <tr>
                        <td>Name:</td>
                        <td><%=na%></td>
                      </tr>
                      <tr>
                        <td>Registerd </td>
                        <td>06/23/2013</td>
                      </tr>
                      <tr>
                        <td>EmailId</td>
                        <td>${sessionScope.EmailId}</</td>
                      </tr>
                   
                         <tr>
                             <tr>
                        <td>Gender</td>
                        <td>${sessionScope.gender}</</td>
                      </tr>
                        <tr>
                        <td>Home Address</td>
                        <td>${sessionScope.address}</</td>
                      </tr>
                      <tr>
                        <td>Experience</td>
                        <td> ${sessionScope.exp}</td>
                           
                      </tr>
                       <tr>
                        <td>Age</td>
                        <td> ${sessionScope.age}</td>
                           
                      </tr>
                       <tr>
                        <td>User</td>
                        <td> ${sessionScope.type}</td>
                           
                      </tr>
                       <tr>
                        <td>Programming </td>
                        <td> ${sessionScope.lang}</td>
                           
                      </tr>
                     
                    </tbody>
                  </table>
                  
                 <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Update Profile</button>
                </div>
              </div>
            </div>
                
            
          </div>
        </div>
      </div>
    </div>
          
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            <center>

 

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
       <!--      <h4 class="modal-title">Update Profile</h4>&nbsp;-->
          <button type="button" class="close" data-dismiss="modal">&times;</button>
         
        </div>
        <div class="modal-body">
            <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6 col-sm-10 col-lg-6">
                    <form action="${pageContext.request.contextPath}/UpdateProfileServlet" method="POST">
                        <div class="form-signup border shadow rounded p-2 pl-5 pr-5">
                            <h1 class="h3 mb-5 font-weight-normal text-center">Update Profile</h1>
                            <hr>
                            <div class="form-group row">
                                <div class="col">
                                    <label for="inputName" class="col-form-label">Name:</label>
                                    <input type="text" class="form-control" id="inputName" name="name" placeholder="First | Middle | Last Name" value="<%=na%>" required></input
                                </div>
                                <div class="col">
                                    <label for="inputEmail" class="col-sm-3 col-form-label">Email:</label>
                                    <input type="email" class="form-control" id="inputEmail" name="email" placeholder="e.g. johndoe@email.com" value="${sessionScope.EmailId}" readonly>
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
                                            <label class="form-check-label" for="inlineRadio1" value="">Female</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" name="gender" value="male">
                                            <label class="form-check-label" for="inlineRadio2" value="">Male</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col">
                                    <label for="inputTA" class="col-form-label">Address:</label>
                                    <textarea id="inputTA" class="form-control" name="address" rows="3" placeholder="Address" ></textarea>
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
                                    <input type="number" class="form-control" id="inputExp" name="exp" placeholder="years in learning IT technology" value="2">
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
                               
                                
                            </div>
                                
                        </div>
                                <div class="col-9 col-sm-5">
                                    <!--<button type="submit" class="btn btn-primary">Submit</button>-->
                                    <!--<button type="submit" class="btn btn-danger"><a href="home.jsp">Submit</a></button>-->
                                    <button type="submit" class="btn btn-info btn-lg"">Update</button>

                                </div>
                    </form>
                </div>
            </div>
        </div>
        </div>
        <!--<div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Update</button>
        </div>-->
      </div>
      
    </div>
  </div>
  
            </div>
</center>    
                                
                                
                                <%
                                //For Updation of profile Page
              
                
                

                                
                                %>
    </body>
</html>
