package promotion;

public class PromFleur {
    private int idFleur;
    private String nomFleur;
    private int prixFleur;
    private String images;
    private int quantite;
    private int promotion;
    private String dateFin;
    
    public PromFleur(int idFleur, String nomFleur, int prixFleur, String images, int promotion, String dateFin) {
        this.idFleur = idFleur;
        this.nomFleur = nomFleur;
        this.prixFleur = prixFleur;
        this.images = images;
        this.promotion = promotion;
        this.dateFin = dateFin;
    }

    public PromFleur() {
    }

    public PromFleur(int idFleur, String nomFleur, int prixFleur, String images, int quantite, int promotion,
            String dateFin) {
        this.idFleur = idFleur;
        this.nomFleur = nomFleur;
        this.prixFleur = prixFleur;
        this.images = images;
        this.quantite = quantite;
        this.promotion = promotion;
        this.dateFin = dateFin;
    }
    
    public int getIdFleur() {
        return idFleur;
    }
    public void setIdFleur(int idFleur) {
        this.idFleur = idFleur;
    }
    public String getNomFleur() {
        return nomFleur;
    }
    public void setNomFleur(String nomFleur) {
        this.nomFleur = nomFleur;
    }
    public int getPrixFleur() {
        return prixFleur;
    }
    public void setPrixFleur(int prixFleur) {
        this.prixFleur = prixFleur;
    }
    public String getImages() {
        return images;
    }
    public void setImages(String images) {
        this.images = images;
    }
    public int getQuantite() {
        return quantite;
    }
    public void setQuantite(int quantite) {
        this.quantite = quantite;
    }
    public int getPromotion() {
        return promotion;
    }
    public void setPromotion(int promotion) {
        this.promotion = promotion;
    }
    public String getDateFin() {
        return dateFin;
    }
    public void setDateFin(String dateFin) {
        this.dateFin = dateFin;
    }
}

