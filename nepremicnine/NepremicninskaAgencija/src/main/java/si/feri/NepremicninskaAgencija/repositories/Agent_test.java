package si.feri.NepremicninskaAgencija.repositories;

import javax.xml.transform.Result;
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
         //ZA VSAK DAO SVOJA POVEZAVA IN ZAPIRANJE BAZE
        connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb?serverTimezone=UTC", "root", "root");

        System.out.println("začetek: ");

        // Statements allow to issue SQL queries to the database
        statement = connect.createStatement();
       // Result set get the result of the SQL query
        resultSet = statement.executeQuery("select * from agent");
        writeResultSet(resultSet);

        preparedStatement = connect.prepareStatement("insert into  agent values (default, ?, ?,?,?,?)");
        // Parameters start with 1
         preparedStatement.setString(1, "Eva");
        preparedStatement.setString(2, "Smolak");
        preparedStatement.setString(3, "mail");
         preparedStatement.setString(4, "031");
         preparedStatement.setString(5, "geslo");
        // preparedStatement.setString(6, "xyz");
        preparedStatement.executeUpdate();

        System.out.println("po vnosu: ");
         resultSet = statement.executeQuery("select * from agent");
         writeResultSet(resultSet);


         System.out.println("po zbrisu: ");
        // Remove again the insert comment
        preparedStatement = connect.prepareStatement("delete from agent where Ime= ? ; ");
        preparedStatement.setString(1, "Luka");
        preparedStatement.executeUpdate();

         resultSet = statement.executeQuery("select * from agent");
         writeResultSet(resultSet);

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

    private void writeResultSet(ResultSet resultSet) throws SQLException {
        // ResultSet is initially before the first data set
        while (resultSet.next()) {
            // It is possible to get the columns via name
            // also possible to get the columns via the column number
            // which starts at 1
            // e.g. resultSet.getSTring(2);
            String name = resultSet.getString("Ime");
            String surname = resultSet.getString("Priimek");
            System.out.println("IME: " + name);
            System.out.println("PRIIMEK: " + surname);
        }
    }


}