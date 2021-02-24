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
import com.models.Project;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Nevets
 */
public class addProjectServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet addProjectServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet addProjectServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("GET addProjectServlet");
        String action = request.getParameter("action");
        Connection dbConn = null; // connection to the database
        String message = null;
        Article a = null;
        ArrayList<Project> projList = null;
        Project p = null;
        switch (action) {
            case "_proj_Id":
                if (!"".equals(request.getParameter("proj_Id"))) {
                    try {
                        String proj_Id = request.getParameter("proj_Id");

                        dbConn = ConnectionManager.getConnection();
                        PreparedStatement psmt = dbConn.prepareStatement(""
                                + "select proj_Id, spec_id, proj_name, proj_desc, "
                                + "proj_path, proj_view_type, proj_tech, proj_language, modified_date from projects "
                                + "where proj_Id = ?");
                        psmt.setString(1, proj_Id);
                        ResultSet rs = psmt.executeQuery();
                        while (rs.next()) {
                            p = new Project();
                            p.setProj_Id(String.valueOf(rs.getInt(1)));
                            p.setSpec_id(rs.getString(2));
                            p.setProj_name(rs.getString(3));
                            p.setProj_desc(rs.getString(4));
                            p.setProj_path(rs.getString(5));
                            p.setProj_view_type(rs.getString(6));
                            p.setProj_tech(rs.getString(7));
                            p.setProj_language(rs.getString(8));
                            p.setModified_date(rs.getString(9));
                        }

                        request.setAttribute("proj", p);
                        new Gson().toJson(p, response.getWriter());
                    } catch (Exception e) {
                        System.out.println(e);
                    }
                } else {
                    new Gson().toJson("Error", response.getWriter());
                }
                break;
            case "_all":
                try {
                    DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
                    Connection dbconn = ConnectionManager.getConnection();
                    PreparedStatement psmt = dbconn.prepareStatement(""
                            + "select proj_Id, spec_id, proj_name, proj_desc, "
                            + "proj_path, proj_view_type, proj_tech, proj_language, modified_date from projects");
                    ResultSet rs = psmt.executeQuery();
                    projList = new ArrayList<>();
                    while (rs.next()) {
                        p = new Project();
                        p.setProj_Id(String.valueOf(rs.getInt(1)));
                        p.setSpec_id(rs.getString(2));
                        p.setProj_name(rs.getString(3));
                        p.setProj_desc(rs.getString(4));
                        p.setProj_path(rs.getString(5));
                        p.setProj_view_type(rs.getString(6));
                        p.setProj_tech(rs.getString(7));
                        p.setProj_language(rs.getString(8));
                        p.setModified_date(rs.getString(9));
                        projList.add(p);
                    }

                    request.setAttribute("projList", projList);
                    new Gson().toJson(projList, response.getWriter());
                } catch (Exception e) {
                    System.out.println(e);
                }
                break;
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("addProjectServlet's POST Servlet");

        JsonObject json = new JsonObject();
        String title = request.getParameter("pname");
        String spec_id = request.getParameter("pid");
        String path = request.getParameter("ppath");
        String desc = request.getParameter("pdesc");
        String type = request.getParameter("ptype");
        String tech = request.getParameter("ptech");
        String lang = request.getParameter("plang");
        String sarr = request.getParameter("art_items");
        String larr = request.getParameter("lang");
        System.out.println("Received " + request.getParameter("received"));
        System.out.println(sarr);
        System.out.println(larr);

        try {
            Connection dbconn = ConnectionManager.getConnection();
            dbconn.setAutoCommit(false);
            try {

                //Get New ID for project
                String proj_id;
                PreparedStatement psmt3 = dbconn.prepareStatement("Select COALESCE(max(proj_Id)+1,101) from projects");
                ResultSet rs = psmt3.executeQuery();
                if (rs.next()) {
                    proj_id = String.valueOf(rs.getInt(1));

                    //Add new project using parameters
                    PreparedStatement psmt = dbconn.prepareStatement(""
                            + "insert into projects "
                            + "(proj_Id, spec_id, proj_name, proj_desc, proj_path, proj_view_type, proj_tech, proj_language, modified_date) "
                            + "values "
                            + "(?,?,?,?,?,?,?,?,CURDATE())");
                    psmt.setString(1, proj_id);
                    psmt.setString(2, spec_id);
                    psmt.setString(3, title);
                    if (!"".equalsIgnoreCase(desc) && desc != null) {
                        psmt.setString(4, desc.trim());
                    }
                    psmt.setString(5, path);
                    psmt.setString(6, type);
                    psmt.setString(7, tech);
                    psmt.setString(8, lang);

                    int i = psmt.executeUpdate();
                    System.out.println("inserted " + i);
                    if (i > 0) {

                        try {
                            PreparedStatement psmt12 = dbconn.prepareStatement(""
                                    + "insert into tracker "
                                    + "(t_id, proj_Id, proj_name, take_notes, article_items, task_done, task_remaining, modified_date) "
                                    + "values "
                                    + "((Select * from (Select COALESCE(max(t_id)+1,2101) from tracker) as t),?,?,?,?,?,?,CURDATE())");
                            psmt12.setString(1, proj_id);
                            psmt12.setString(2, title);
                            psmt12.setString(3, "");
                            psmt12.setString(4, sarr);
                            psmt12.setString(5, "");
                            psmt12.setString(6, sarr);
                            int j = psmt12.executeUpdate();
                            if (j > 0) {
                                dbconn.commit();
                                json.addProperty("response", "Success");
                            } else {
                                json.addProperty("response", "Failed");
                            }
                        } catch (Exception e) {
                            System.out.println(e);
                            new Gson().toJson(e, response.getWriter());
                            try {
                                dbconn.rollback();
                                System.out.println("JDBC Transaction rolled back successfully");
                            } catch (SQLException e1) {
                                System.out.println("SQLException in rollback" + e1.getMessage());
                            }
                        }

                        new Gson().toJson(json, response.getWriter());
                    } else {
                        json.addProperty("response", "Failed");
                        new Gson().toJson(json, response.getWriter());
                    }

                } else {
                    json.addProperty("response", "Failed");
                    new Gson().toJson(json, response.getWriter());
                }

            } catch (Exception e) {
                try {
                    dbconn.rollback();
                    System.out.println("JDBC Transaction rolled back successfully");
                } catch (SQLException e1) {
                    System.out.println("SQLException in rollback" + e1.getMessage());
                }
                System.out.println(e);
            } finally {
                try {
                    if (dbconn != null) {
                        dbconn.close();
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }

        } catch (Exception e) {

            System.out.println(e);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
