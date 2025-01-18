package promotion;

import java.sql.Date;

public class PromFleur {
    private int idFleur;
    private String nomFleur;
    private int prixFleur;
    private String images;
    private int quantite;
    private int promotion;
    private Date dateFin;
    private Date dateDebut;

    
    public PromFleur(int idFleur, String nomFleur, int prixFleur, String images, int quantite, int promotion,
            Date dateFin, Date dateDebut) {
        this.idFleur = idFleur;
        this.nomFleur = nomFleur;
        this.prixFleur = prixFleur;
        this.images = images;
        this.quantite = quantite;
        this.promotion = promotion;
        this.dateFin = dateFin;
        this.dateDebut = dateDebut;
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
    public Date getDateFin() {
        return dateFin;
    }
    public void setDateFin(Date dateFin) {
        this.dateFin = dateFin;
    }
    public Date getDateDebut() {
        return dateDebut;
    }
    public void setDateDebut(Date dateDebut) {
        this.dateDebut = dateDebut;
    }
    public int getPromotion() {
        return promotion;
    }
    public void setPromotion(int promotion) {
        this.promotion = promotion;
    }
    
   
}

