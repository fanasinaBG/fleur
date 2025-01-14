import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class RequeteAdmin {

     public boolean validateAdmin(String nom, String email, String mdp) {
      String sql = "SELECT * FROM administrateur WHERE email = ? AND mdp = ?";
      try (Connection conn = DatabaseConnection.getConnection();
           PreparedStatement stmt = conn.prepareStatement(sql)) {
  
          stmt.setString(1, email);
          stmt.setString(2, mdp);
  
          ResultSet resultSet = stmt.executeQuery();
  
          return resultSet.next(); // Retourne true si un enregistrement correspondant est trouvé
      } catch (SQLException e) {
          System.out.println("Erreur: " + e.getMessage());
          return false;
      }
  }

}
 