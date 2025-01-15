import java.util.Date;

public class Promotion {
    int id;
    int idFleur;
    int promotion;
    DATE dateFin;

    
    public Promotion() {
    }

    public Promotion(int id, int idFleur, int promotion, DATE dateFin) {
        this.id = id;
        this.idFleur = idFleur;
        this.promotion = promotion;
        this.dateFin = dateFin;
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
    public DATE getDateFin() {
        return dateFin;
    }
    public void setDateFin(DATE dateFin) {
        this.dateFin = dateFin;
    }
}




