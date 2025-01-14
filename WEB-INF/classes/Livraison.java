package livraison;

public class Livraison {
   private int id; 
   private String Client;
    private String nomProduit;
    private String quantite ;
    private int prixTotal ;
    private int prixUnitaire ;
    private int idConfirmation ;
    
    public Livraison(String client, String nomProduit, String quantite, int prixTotal, int prixUnitaire) {
        Client = client;
        this.nomProduit = nomProduit;
        this.quantite = quantite;
        this.prixTotal = prixTotal;
        this.prixUnitaire = prixUnitaire;
    }

    public Livraison(String client, String nomProduit, String quantite, int prixTotal, int prixUnitaire,
            int idConfirmation) {
        Client = client;
        this.nomProduit = nomProduit;
        this.quantite = quantite;
        this.prixTotal = prixTotal;
        this.prixUnitaire = prixUnitaire;
        this.idConfirmation = idConfirmation;
    }

    public Livraison(int id, String client, String nomProduit, String quantite, int prixTotal, int prixUnitaire,
            int idConfirmation) {
        this.id = id;
        Client = client;
        this.nomProduit = nomProduit;
        this.quantite = quantite;
        this.prixTotal = prixTotal;
        this.prixUnitaire = prixUnitaire;
        this.idConfirmation = idConfirmation;
    }

    public Livraison() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getClient() {
        return Client;
    }

    public void setClient(String client) {
        Client = client;
    }

    public String getNomProduit() {
        return nomProduit;
    }

    public void setNomProduit(String nomProduit) {
        this.nomProduit = nomProduit;
    }

    public String getQuantite() {
        return quantite;
    }

    public void setQuantite(String quantite) {
        this.quantite = quantite;
    }

    public int getPrixTotal() {
        return prixTotal;
    }

    public void setPrixTotal(int prixTotal) {
        this.prixTotal = prixTotal;
    }

    public int getPrixUnitaire() {
        return prixUnitaire;
    }

    public void setPrixUnitaire(int prixUnitaire) {
        this.prixUnitaire = prixUnitaire;
    }

    public int getIdConfirmation() {
        return idConfirmation;
    }

    public void setIdConfirmation(int idConfirmation) {
        this.idConfirmation = idConfirmation;
    }
    
}
