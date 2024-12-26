package fleur;

public class FleursCategories {
    private String nomFleur;
    private int prix;
    private String descriptions;
    private String images;
    private int categoryId;
    private String nomCategory;

    

    public FleursCategories() {
    }
    public FleursCategories(String nomFleur, int prix, String descriptions, String images, int categoryId,
            String nomCategory) {
        this.nomFleur = nomFleur;
        this.prix = prix;
        this.descriptions = descriptions;
        this.images = images;
        this.categoryId = categoryId;
        this.nomCategory = nomCategory;
    }
    public String getNomFleur() {
        return nomFleur;
    }
    public void setNomFleur(String nomFleur) {
        this.nomFleur = nomFleur;
    }
    public double getPrix() {
        return prix;
    }
    public void setPrix(double prix) {
        this.prix = prix;
    }
    public String getDescriptions() {
        return descriptions;
    }
    public void setDescriptions(String descriptions) {
        this.descriptions = descriptions;
    }
    public String getImages() {
        return images;
    }
    public void setImages(String images) {
        this.images = images;
    }
    public int getCategoryId() {
        return categoryId;
    }
    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }
    public String getNomCategory() {
        return nomCategory;
    }
    public void setNomCategory(String nomCategory) {
        this.nomCategory = nomCategory;
    }

}
