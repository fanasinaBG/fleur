package vente;

public class Remise {
    private int id;
    private int remise;


    
    public Remise() {
    }

    public Remise(int remise) {
        this.remise = remise;
    }

    public Remise(int id, int remise) {
        this.id = id;
        this.remise = remise;
    }
    
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public int getRemise() {
        return remise;
    }
    public void setRemise(int remise) {
        this.remise = remise;
    }
}
