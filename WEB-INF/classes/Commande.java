package commande;

public class Commande {
    private int id ; 
    private String nomProduit;
    private String personne ;
    private String quantite ;
    private int prix;

    
    public Commande(String nomProduit, String personne, String quantite, int prix) {
        this.nomProduit = nomProduit;
        this.personne = personne;
        this.quantite = quantite;
        this.prix = prix;
    }
    public Commande(int id, String nomProduit, String personne, String quantite, int prix) {
        this.id = id;
        this.nomProduit = nomProduit;
        this.personne = personne;
        this.quantite = quantite;
        this.prix = prix;
    }
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getNomProduit() {
        return nomProduit;
    }
    public void setNomProduit(String nomProduit) {
        this.nomProduit = nomProduit;
    }
    public String getPersonne() {
        return personne;
    }
    public void setPersonne(String personne) {
        this.personne = personne;
    }
    public String getQuantite() {
        return quantite;
    }
    public void setQuantite(String quantite) {
        this.quantite = quantite;
    }
    public int getPrix() {
        return prix;
    }
    public void setPrix(int prix) {
        this.prix = prix;
    } 
}
