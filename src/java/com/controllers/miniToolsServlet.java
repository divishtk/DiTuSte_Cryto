/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controllers;

import com.database.ConnectionManager;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.models.Article;
import com.models.MiniTools;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Nevets
 */
public class miniToolsServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet miniToolsServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet miniToolsServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }
    private static final int BUFFER_SIZE = 4096;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        System.out.println("GET articleAddServlet");
        String action = req.getParameter("action");
        Connection conn = null; // connection to the database
        String message = null;
        MiniTools mt = null;
        ArrayList<MiniTools> mtList = null;
        switch (action) {
            case "_upvoteTool":
                try {
                    String lab_id = req.getParameter("lab_id");
//                    String option = req.getParameter("option");
                    // connects to the database
                    DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
                    conn = ConnectionManager.getConnection();

                    // constructs SQL statement
                    String sql = "update minitools_storage set ratings = ratings + 1 where lab_id = ? ";
                    PreparedStatement statement = conn.prepareStatement(sql);
                    statement.setString(1, lab_id);

                    // sends the statement to the database server
                    int i = statement.executeUpdate();
                    JsonObject json = new JsonObject();
                    json.addProperty("response", "Updated");
//                    resp.getWriter().print("<center><h2>Added Vote Successfully</h3></center>");
                    new Gson().toJson(json, resp.getWriter());
                } catch (SQLException ex) {
                    message = "ERROR: " + ex.getMessage();
                    ex.printStackTrace();
                } finally {
                    if (conn != null) {
                        // closes the database connection
                        try {
                            conn.close();
                        } catch (SQLException ex) {
                            ex.printStackTrace();
                        }
                    }
                }
                break;
            case "_downloadTool":
                try {
                    String lab_id = req.getParameter("lab_id");
                    //  String option = req.getParameter("option");
                    //  Connects to the database
                    DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
                    conn = ConnectionManager.getConnection();

                    // constructs SQL statement
                    String sql = "Select title, data_file from minitools_storage where lab_id = ? ";
                    PreparedStatement statement = conn.prepareStatement(sql);
                    statement.setString(1, lab_id);

                    // sends the statement to the database server
                    ResultSet rs = statement.executeQuery();
                    if (rs.next()) {
                        String fileName = rs.getString(1);
                        Blob blob = rs.getBlob(2);
                        InputStream inputStream = blob.getBinaryStream();
                        int fileLength = inputStream.available();

                        System.out.println("fileLength = " + fileLength);

                        ServletContext context = getServletContext();

                        // sets MIME type for the file download
                        String mimeType = context.getMimeType(fileName);
                        if (mimeType == null) {
                            mimeType = "application/octet-stream";
                        }

                        // set content properties and header attributes for the response
                        resp.setContentType(mimeType);
                        resp.setContentLength(fileLength);
                        String headerKey = "Content-Disposition";
                        String headerValue = String.format("attachment; filename=\"%s\"", fileName+"-main.txt");
                        resp.setHeader(headerKey, headerValue);

                        // writes the file to the client
                        OutputStream outStream = resp.getOutputStream();

                        byte[] buffer = new byte[BUFFER_SIZE];
                        int bytesRead = -1;

                        while ((bytesRead = inputStream.read(buffer)) != -1) {
                            outStream.write(buffer, 0, bytesRead);
                        }

                        inputStream.close();
                        outStream.close();
                    } else {
                        resp.getWriter().println("<center><h2>No File Found!!</h3></center>");
                    }

                } catch (SQLException ex) {
                    message = "ERROR: " + ex.getMessage();
                    ex.printStackTrace();
                } finally {
                    if (conn != null) {
                        // closes the database connection
                        try {
                            conn.close();
                        } catch (SQLException ex) {
                            ex.printStackTrace();
                        }
                    }
                }
                break;
            case "_downloadInstruct":
                try {
                    String lab_id = req.getParameter("lab_id");
//                    String option = req.getParameter("option");
                    // connects to the database
                    DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
                    conn = ConnectionManager.getConnection();

                    // constructs SQL statement
                    String sql = "Select title, instruction_file from minitools_storage where lab_id = ? ";
                    PreparedStatement statement = conn.prepareStatement(sql);
                    statement.setString(1, lab_id);

                    // sends the statement to the database server
                    ResultSet rs = statement.executeQuery();
                    if (rs.next()) {
                        String fileName = rs.getString(1);
                        Blob blob = rs.getBlob(2);
                        InputStream inputStream = blob.getBinaryStream();
                        int fileLength = inputStream.available();

                        System.out.println("fileLength = " + fileLength);

                        ServletContext context = getServletContext();

                        // sets MIME type for the file download
                        String mimeType = context.getMimeType(fileName);
                        if (mimeType == null) {
                            mimeType = "application/octet-stream";
                        }

                        // set content properties and header attributes for the response
                        resp.setContentType(mimeType);
                        resp.setContentLength(fileLength);
                        String headerKey = "Content-Disposition";
                        String headerValue = String.format("attachment; filename=\"%s\"", fileName+"-Instruct.txt");
                        resp.setHeader(headerKey, headerValue);

                        // writes the file to the client
                        OutputStream outStream = resp.getOutputStream();

                        byte[] buffer = new byte[BUFFER_SIZE];
                        int bytesRead = -1;

                        while ((bytesRead = inputStream.read(buffer)) != -1) {
                            outStream.write(buffer, 0, bytesRead);
                        }

                        inputStream.close();
                        outStream.close();
                    } else {
                        resp.getWriter().println("<center><h2>No File Found!!</h3></center>");
                    }
                } catch (SQLException ex) {
                    message = "ERROR: " + ex.getMessage();
                    ex.printStackTrace();
                } finally {
                    if (conn != null) {
                        try {
                            conn.close();
                        } catch (SQLException ex) {
                            ex.printStackTrace();
                        }
                    }
                }
                break;
            case "_labId":
                try {
                    String lab_id = req.getParameter("lab_id");
//                    String option = req.getParameter("option");
                    // connects to the database
                    DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
                    conn = ConnectionManager.getConnection();

                    // constructs SQL statement
                    String sql = "Select lab_id, title, topic, description, uploaded, lab_user, last_modified, "
                            + "data_file, ratings, instruction_file from minitools_storage where lab_id = ? ";
                    PreparedStatement statement = conn.prepareStatement(sql);
                    statement.setString(1, lab_id);

                    // sends the statement to the database server
                    ResultSet rs = statement.executeQuery();
                    while (rs.next()) {
                        mt = new MiniTools();
                        mt.setLab_id(rs.getString(1));
                        mt.setTitle(rs.getString(2));
                        mt.setTopic(rs.getString(3));
                        mt.setDesc(rs.getString(4));
                        mt.setUploaded(rs.getString(5));
                        mt.setLab_user(rs.getString(6));
                        mt.setLast_mod(rs.getString(7));
                        mt.setData_files(rs.getBlob(8));
                        mt.setRatings(rs.getString(9));
                        mt.setInstruction_file(rs.getBlob(10));

                    }
                    req.setAttribute("article", mt);
                    new Gson().toJson(mt, resp.getWriter());
                } catch (SQLException ex) {
                    message = "ERROR: " + ex.getMessage();
                    ex.printStackTrace();
                } finally {
                    if (conn != null) {
                        // closes the database connection
                        try {
                            conn.close();
                        } catch (SQLException ex) {
                            ex.printStackTrace();
                        }
                    }
                }
                break;
            case "_all":
                try {
                    mtList = new ArrayList<>();
                    // connects to the database
                    DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
                    conn = ConnectionManager.getConnection();

                    // constructs SQL statement
                    String sql = "Select lab_id, title, topic, description, uploaded, lab_user, last_modified, "
                            + "data_file, ratings, instruction_file from minitools_storage";
                    PreparedStatement statement = conn.prepareStatement(sql);

                    // sends the statement to the database server
                    ResultSet rs = statement.executeQuery();
                    while (rs.next()) {
                        mt = new MiniTools();
                        mt.setLab_id(rs.getString(1));
                        mt.setTitle(rs.getString(2));
                        mt.setTopic(rs.getString(3));
                        mt.setDesc(rs.getString(4));
                        mt.setUploaded(rs.getString(5));
                        mt.setLab_user(rs.getString(6));
                        mt.setLast_mod(rs.getString(7));
                        mt.setData_files(rs.getBlob(8));
                        mt.setRatings(rs.getString(9));
                        mt.setInstruction_file(rs.getBlob(10));
                        mtList.add(mt);
                    }
//                    req.setAttribute("artList", artList);
                    new Gson().toJson(mtList, resp.getWriter());
                } catch (SQLException ex) {
                    message = "ERROR: " + ex.getMessage();
                    ex.printStackTrace();
                } finally {
                    if (conn != null) {
                        // closes the database connection
                        try {
                            conn.close();
                        } catch (SQLException ex) {
                            ex.printStackTrace();
                        }
                    }
                }
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
