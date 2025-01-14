package commande;

public class Commande {
    private int id ; 
    private String nomProduit;
    private String personne ;
    private String quantite ;
    private int prixTotal;
    private int prixUnitaire;

    
    public Commande(String nomProduit, String personne, String quantite, int prixTotal, int prixUnitaire) {
        this.nomProduit = nomProduit;
        this.personne = personne;
        this.quantite = quantite;
        this.prixTotal = prixTotal;
        this.prixUnitaire = prixUnitaire;
    }


    public Commande(int id, String nomProduit, String personne, String quantite, int prixTotal, int prixUnitaire) {
        this.id = id;
        this.nomProduit = nomProduit;
        this.personne = personne;
        this.quantite = quantite;
        this.prixTotal = prixTotal;
        this.prixUnitaire = prixUnitaire;
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

    
  
}
