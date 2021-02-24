/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controllers;

import com.database.ConnectionManager;
import com.google.gson.Gson;
import com.models.Article;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Nevets
 */
@MultipartConfig(maxFileSize = 16177215)
public class articleAddServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
//        processRequest(request, response);
        System.out.println("GET articleAddServlet");
        String action = req.getParameter("action");
        Connection conn = null; // connection to the database
        String message = null, art_items = "";
        Article a = null;
        ArrayList<Article> artList = null;
        switch (action) {
            case "_projId":
                artList = new ArrayList<>();
                try {
                    String proj_Id = req.getParameter("projId");
                    conn = ConnectionManager.getConnection();

                    String sql1 = "Select t.article_items from tracker t where t.proj_Id = ?";
                    PreparedStatement statement1 = conn.prepareStatement(sql1);
                    statement1.setString(1, proj_Id);

                    // sends the statement to the database server
                    ResultSet rs1 = statement1.executeQuery();
                    if (rs1.next()) {
                        art_items = rs1.getString(1);
                        // constructs SQL statement
                        String sql = "Select lab_id, tittle, topic, rated, posted_on, lab_user, last_modified, "
                                + "data_file, ratings, docText, description from article_storage "
                                + "where lab_id IN ("+art_items+")";
                        PreparedStatement statement = conn.prepareStatement(sql);
//                        statement.setString(1, art_items);

                        // sends the statement to the database server
                        ResultSet rs = statement.executeQuery();
                        while (rs.next()) {
                            a = new Article();
                            a.setLab_id(rs.getInt(1));
                            a.setTitle(rs.getString(2));
                            a.setTopic(rs.getString(3));
                            a.setRated(rs.getString(4));
                            a.setPosted_on(rs.getString(5));
                            a.setLab_user(rs.getString(6));
                            a.setLast_mdoified(rs.getString(7));
                            a.setData_file(rs.getBlob(8));
                            a.setRating(rs.getString(9));
                            a.setDocText(rs.getString(10));
                            a.setDescription(rs.getString(11));
                            artList.add(a);
                        }
                        new Gson().toJson(artList, resp.getWriter());
                    }
                } catch (SQLException ex) {
                    message = "ERROR: " + ex.getMessage();
                    System.out.println(ex.getMessage());
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
            case "_labId":
                try {
                    String lab_id = req.getParameter("lab_id");
                    // connects to the database
                    DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
                    conn = ConnectionManager.getConnection();

                    // constructs SQL statement
                    String sql = "Select lab_id, tittle, topic, rated, posted_on, lab_user, last_modified, "
                            + "data_file, ratings, docText, description from article_storage where lab_id = ?";
                    PreparedStatement statement = conn.prepareStatement(sql);
                    statement.setString(1, lab_id);

                    // sends the statement to the database server
                    ResultSet rs = statement.executeQuery();
                    while (rs.next()) {
                        a = new Article();
                        a.setLab_id(rs.getInt(1));
                        a.setTitle(rs.getString(2));
                        a.setTopic(rs.getString(3));
                        a.setRated(rs.getString(4));
                        a.setPosted_on(rs.getString(5));
                        a.setLab_user(rs.getString(6));
                        a.setLast_mdoified(rs.getString(7));
                        a.setData_file(rs.getBlob(8));
                        a.setRating(rs.getString(9));
                        a.setDocText(rs.getString(10));
                        a.setDescription(rs.getString(11));
                    }
                    req.setAttribute("article", a);
                    new Gson().toJson(a, resp.getWriter());
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
                    // sets the message in request scope
//                    req.setAttribute("Message", message);
//
//                    // forwards to the message page
//                    // getServletContext().getRequestDispatcher("/editArticle.jsp").forward(request, response);
//                    resp.setContentType("text/html;charset=UTF-8");
//                    try (PrintWriter out = resp.getWriter()) {
//                        out.println("<!DOCTYPE html>");
//                        out.println("<html>");
//                        out.println("<head>");
//                        out.println("<title>Servlet loginServlet</title>");
//                        out.println("</head>");
//                        out.println("<body>");
//                        out.println("<h1> " + message + "</h1>");
//                        out.println("<span><a href='/DiTuSte_Cryto/'> click to go back. </a></span>");
//                        out.println("</body>");
//                        out.println("</html>");
//                    }
                }
                break;
            case "_all":
                try {
                    artList = new ArrayList<>();
                    // connects to the database
                    DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
                    conn = ConnectionManager.getConnection();

                    // constructs SQL statement
                    String sql = "Select lab_id, tittle, topic, rated, posted_on, lab_user, last_modified, "
                            + "data_file, ratings, docText, description from article_storage";
                    PreparedStatement statement = conn.prepareStatement(sql);

                    // sends the statement to the database server
                    ResultSet rs = statement.executeQuery();
                    while (rs.next()) {
                        a = new Article();
                        a.setLab_id(rs.getInt(1));
                        a.setTitle(rs.getString(2));
                        a.setTopic(rs.getString(3));
                        a.setRated(rs.getString(4));
                        a.setPosted_on(rs.getString(5));
                        a.setLab_user(rs.getString(6));
                        a.setLast_mdoified(rs.getString(7));
                        a.setData_file(rs.getBlob(8));
                        a.setRating(rs.getString(9));
                        a.setDocText(rs.getString(10));
                        a.setDescription(rs.getString(11));
                        artList.add(a);
                    }
//                    req.setAttribute("artList", artList);
                    new Gson().toJson(artList, resp.getWriter());
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
                    // sets the message in request scope
//                    req.setAttribute("Message", message);
//
//                    // forwards to the message page
//                    // GetServletContext().getRequestDispatcher("/editArticle.jsp").forward(request, response);
//                    resp.setContentType("text/html;charset=UTF-8");
//                    try (PrintWriter out = resp.getWriter()) {
//                        out.println("<!DOCTYPE html>");
//                        out.println("<html>");
//                        out.println("<head>");
//                        out.println("<title>Servlet loginServlet</title>");
//                        out.println("</head>");
//                        out.println("<body>");
//                        out.println("<h1> " + message + "</h1>");
//                        out.println("<span><a href='/DiTuSte_Cryto/'> click to go back. </a></span>");
//                        out.println("</body>");
//                        out.println("</html>");
//                    }
                }
                break;
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("articleAddServlet's POST Servlet");
        // Check that we have a file upload request
        String articleId = request.getParameter("articleId");
        String articleName = request.getParameter("articleName");
        String articletitle = request.getParameter("articletitle");
        String articledescription = request.getParameter("articledescription");
        String articleTopic = request.getParameter("articleTopic");
        String articleThreat = request.getParameter("articleThreat");
        String editArticleDoc = request.getParameter("editArticleDoc");

        HttpSession hs = request.getSession();
        String userId = (String)hs.getAttribute("userid");

        InputStream inputStream = null; // input stream of the upload file

        // obtains the upload file part in this multipart request
        Part filePart = request.getPart("articleFile");
        if (filePart != null) {
            // prints out some information for debugging
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());

            // obtains input stream of the upload file
            inputStream = filePart.getInputStream();
        }
        Connection conn = null; // connection to the database
        String message = null;
        try {
            // connects to the database
            DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
            conn = ConnectionManager.getConnection();
            System.out.println("Article Id"+ articleId);
            if (!"".equalsIgnoreCase(articleId) && articleId != null) {
                // constructs SQL statement
                String sql = ""
                        + "Update article_storage set lab_user = ?, docText = ?, tittle = ?, "
                        + "topic = ?, rated = ?, data_file = ?, last_modified = CURDATE(), description = ?, userId = ? "
                        + "where lab_id = ? ";
                PreparedStatement statement = conn.prepareStatement(sql);
                statement.setString(1, articleName);
                statement.setString(2, editArticleDoc);
                statement.setString(3, articletitle);
                statement.setString(4, articleTopic);
                statement.setString(5, articleThreat);
                statement.setString(7, articledescription);
                statement.setInt(8, Integer.parseInt(userId));
                statement.setInt(9, Integer.parseInt(articleId));

                if (inputStream != null) {
                    // fetches input stream of the upload file for the blob column
                    statement.setBlob(6, inputStream);
                }

                // sends the statement to the database server
                int row = statement.executeUpdate();
                if (row > 0) {
                    message = "File uploaded and saved into database";
                } else {
                    message = "File Failed to upload and save into database";
                }
            } else {

                String sql = "INSERT INTO article_storage (lab_id, lab_user, docText, tittle, topic, rated, data_file, posted_on, last_modified, description, userId) values "
                        + "((Select * from (Select COALESCE(max(lab_id)+1,101) from article_storage) as t), ?, ?, ?, ?, ?, ?, CURDATE(), CURDATE(), ?, ?)";
                PreparedStatement statement = conn.prepareStatement(sql);
                statement.setString(1, articleName);
                statement.setString(2, editArticleDoc);
                statement.setString(3, articletitle);
                statement.setString(4, articleTopic);
                statement.setString(5, articleThreat);
                statement.setString(7, articledescription);
                statement.setString(8, userId);

                if (inputStream != null) {
                    // fetches input stream of the upload file for the blob column
                    statement.setBlob(6, inputStream);
                }

                // sends the statement to the database server
                int row = statement.executeUpdate();
                if (row > 0) {
                    message = "File uploaded and saved into database";
                } else {
                    message = "File Failed to upload and save into database";
                }
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
            // sets the message in request scope
            request.setAttribute("Message", message);

            // forwards to the message page
//            getServletContext().getRequestDispatcher("/editArticle.jsp").forward(request, response);
            response.setContentType("text/html;charset=UTF-8");
            try (PrintWriter out = response.getWriter()) {
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet loginServlet</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("<h1> " + message + "</h1>");
                out.println("<span><a href='/DiTuSte_Cryto/views/articlePage_2.jsp'> click to go back. </a></span>");
                out.println("</body>");
                out.println("</html>");
            }
        }
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String lab_id = req.getParameter("lab_id");
        Connection conn = null; // connection to the database
        String message = null;
        try {
            // connects to the database
            DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
            conn = ConnectionManager.getConnection();

            // constructs SQL statement
            String sql = "DELETE * from article_storage where lab_id = ?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, lab_id);

            // sends the statement to the database server
            int row = statement.executeUpdate();
            if (row > 0) {
                message = "Article delete from account";
            } else {
                message = "Failed to delete article from account";
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
            // sets the message in request scope
            req.setAttribute("Message", message);

            // forwards to the message page
//            getServletContext().getRequestDispatcher("/editArticle.jsp").forward(request, response);
            resp.setContentType("text/html;charset=UTF-8");
            try (PrintWriter out = resp.getWriter()) {
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet loginServlet</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("<h1> " + message + "</h1>");
                out.println("<span><a href='/DiTuSte_Cryto/'> click to go back. </a></span>");
                out.println("</body>");
                out.println("</html>");
            }
        }
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Check that we have a file upload request
        String articleName = req.getParameter("articleName");
        String lab_id = req.getParameter("lab_id");
        String articletitle = req.getParameter("articletitle");
        String articledescription = req.getParameter("articledescription");
        String articleTopic = req.getParameter("articleTopic");
        String articleThreat = req.getParameter("articleThreat");
        String editArticleDoc = req.getParameter("editArticleDoc");

        HttpSession hs = req.getSession();
        String userId = "12";//(String)hs.getAttribute("userId");//lab user id

        InputStream inputStream = null; // input stream of the upload file

        // obtains the upload file part in this multipart request
        Part filePart = req.getPart("articleFile");
        if (filePart != null) {
            // prints out some information for debugging
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());

            // obtains input stream of the upload file
            inputStream = filePart.getInputStream();
        }
        Connection conn = null; // connection to the database
        String message = null;
        try {
            // connects to the database
            DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
            conn = ConnectionManager.getConnection();

            // constructs SQL statement
            String sql = "Update article_storage set  docText = ?, tittle = ?, topic = ?, rated = ?,"
                    + " data_file = ?, last_modified = CURDATE(), description = ? where lab_id = ?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, editArticleDoc);
            statement.setString(2, articletitle);
            statement.setString(3, articleTopic);
            statement.setString(4, articleThreat);
            statement.setString(5, articledescription);
            statement.setString(7, lab_id);

            if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
                statement.setBlob(6, inputStream);
            }

            // sends the statement to the database server
            int row = statement.executeUpdate();
            if (row > 0) {
                message = "File uploaded and saved into database";
            } else {
                message = "File Failed to upload and save into database";
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
            // sets the message in request scope
            req.setAttribute("Message", message);

            // forwards to the message page
//            getServletContext().getRequestDispatcher("/editArticle.jsp").forward(request, response);
            resp.setContentType("text/html;charset=UTF-8");
            try (PrintWriter out = resp.getWriter()) {
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet loginServlet</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("<h1> " + message + "</h1>");
                out.println("<span><a href='/DiTuSte_Cryto/'> click to go back. </a></span>");
                out.println("</body>");
                out.println("</html>");
            }
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
}
