package vente;
import java.sql.Date;
public class VueVente {
    private int id_vente;
    private String nom_client;
    private int id_fleur;
    private String nom_fleur;
    private int prix_fleur;
    private String images_fleur;
    private int id_Client;
    private Date date;


    
    
   
    public VueVente(int id_vente, String nom_client, int id_fleur, String nom_fleur, int prix_fleur,
            String images_fleur, int id_Client, Date date) {
        this.id_vente = id_vente;
        this.nom_client = nom_client;
        this.id_fleur = id_fleur;
        this.nom_fleur = nom_fleur;
        this.prix_fleur = prix_fleur;
        this.images_fleur = images_fleur;
        this.id_Client = id_Client;
        this.date = date;
    }
    public int getId_vente() {
        return id_vente;
    }
    public void setId_vente(int id_vente) {
        this.id_vente = id_vente;
    }
    public String getNom_client() {
        return nom_client;
    }
    public void setNom_client(String nom_client) {
        this.nom_client = nom_client;
    }
    public int getId_fleur() {
        return id_fleur;
    }
    public void setId_fleur(int id_fleur) {
        this.id_fleur = id_fleur;
    }
    public String getNom_fleur() {
        return nom_fleur;
    }
    public void setNom_fleur(String nom_fleur) {
        this.nom_fleur = nom_fleur;
    }
    public int getPrix_fleur() {
        return prix_fleur;
    }
    public void setPrix_fleur(int prix_fleur) {
        this.prix_fleur = prix_fleur;
    }
    public String getImages_fleur() {
        return images_fleur;
    }
    public void setImages_fleur(String images_fleur) {
        this.images_fleur = images_fleur;
    }
    public int getId_Client() {
        return id_Client;
    }
    public void setId_Client(int id_Client) {
        this.id_Client = id_Client;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    

}
