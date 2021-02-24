package com.controllers;


/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import com.database.ConnectionManager;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.models.Tracker;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Nevets
 */
public class redirectController extends HttpServlet {

    URL url;

    public static String getRequest(URL url) throws MalformedURLException, IOException {
        System.setProperty("http.agent", "Chrome");

        HttpURLConnection con = (HttpURLConnection) url.openConnection();
        con.setRequestMethod("GET");

        con.setRequestProperty("User-Agent", "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36");
        con.setRequestProperty("Content-Type", "application/json");
        String contentType = con.getHeaderField("Content-Type");

        con.setConnectTimeout(5000);
        con.setReadTimeout(5000);

        int status = con.getResponseCode();
        System.out.println("Status:" + status);
        BufferedReader in = new BufferedReader(
                new InputStreamReader(con.getInputStream()));
        String inputLine;
        StringBuffer content = new StringBuffer();
        while ((inputLine = in.readLine()) != null) {
            content.append(inputLine);
        }
        in.close();
        con.disconnect();
//        System.out.println("Content:"+content);Steven
        return content.toString();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        System.out.println("GET redirectController " + action);
        HttpSession hs = request.getSession(false);
        int userId = Integer.parseInt((String)hs.getAttribute("userid"));
        switch (action) {
            case "newsAPI":
                try {
                    URL url = new URL("https://hn.algolia.com/api/v1/search_by_date?tags=(story,poll)");
//                    System.out.println("Req:"+getRequest(url));
                    String output = getRequest(url);
                    Gson gson = new GsonBuilder().create();
                    gson.toJson(output, response.getWriter());
                } catch (Exception e) {
                    System.out.println(e.getMessage());
                }
                break;
            case "getDashboadData":
                HashMap<String, String> hm = new HashMap<>();
                try {
                    Connection dbConn = ConnectionManager.getConnection();
                    PreparedStatement psmt = null;
                    ResultSet rs = null;
                    psmt = dbConn.prepareStatement(""
                            + "SELECT count(*) FROM article_storage "
                            + "where userId = ?");
                    psmt.setInt(1, userId);
                    rs = psmt.executeQuery();
                    if (rs.next()) {
                        hm.put("total_article", rs.getString(1));
                    }
                    
                    psmt = dbConn.prepareStatement(""
                            + "SELECT count(*) FROM minitools_storage "
                            + "where userId = ?");
                    psmt.setInt(1, userId);
                    rs = psmt.executeQuery();
                    if (rs.next()) {
                        hm.put("total_tools", rs.getString(1));
                    }
                    
                    psmt = dbConn.prepareStatement(""
                            + "SELECT SUM(ratings) FROM article_storage "
                            + "where userId = ?");
                    psmt.setInt(1, userId);
                    rs = psmt.executeQuery();
                    if (rs.next()) {
                        hm.put("votes_article", rs.getString(1));
                    }
                    
                    psmt = dbConn.prepareStatement(""
                            + "SELECT SUM(ratings) FROM minitools_storage "
                            + "where userId = ?");
                    psmt.setInt(1, userId);
                    rs = psmt.executeQuery();
                    if (rs.next()) {
                        hm.put("votes_tools", rs.getString(1));
                    }
                    
                } catch (Exception e) {
                    System.out.println(e.getMessage());
                }
                new Gson().toJson(hm, response.getWriter());
                break;
            default:
                break;
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //do nothing
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
