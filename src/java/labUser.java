


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
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Tushar
 */

@WebServlet("labUser")
@MultipartConfig(maxFileSize = 16177215) 
public class labUser extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
        {
 
        // get upload id from URL's parameters
       // int uploadId = Integer.parseInt(request.getParameter("id"));
         
        Connection conn = null; // connection to the database
         
        try {
            // connects to the database
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/DeTuSte?useSSL=false&allowPublicKeyRetrieval=true", "root", "ilovemaster");
            
            // queries the database
            String sql = "SELECT * FROM minitools_storage";
            PreparedStatement statement = conn.prepareStatement(sql);
           // statement.setInt(1, uploadId);
 
            ResultSet result = statement.executeQuery();
            if (result.next()) {
                // gets file name and file blob data
                String fileName = result.getString("file_name");
                Blob blob = result.getBlob("file_data");
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
                response.setContentType(mimeType);
                response.setContentLength(fileLength);
                String headerKey = "Content-Disposition";
                String headerValue = String.format("attachment; filename=\"%s\"", fileName);
                response.setHeader(headerKey, headerValue);
 
                // writes the file to the client
                OutputStream outStream = response.getOutputStream();
                 
                byte[] buffer = new byte[16177215];
                int bytesRead = -1;
                 
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outStream.write(buffer, 0, bytesRead);
                }
                 
                inputStream.close();
                outStream.close();             
            } else {
                // no file found
             //   response.getWriter().print("File not found for the id: " + uploadId);  
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            response.getWriter().print("SQL Error: " + ex.getMessage());
        } catch (IOException ex) {
            ex.printStackTrace();
            response.getWriter().print("IO Error: " + ex.getMessage());
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
    }
}
 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        
        String title = request.getParameter("title");
        String topic = request.getParameter("topic");
        String description = request.getParameter("description");
       // String labid=request.getParameter("labid");
        InputStream inputStream1 = null;
        InputStream inputStream2 = null;
      //  System.out.println("LAB ID IS "+labid);
        Part data = request.getPart("inputGroupFile01");
        Part instruction = request.getPart("inputGroupFile02");

        String filemessage = null;
        String instmessage = null;
        if (data != null && instruction != null) {
           
            System.out.println(data.getName()+instruction.getName());
            System.out.println(data.getSize()+instruction.getSize());
            System.out.print(data.getContentType()+instruction.getContentType());

            inputStream1 = data.getInputStream();
             inputStream2 = instruction.getInputStream();
        }
        System.out.println("1");
        String ratings = request.getParameter("ratings");
        HttpSession hs = request.getSession();
        Connection dbConn = null;
        try 
        {
            String userid;
              userid=(String) hs.getAttribute("userid");
            
              System.out.println("Final User id "+userid);
              
              
              System.out.println("GET Lab User");
            Class.forName("com.mysql.cj.jdbc.Driver");
            dbConn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/DeTuSte?useSSL=false&allowPublicKeyRetrieval=true", "root", "ilovemaster");
            
            String sql = "Insert into minitools_storage (title,topic,description,data_file,instruction_file,"
                    + "ratings,uploaded,userId) values "
                    + "(?, ?, ?, ?, ?, ?,curdate(),?)";
            PreparedStatement ps = dbConn.prepareStatement(sql);
            ps.setString(1, title);
            ps.setString(2, topic);
            ps.setString(3, description);
            ps.setString(6, ratings);
            ps.setString(7, userid);
            if (inputStream1 != null && inputStream2 != null) {
                // fetches input stream of the upload file for the blob column
                ps.setBlob(4, inputStream1);
                ps.setBlob(5, inputStream2);
            }
          
            int row2 = ps.executeUpdate();
            if (row2 > 0) {
                System.out.println("Instruction File uploaded and saved into database");
             
            }
            
         
            

            response.sendRedirect("/DiTuSte_Cryto/views/UploadedTools.jsp");
            
            
            ResultSet rs=ps.executeQuery("select lab_id from minitools_storage");
            
//            while(rs.next())
//            {
//            String labid=rs.getString(1);
//            
//             HttpSession s=request.getSession();
//             s.setAttribute("lab", labid);
//            System.out.println("lab id is "+labid);
//            

            //}
       }
        catch (Exception e) 
        {
            System.out.println(e.getMessage());
//            try 
//            {
//                dbConn.rollback();
//            } catch (SQLException ex) {
//                System.out.println(ex.getMessage());
//            }
        }
    }

    
    
   

}
