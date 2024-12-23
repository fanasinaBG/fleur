package client;

import connection.DatabaseConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.sun.security.ntlm.Client;

public class RequeteClient {
    public void createClient(Client client){
        String sql = "INSERT INTO clients (nomClient, email, mdp) VALUES (?, ?, ?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(client.getNomClient());
                stmt.setString(client.getEmail());
                stmt.setString(client.getMdp());
             }
             catch(SQLException e){
                System.out.println("Erreur" + e.getMessage());
             }
    }

    public static void main(String[] args) {
        RequeteClient requete = new RequeteClient();
        String Nom = "anarana";
        String Email = "mail";
        String mdp = "123";

        Clients client = new Clients(Nom,Email,mdp);

        System.out.println("clien enregistrer avec" + Nom + "et email:" + Email + "et mdp:"+mdp);
    }
}

