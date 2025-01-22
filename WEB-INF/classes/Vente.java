package vente;

public class Vente {
    private int id ;
    private int idClient;
    private int idFleur;
    
    public Vente(int idClient, int idFleur) {
        this.idClient = idClient;
        this.idFleur = idFleur;
    }
    public Vente(int id, int idClient, int idFleur) {
        this.id = id;
        this.idClient = idClient;
        this.idFleur = idFleur;
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

    
    
}
