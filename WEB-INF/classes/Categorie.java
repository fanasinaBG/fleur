package fleur;

public class Categorie {
    private int id;
    private String nomCategory;
    private int idEvenement;


    public Categorie(String nomCategory) {
        this.nomCategory = nomCategory;
    }

    public Categorie() {
    }

    public Categorie(String nomCategory, int idEvenement) {
        this.nomCategory = nomCategory;
        this.idEvenement = idEvenement;
    }

    public Categorie(int id, String nomCategory, int idEvenement) {
        this.id = id;
        this.nomCategory = nomCategory;
        this.idEvenement = idEvenement;
    } 

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getNomCategory() {
        return nomCategory;
    }
    public void setNomCategory(String nomCategory) {
        this.nomCategory = nomCategory;
    }
    public int getIdEvenement() {
        return idEvenement;
    }
    public void setIdEvenement(int idEvenement) {
        this.idEvenement = idEvenement;
    }
}
