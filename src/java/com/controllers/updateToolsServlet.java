package com.controllers;

import com.database.ConnectionManager;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class updateToolsServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String title, description, topics, ratings;

        System.out.println("Update Tools");

        try {

            String labid = request.getParameter("modalId");

            title = request.getParameter("modalName");
            description = request.getParameter("modalDesc");

            topics = request.getParameter("modalTopics");
            ratings = request.getParameter("modalRats");

            System.out.println("Lab id " + labid);
            System.out.println("Title " + title);
            System.out.println("Ratings id " + ratings);
            System.out.println("Topics " + topics);

            Connection dbConn = ConnectionManager.getConnection();
            PreparedStatement ps = dbConn.prepareStatement(
                    "update minitools_storage set title=? , description=?, ratings=?,topic=? where lab_id=?");

            ps.setString(1, title);
            ps.setString(2, description);
            ps.setString(3, ratings);
            ps.setString(4, topics);
            ps.setString(5, labid);

            int i = ps.executeUpdate();

            if (i > 0) {
                System.out.println("Successfully Updated new values");
            } else {
                System.out.println("Failed to Update");
            }
            // response.sendRedirect("/DiTuSte_Crypto/index.jsp");
            response.sendRedirect("/DiTuSte_Cryto/views/UpdateMiniTools.jsp");

        } catch (Exception e) {
            e.printStackTrace();

        }

    }

}
