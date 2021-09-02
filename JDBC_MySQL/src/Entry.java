import java.sql.*;
import java.util.Scanner;

public class Entry {
    private static final Scanner S = new Scanner(System.in);

    private static Connection c = null;
    private static ResultSet rs = null;

    public static void main(String[] args) {
        try {
            Class.forName("com.mysql.jdbc.Driver");

            c = DriverManager.getConnection("jdbc:derby://mysql.cms.livjm.ac.uk:3360/cmpamcgi", "cmpamcgi", "ca6proce"); 
            Statement s = c.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);

            rs = s.executeQuery("SELECT S.`no`, S.`name`, L.`due` "
                    +"FROM student S INNER JOIN `loan` L"
                    +"ON S.`no` = L.`no`"
                    +"WHERE L.`due` BETWEEN CURRENT_DATE AND DATE_ADD(YEAR(L.`taken`)(CURRENT_DATE()) AND L.`return` IS NULL");

            String choice = "";

            do {
                System.out.println("-- MAIN MENU --");
                System.out.println("1 - Browse ResultSet");
                System.out.println("2 - Invoke Procedure");
                System.out.println("Q - Quit");
                System.out.print("Pick : ");

                choice = S.next().toUpperCase();

                switch (choice) {
                    case "1" : {
                        browseResultSet();
                        break;
                    }
                    case "2" : {
                        invokeProcedure();
                        break;
                    }
                }
            } while (!choice.equals("Q"));

            c.close();

            System.out.println("Bye Bye :)");
        }
        catch (Exception e) {
            System.err.println(e.getMessage());
        }
    }

    private static void browseResultSet() throws Exception {
     if (rs.first()) {
         System.out.println("--BROWSE--");
         
         do { 
             System.out.println(String.format("no : %s, name : %s, due : %s\n", rs.getString("no"), rs.getString("name"), rs.getString("due")));
             
         } while (rs.next());
         
     }
     else {
         System.out.println("--INFORMATION UNAVALIABLE--");
             
         }
     }
    
    private static void invokeProcedure() throws Exception {
       System.out.println("--INVOKE PROCEDURE--");
       System.out.println("--ENTER BOOK ISBN--");
       String isbn = String.valueOf(S.next());
       
       CallableStatement cs = c.prepareCall ( "{CALL SetCreditsByStudentNumber(?,?)}" );
	cs.setString("Number", "2002");
	cs.setShort("isbn", (short)17);
	cs.executeUpdate();

    }
}
