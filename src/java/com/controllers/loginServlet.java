package com.controllers;

import com.database.ConnectionManager;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * // BRO I THINK AGAIN ERROR WILL COME MODULE W WnoA its compiling the whole
 * project again
 *
 * @author Nevets
 */
//@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet loginServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet loginServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("GET login servlet");

        HttpSession hs = null;
        String name = request.getParameter("uname");
        String pass = request.getParameter("upass");
        boolean flag = false, exist = false;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection dbConn = ConnectionManager.getConnection();
            PreparedStatement ps = dbConn.prepareStatement(
                    "select * from Users2 where userName=? and userPassword=?");
            ps.setString(1, name);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();
            String type = "";
            while (rs.next()) {
                exist = true;
                String userid = rs.getString(1);
                String name1 = rs.getString(2);
                String pass1 = rs.getString(3);
                type = rs.getString(5);
                flag = (name.equalsIgnoreCase(name1) && pass.equalsIgnoreCase(pass1) ? true : false);

                if (flag) {
                    hs = request.getSession();
                    hs.setAttribute("uName", name1);
                    hs.setAttribute("uemailId", pass1);
                    hs.setAttribute("userid", userid);
                    System.out.println("USER ID IS " + userid);
                }
            }
            response.setContentType("text/html;charset=UTF-8");

            if (exist) {
                if (flag) {
                    System.out.println("hi get");
                    if ("EndUser".equalsIgnoreCase(type)) {
                        response.sendRedirect("/DiTuSte_Cryto/views/home.jsp");
                    } else if ("LabUser".equalsIgnoreCase(type)) {
                        response.sendRedirect("/DiTuSte_Cryto/views/labDashboard.jsp");
                    } else {
                        response.getWriter().println("<h2>No Type Defined</h2>");
                    }

                } else {
                    try (PrintWriter out = response.getWriter()) {
                        out.println("<!DOCTYPE html>");
                        out.println("<html>");
                        out.println("<head>");
                        out.println("<title>Servlet loginServlet</title>");
                        out.println("</head>");
                        out.println("<body>");
                        out.println("<h1> The User/Password doesn't match. </h1>");
                        out.println("<span><a href='/DiTuSte_Cryto/index.html'> click to go back. </a></span>");
                        out.println("</body>");
                        out.println("</html>");
                    }
                }
            } else {
                try (PrintWriter out = response.getWriter()) {
                    out.println("<!DOCTYPE html>");
                    out.println("<html>");
                    out.println("<head>");
                    out.println("<title>Servlet loginServlet</title>");
                    out.println("</head>");
                    out.println("<body>");
                    out.println("<h1> The User doesn't exist. </h1>");
                    out.println("<span><a href='/DiTuSte_Cryto/'> click to go back. </a></span>");
                    out.println("</body>");
                    out.println("</html>");
                }
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("POST login servlet");

        int userId = 0;
        String name, pass, cpass, emailId, role, address, age, gender, experience, lang;
        PrintWriter out = response.getWriter();

        try {

            name = request.getParameter("name");
            pass = request.getParameter("pass");
            cpass = request.getParameter("pass2");
            emailId = request.getParameter("email");
            role = request.getParameter("role");

            address = request.getParameter("address");
            age = request.getParameter("age");
            gender = request.getParameter("gender");
            experience = request.getParameter("exp");
            lang = request.getParameter("lang");

            HashMap<String, String> userDetails = new HashMap<String, String>();
            userDetails.put("firstName", name);
            userDetails.put("email", emailId);
            userDetails.put("password", pass);
            userDetails.put("cpwd", cpass);
            userDetails.put("role", role);

            userDetails.put("address", address);
            userDetails.put("age", age);
            userDetails.put("gender", gender);
            userDetails.put("exp", experience);
            userDetails.put("lang", lang);
            System.out.println("valid "+(!"".equals(userDetails.get("firstName"))
                    && !"".equals(userDetails.get("firstName"))
                    && !"".equals(userDetails.get("emailId"))
                    && !"".equals(userDetails.get("pass"))
                    && !"".equals(userDetails.get("role"))
                    && !"".equals(userDetails.get("address"))));
            if (validate(userDetails, request)) {
                HttpSession session = request.getSession();

                session.setAttribute("name", userDetails);

                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection dbConn = ConnectionManager.getConnection();
                PreparedStatement ps = dbConn.prepareStatement(
                        "insert into Users2(userName, userPassword, userEmailId, userType, updatedBy,userAge,userGender,userAddress,userExp,userLang) values (?,?,?,?,CURDATE(),?,?,?,?,?)");
                ps.setString(1, name);
                ps.setString(2, pass);
                ps.setString(3, emailId);
                ps.setString(4, role);
                ps.setString(5, age);
                ps.setString(6, gender);
                ps.setString(7, address);
                ps.setString(8, experience);
                ps.setString(9, lang);

                int i = ps.executeUpdate();

                if (i > 0) {
                    System.out.println("Successfully Updated 1 row");
                } else {
                    System.out.println("Failed to Update");
                }
                // response.sendRedirect("/DiTuSte_Crypto/index.jsp");
                response.sendRedirect("/DiTuSte_Cryto/index.jsp");

            } else {
//                request.setAttribute("message", "Kindly fill all form details properly");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                //response.sendRedirect("/DiTuSte_Cryto/register.jsp");
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private boolean validate(HashMap<String, String> userDetails, HttpServletRequest request) {
        if (userDetails.get("password").equals(userDetails.get("cpwd"))) {
            if (!"".equals(userDetails.get("firstName"))
                    && !"".equals(userDetails.get("firstName"))
                    && !"".equals(userDetails.get("emailId"))
                    && !"".equals(userDetails.get("pass"))
                    && !"".equals(userDetails.get("role"))
                    && !"".equals(userDetails.get("address"))) {
                if (userDetails.get("lang").indexOf(",") > 0) {
                    return true;
                } else {
                    request.setAttribute("message", "Two or more languages are required");
                }
            } else {
                request.setAttribute("message", "Kindly fill all form details properly");
            }
        } else {
            request.setAttribute("message", "Make Sure the passwords are similar");
        }
        return false;
    }

}
