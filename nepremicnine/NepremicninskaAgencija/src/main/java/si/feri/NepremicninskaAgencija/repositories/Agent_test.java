package si.feri.NepremicninskaAgencija.repositories;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

public class Agent_test{
    private Connection connect = null;
    private Statement statement = null;
    private PreparedStatement preparedStatement = null;
    private ResultSet resultSet = null;

    public void readDataBase() throws Exception {
     try {
        // This will load the MySQL driver, each DB has its own driver
        Class.forName("com.mysql.cj.jdbc.Driver");
        // Setup the connection with the DB
        connect = DriverManager
                .getConnection("jdbc:mysql://localhost:3306/test?serverTimezone=UTC", "root", "root");

        // Statements allow to issue SQL queries to the database
        statement = connect.createStatement();
       // Result set get the result of the SQL query
        resultSet = statement
                .executeQuery("select * from agent_test");
         ResultSet rs = statement.executeQuery("select * from agent_test");
         while (rs.next())
         {
             int foo = rs.getInt(1);
             System.out.println(foo);
         }
/*
        // PreparedStatements can use variables and are more efficient
        preparedStatement = connect
                .prepareStatement("insert into  test.agent_test values (default, ?, ?)");
        // "myuser, webpage, datum, summary, COMMENTS from feedback.comments");
        // Parameters start with 1
        preparedStatement.setString(1, "luka");
        preparedStatement.setString(2, "pečnik");
       // preparedStatement.setString(3, "TestWebpage");
       // preparedStatement.setDate(4, new java.sql.Date(2009, 12, 11));
       // preparedStatement.setString(5, "TestSummary");
       // preparedStatement.setString(6, "TestComment");
        //preparedStatement.executeUpdate();
*/
        preparedStatement = connect
                .prepareStatement("SELECT ime, priimek from agent_test");
        resultSet = preparedStatement.executeQuery();

         ResultSet rs2 = statement.executeQuery("select ime, priimek from agent_test");
         while (rs2.next())
         {
             int foo = rs2.getInt(1);
             System.out.println(foo);
         }
/*
        // Remove again the insert comment
        preparedStatement = connect
                .prepareStatement("delete from feedback.comments where myuser= ? ; ");
        preparedStatement.setString(1, "Test");
        preparedStatement.executeUpdate();

        resultSet = statement
                .executeQuery("select * from feedback.comments");
   */

    } catch (Exception e) {
        throw e;
    } finally {
        close();
    }
}


    // You need to close the resultSet
    private void close() {
        try {
            if (resultSet != null) {
                resultSet.close();
            }

            if (statement != null) {
                statement.close();
            }

            if (connect != null) {
                connect.close();
            }
        } catch (Exception e) {

        }
    }


}