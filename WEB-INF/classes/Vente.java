package vente;
import java.sql.Date;

public class Vente {
    private int id ;
    private int idClient;
    private int idFleur;
    private Date dateVente;
    
    
    public Vente(int idClient, int idFleur, Date dateVente) {
        this.idClient = idClient;
        this.idFleur = idFleur;
        this.dateVente = dateVente;
    }
    public Vente(int id, int idClient, int idFleur, Date dateVente) {
        this.id = id;
        this.idClient = idClient;
        this.idFleur = idFleur;
        this.dateVente = dateVente;
    }
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public int getIdClient() {
        return idClient;
    }
    public void setIdClient(int idClient) {
        this.idClient = idClient;
    }
    public int getIdFleur() {
        return idFleur;
    }
    public void setIdFleur(int idFleur) {
        this.idFleur = idFleur;
    }
    public Date getDateVente() {
        return dateVente;
    }
    public void setDateVente(Date dateVente) {
        this.dateVente = dateVente;
    }

    
    
}
