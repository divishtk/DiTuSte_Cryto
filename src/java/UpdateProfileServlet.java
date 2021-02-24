

import com.database.ConnectionManager;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UpdateProfileServlet extends HttpServlet {

  
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        
//    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        
        
        
        HttpSession se=request.getSession();
          String na;
          String emil;
          String pass;
          String role;
      //  na=se.getAttribute("name").toString();
      // emil=se.getAttribute("EmailId").toString();
      
      emil=request.getParameter("email");
      // System.out.println(emil);
        //   pass=se.getAttribute("pass").toString();
          //    role=se.getAttribute("type").toString();
       
              // System.out.println(na);
                System.out.println(emil);
            
                
                  
                  
                  String updatedname;
                  //String Updatedemail;
                  String Updatedpass;
                  String Updatedtype;
                  String Updatedage;
                     String Updatedexp;
                        String Updatedgender;  
                        String UpdatedLang;
                        String UpdatedAdd;
                        
                  
                          
                  
                  updatedname=request.getParameter("name");
                //  Updatedemail=request.getParameter("email");
                   Updatedpass=request.getParameter("pass");
                  Updatedtype=request.getParameter("role");
                   
             
                  Updatedage=request.getParameter("age");
                  Updatedexp=request.getParameter("exp");
                  Updatedgender=request.getParameter("inlineRadioOptions");
                  UpdatedLang=request.getParameter("lang");
                     UpdatedAdd=request.getParameter("address");
                     
                     
                  
                   System.out.println(updatedname);
                                      System.out.println(Updatedtype);

              
       
        try
        {
            
            
            
                Class.forName("com.mysql.cj.jdbc.Driver");
            Connection dbConn = ConnectionManager.getConnection();
            dbConn.setAutoCommit(false);
            PreparedStatement ps = dbConn.prepareStatement(
                    "update  Users2 set userName=? , userPassword=?, userType=?,userAge=?,userGender=?,userAddress=?,userExp=?,userLang=? where userEmailId=?");
            ps.setString(1, updatedname);
            ps.setString(2, Updatedpass);
            ps.setString(3, Updatedtype);
             ps.setString(4, Updatedage);
            ps.setString(5,Updatedgender);
             ps.setString(6, UpdatedAdd); 
            ps.setString(7, Updatedexp);
             ps.setString(8, UpdatedLang);
            ps.setString(9, emil);
           
            int i = ps.executeUpdate();
            
            
      
            
            
            if (i > 0) 
            {
                dbConn.commit();
                System.out.println("Successfully Updated new values");
            } else 
            {
                System.out.println("Failed to Update");
            }
          // response.sendRedirect("/DiTuSte_Crypto/index.jsp");
          response.sendRedirect("/DiTuSte_Cryto/views/UpdatedProfile.jsp");
        
           
           
            
            
            
        }
        catch(Exception e)
        {
            e.printStackTrace();
            
        }
        
        
        
        
      
    }

 

}
