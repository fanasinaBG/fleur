package fleur;

public class Evenement {
    private int id;
    private String nomEvenement;

            
    public Evenement() {
    }
    public Evenement(String nomEvenement) {
        this.nomEvenement = nomEvenement;
    }
    public Evenement(int id, String nomEvenement) {
        this.id = id;
        this.nomEvenement = nomEvenement;
    }

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getNomEvenement() {
        return nomEvenement;
    }
    public void setNomEvenement(String nomEvenement) {
        this.nomEvenement = nomEvenement;
    }

    
}
