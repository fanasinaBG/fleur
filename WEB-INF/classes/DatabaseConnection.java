package connection;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    public static Connection getConnection() throws SQLException {
        Connection connection = null;
        try {
            // Charger le driver PostgreSQL
            Class.forName("org.postgresql.Driver");
            // Détails de la connexion à la base de données
            String url = "jdbc:postgresql://localhost:5432/fleur";
            String username = "postgres";
            String password = "123";
            
            // Créer la connexion
            connection = DriverManager.getConnection(url, username, password);

            System.out.println("Connexion réussie à la base de données !");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            throw new SQLException("Erreur de connexion à la base de données lesy et.");
        }
        return connection;
    }
  
    public static void main(String[] args) {
        try {
            // Tester la connexion
            Connection connection = DatabaseConnection.getConnection();
            // Fermer la connexion après le test
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            System.out.println("Échec de la connexion.");
            e.printStackTrace();
        }
    }
}
