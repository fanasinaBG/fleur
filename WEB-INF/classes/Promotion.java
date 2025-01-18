package promotion;

import java.sql.Date;

public class Promotion {
    private int id;
    private int idFleur;
    private int promotion;
    private Date dateFin;
    private Date dateDebut;

    
    
    public Promotion(int idFleur, int promotion, Date dateFin, Date dateDebut) {
        this.idFleur = idFleur;
        this.promotion = promotion;
        this.dateFin = dateFin;
        this.dateDebut = dateDebut;
    }
    public Promotion(int id, int idFleur, int promotion, Date dateFin, Date dateDebut) {
        this.id = id;
        this.idFleur = idFleur;
        this.promotion = promotion;
        this.dateFin = dateFin;
        this.dateDebut = dateDebut;
    }
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public int getIdFleur() {
        return idFleur;
    }
    public void setIdFleur(int idFleur) {
        this.idFleur = idFleur;
    }
    public int getPromotion() {
        return promotion;
    }
    public void setPromotion(int promotion) {
        this.promotion = promotion;
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

 
    
  
    
}



