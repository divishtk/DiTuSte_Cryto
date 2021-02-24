package com.admin;

import com.database.ConnectionManager;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class userAdminServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String uid = request.getParameter("uid");
        
        try {
            Connection conn = ConnectionManager.getConnection();
            PreparedStatement ps = conn.prepareStatement("DELETE from users2 where userId = ? ");
            ps.setInt(1, Integer.parseInt(uid));
            int i = ps.executeUpdate();
            if(i>0){
                request.setAttribute("message", "it got Deleted");
            }else{
                request.setAttribute("message", "Failed");
            }
//            response.sendRedirect("adminServlet.jsp");
            RequestDispatcher rd = request.getRequestDispatcher("views/admin/adminServlet.jsp");
            rd.forward(request, response);
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     
        String uid = request.getParameter("uid");
        String uname = request.getParameter("uname");
        String upass = request.getParameter("upass");
        String uemail = request.getParameter("uemail");
        String utype = request.getParameter("utype");
        String udate = request.getParameter("udate");
        
        
        try {
            Connection conn = ConnectionManager.getConnection();
            PreparedStatement ps = conn.prepareStatement(""
                    + "update users2 set userName = ?, userPassword = ?, userEmailId = ?,"
                    + "userType = ?, updatedBy = curdate() "
                    + "where userId = ?");
            ps.setString(1, uname);
            ps.setString(2, upass);
            ps.setString(3, uemail);
            ps.setString(4, utype);
//            ps.setString(5, udate);
            ps.setInt(5, Integer.parseInt(uid));
            int i = ps.executeUpdate();
            if(i>0){
                request.setAttribute("message", "it got Updated");
            }else{
                request.setAttribute("message", "Failed to update");
            }
//            response.sendRedirect("adminServlet.jsp");
            RequestDispatcher rd = request.getRequestDispatcher("views/admin/adminServlet.jsp");
            rd.forward(request, response);
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
