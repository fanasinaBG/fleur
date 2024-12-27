package client;

import connection.DatabaseConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;



public class RequeteClient {
    public void createClient(Clients client){
        String sql = "INSERT INTO clients (nomClient, email, mdp) VALUES (?, ?, ?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1,client.getNomClient());
                stmt.setString(2,client.getEmail());
                stmt.setString(3,client.getMdp());
                stmt.executeUpdate();  
             }
             catch(SQLException e){
                System.out.println("Erreur" + e.getMessage());
             }
    } 

    public boolean validateClient(String nom, String email) {
      String sql = "SELECT * FROM clients WHERE nomClient = ? AND email = ? ";
      try (Connection conn = DatabaseConnection.getConnection();
           PreparedStatement stmt = conn.prepareStatement(sql)) {
  
          stmt.setString(1, nom);
          stmt.setString(2, email);
         //  stmt.setString(3, mdp);
  
          ResultSet resultSet = stmt.executeQuery();
  
          return resultSet.next(); // Retourne true si un enregistrement correspondant est trouvé
      } catch (SQLException e) {
          System.out.println("Erreur: " + e.getMessage());
          return false;
      }
  }
  

    public List<String> readClient(){
        List<String> listClient= new ArrayList<>();
        String sql = "SELECT * FROM clients ";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
                ResultSet resultSet = stmt.executeQuery();

                while (resultSet.next()) {
                    String nomClient = resultSet.getString("nomClient");
                    String email = resultSet.getString("email");
                    String mdp = resultSet.getString("mdp");

                    listClient.add(nomClient + email + mdp);
                    System.out.println("Nom Client: " + nomClient);
                    System.out.println("Email: " + email);
                    System.out.println("mdp: " + mdp);
                    System.out.println("_____________");
                }
             }
             catch(SQLException e){
                System.out.println("Erreur" + e.getMessage());
             }
             return listClient;
    }

    public void updateClient(Clients client){
        String sql = "UPDATE clients SET nomClient = ?, email = ?, mdp = ? WHERE id=?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1,client.getNomClient());
                stmt.setString(2,client.getEmail());
                stmt.setString(3,client.getMdp());      
                stmt.setInt(4,client.getId());    
                stmt.executeUpdate();  
             }
             catch(SQLException e){
                System.out.println("Erreur" + e.getMessage());
             }
    }

    public void deleteClient(int id){
        String sql = "DELETE FROM Clients WHERE id = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {    
                stmt.setInt(1, id);    
                stmt.executeUpdate();  
             }
             catch(SQLException e){
                System.out.println("Erreur, tsy voafafa" + e.getMessage());
             }
    }

    public static void main(String[] args) {
        RequeteClient requete = new RequeteClient();
        // String Nom = "anarana";
        // String Email = "mail";
        // String mdp = "123";
        
        String nomClient = "za";
        String email = "jfdh@gmail.com";
        String mdp = "120h";
        int id = 1;

        // Clients client = new Clients(Nom,Email,mdp);
        // requete.readClient();
        // requete.createClient(client);
        // Clients c= new Clients(id, nomClient, email, mdp);
        
        // requete.updateClient(c);
        requete.deleteClient(id);


        //System.out.println("clien enregistrer avec" + Nom + "et email:" + Email + "et mdp:"+mdp);
    }
}

