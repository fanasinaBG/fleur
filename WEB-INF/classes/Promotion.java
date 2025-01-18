package promotion;

public class Promotion {
    private int id;
    private int idFleur;
    private int promotion;
    private String dateFin;
    private String dateDebut;

 
    
    public Promotion(int idFleur, int promotion, String dateFin, String dateDebut) {
        this.idFleur = idFleur;
        this.promotion = promotion;
        this.dateFin = dateFin;
        this.dateDebut = dateDebut;
    }

    public Promotion(int idFleur, int promotion, String dateFin) {
        this.idFleur = idFleur;
        this.promotion = promotion;
        this.dateFin = dateFin;
    }

    public Promotion() {
    }

    public Promotion(int id, int idFleur, int promotion, String dateFin) {
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

    public String getDateFin() {
        return dateFin;
    }

    public void setDateFin(String dateFin) {
        this.dateFin = dateFin;
    }

    public String getDateDebut() {
        return dateDebut;
    }

    public void setDateDebut(String dateDebut) {
        this.dateDebut = dateDebut;
    }
    
    
}



