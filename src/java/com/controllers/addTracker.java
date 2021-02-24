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
import com.models.Tracker;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class addTracker extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("GET addProjectServlet");
        String action = request.getParameter("action");
        Connection dbConn = null; // connection to the database
        String message = null;
        Tracker t = null;
        ArrayList<Tracker> trackList = null;
        Project p = null;
        switch (action) {
            //get by project Id
            case "_proj_Id":
                if (!"".equals(request.getParameter("proj_Id"))) {
                    try {
                        String proj_Id = request.getParameter("proj_Id");

                        dbConn = ConnectionManager.getConnection();
                        PreparedStatement psmt = dbConn.prepareStatement(""
                                + "select "
                                + "t_id, proj_Id, proj_name, take_notes, article_items, task_done, "
                                + "task_remaining, modified_date from tracker "
                                + "where proj_Id = ?");
                        psmt.setInt(1,Integer.parseInt(proj_Id));
                        ResultSet rs = psmt.executeQuery();
                        while (rs.next()) {
                            t = new Tracker();
                            t.setT_id(rs.getString(1));
                            t.setProj_Id(rs.getString(2));
                            t.setProj_name(rs.getString(3));
                            t.setTake_notes(rs.getString(4));
                            t.setArticle_items(rs.getString(5));
                            t.setTask_done(rs.getString(6));
                            t.setTask_remaining(rs.getString(7));
                            t.setModified_date(rs.getString(8));
                        }

                        new Gson().toJson(t, response.getWriter());
                    } catch (Exception e) {
                        System.out.println(e);
                    }
                } else {
                    new Gson().toJson("Error", response.getWriter());
                }
                break;
            case "_all":
                //get all trackers
                trackList = new ArrayList<>();
                try {
                    DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
                    Connection dbconn = ConnectionManager.getConnection();
                    PreparedStatement psmt = dbconn.prepareStatement(""
                            + "select t_id, proj_Id, proj_name, take_notes, article_items, task_done, "
                            + "task_remaining, modified_date from tracker");
                    ResultSet rs = psmt.executeQuery();
                    while (rs.next()) {
                        t = new Tracker();
                        t.setT_id(rs.getString(1));
                        t.setProj_Id(rs.getString(2));
                        t.setProj_name(rs.getString(3));
                        t.setTake_notes(rs.getString(4));
                        t.setArticle_items(rs.getString(5));
                        t.setTask_done(rs.getString(6));
                        t.setTask_remaining(rs.getString(7));
                        t.setModified_date(rs.getString(8));
                        trackList.add(t);
                    }
                    new Gson().toJson(trackList, response.getWriter());
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
        String name = request.getParameter("proj_name");
        String proj_id = request.getParameter("proj_id");
        String notes = request.getParameter("take_notes");
        String items = request.getParameter("article_items");
        String tdone = request.getParameter("task_done");
        String tremain = request.getParameter("task_remaining");

        System.out.println(request.getParameter("art_items"));
        System.out.println(request.getParameter("lang"));

        try {

            Connection dbconn = ConnectionManager.getConnection();
            PreparedStatement psmt = dbconn.prepareStatement(""
                    + "insert into tracker "
                    + "(t_id, proj_Id, proj_name, take_notes, article_items, task_done, task_remaining, modified_date) "
                    + "values "
                    + "((Select * from (Select COALESCE(max(t_id)+1,2101) from tracker) as t),?,?,?,?,?,?,CURDATE())");
            psmt.setString(1, proj_id);
            psmt.setString(2, name);
            psmt.setString(3, notes);

            psmt.setString(4, items);
            psmt.setString(5, tdone);
            psmt.setString(6, tremain);
            int i = psmt.executeUpdate();
            JsonObject json = new JsonObject();
            System.out.println("inserted " + i);
            if (i > 0) {
                json.addProperty("response", "Success");
                new Gson().toJson(json, response.getWriter());
            } else {
                json.addProperty("response", "Failed");
                new Gson().toJson(json, response.getWriter());
            }
        } catch (Exception e) {
            System.out.println(e);
            new Gson().toJson(e, response.getWriter());
        }
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String task_notes = req.getParameter("task_notes");
            String proj_id = req.getParameter("proj_id");
            String task_done = req.getParameter("task_done");
            String task_remains = req.getParameter("task_remain");

            Connection dbconn = ConnectionManager.getConnection();
            PreparedStatement psmt = dbconn.prepareStatement(""
                    + "Update tracker set take_notes = ?, task_done = ?, task_remaining = ?, modified_date = curdate() "
                    + "Where proj_Id = ? ");
            psmt.setString(1, task_notes);
            psmt.setString(2, task_done);
            psmt.setString(3, task_remains);
            psmt.setString(4, proj_id);
            int i = psmt.executeUpdate();
            JsonObject json = new JsonObject();
            System.out.println("Updated " + i);
            if (i > 0) {
                json.addProperty("response", "Success");
                new Gson().toJson(json, resp.getWriter());
            } else {
                json.addProperty("response", "Failed");
                new Gson().toJson(json, resp.getWriter());
            }
        } catch (Exception e) {
            System.out.println(e);
            new Gson().toJson(e, resp.getWriter());
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
