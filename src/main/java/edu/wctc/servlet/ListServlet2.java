package edu.wctc.servlet;

import edu.wctc.DatabaseUtils;
import edu.wctc.entity.Task;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ListServlet", urlPatterns = "/list2")
public class ListServlet2 extends HttpServlet {
    private final String DRIVER_NAME = "jdbc:derby:";
    private final String DATABASE_PATH = "../../db";
    private final String USERNAME = "jerry";
    private final String PASSWORD = "jerry";

    // Comment

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Declare outside the try/catch so the variables are in scope in the finally block
        Connection conn = null;
        Statement stmt = null;
        ResultSet rset = null;

        try {
            // Load the driver
            Class.forName("org.apache.derby.jdbc.EmbeddedDriver");

            // Find the absolute path of the database folder
            String absPath = getServletContext().getRealPath("/") + DATABASE_PATH;

            StringBuilder sql = new StringBuilder("SELECT *");
            sql.append(" FROM task");
            sql.append(" left join TASKDETAIL");
            sql.append(" on TASK.TASKID = TASKDETAIL.TASKID");
            sql.append(" left join TASKCATEGORY");
            sql.append(" on TASK.CATEGORYID = TASKCATEGORY.CATEGORYID");
            sql.append(" left join TASKPRIORITY");
            sql.append(" on TASK.PRIORITYID = TASKPRIORITY.PRIORITYID");
            sql.append(" ORDER BY taskid asc"); // Don't end SQL with semicolon!

            // Create a connection
            conn = DriverManager.getConnection(DRIVER_NAME + absPath, USERNAME, PASSWORD);
            // Create a statement to execute SQL
            stmt = conn.createStatement();
            // Execute a SELECT query and get a result set
            rset = stmt.executeQuery(sql.toString());

            // Create a StringBuilder for ease of appending strings
            List<Task> anotherTaskList = new ArrayList<Task>();

//            StringBuilder output = new StringBuilder();
//
//            // HTML to create a simple web page
//            output.append("<html><head><link type='text/css' rel='stylesheet' href='css/style.css'></head><body><ul>");

            // Loop while the result set has more rows
            while (rset.next()) {
                Task anotherTask = new Task();
                // Get the first string (the pet name) from each record
                anotherTask.setTaskId(rset.getInt(1));
                anotherTask.setTaskName(rset.getString(2));
                anotherTask.setTaskDueDate(rset.getDate(3));
                anotherTask.setTaskComplete(rset.getBoolean(4));
                anotherTask.setTaskCategory(rset.getString(5));
                anotherTask.setTaskDetail(rset.getString(6));
                anotherTask.setTaskPriority(rset.getString(7));
                
                // Append it as a list item
                output.append("<li>").append(taskID + ": " + taskName + ": " + taskDueDate + ": " + taskCompete + ": " + category + ": " + priorityID).append("</li>");
            }
            // Close all those opening tags
            output.append("</ul></body></html>");

            // Send the HTML as the response to browser
            response.setContentType("text/html");
            // outputs to browser
            response.getWriter().print(output.toString());

        } catch (SQLException | ClassNotFoundException e) {
            // If there's an exception locating the driver, send IT as the response
            response.getWriter().print(e.getMessage());
            e.printStackTrace();
        } finally {
            if (rset != null) {
                try {
                    rset.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }

            DatabaseUtils.closeAll(conn, stmt, rset);
//            if (stmt != null) {
//                try {
//                    stmt.close();
//                } catch (SQLException e) {
//                    e.printStackTrace();
//                }
//            }
//            if (conn != null) {
//                try {
//                    conn.close();
//                } catch (SQLException e) {
//                    e.printStackTrace();
//                }
//            }
        }
    }
}

