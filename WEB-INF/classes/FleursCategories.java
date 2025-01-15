package fleur;

public class FleursCategories {
    private int fleur_id;
    private String nomFleur;
    private int prix;
    private String descriptions;
    private String images;
    private int categoryId;
    private String nomCategory;
    private int quantite;

    

    public FleursCategories(int fleur_id, String nomFleur, int prix, String descriptions, String images,
            String nomCategory, int quantite) {
        this.fleur_id = fleur_id;
        this.nomFleur = nomFleur;
        this.prix = prix;
        this.descriptions = descriptions;
        this.images = images;
        this.nomCategory = nomCategory;
        this.quantite = quantite;
    }
    public FleursCategories(int fleur_id, String nomFleur, int prix, String images,
            String nomCategory, int quantite) {
        this.fleur_id = fleur_id;
        this.nomFleur = nomFleur;
        this.prix = prix;
        this.images = images;
        this.nomCategory = nomCategory;
        this.quantite = quantite;
    }
    public FleursCategories(int fleur_id, String nomFleur, int prix, String descriptions, String images, int categoryId,
            String nomCategory, int quantite) {
        this.fleur_id = fleur_id;
        this.nomFleur = nomFleur;
        this.prix = prix;
        this.descriptions = descriptions;
        this.images = images;
        this.categoryId = categoryId;
        this.nomCategory = nomCategory;
        this.quantite = quantite;
    }
    public FleursCategories(int fleur_id, String nomFleur, int prix, String descriptions, String images,
            String nomCategory) {
        this.fleur_id = fleur_id;
        this.nomFleur = nomFleur;
        this.prix = prix;
        this.descriptions = descriptions;
        this.images = images;
        this.nomCategory = nomCategory;
    }
    public FleursCategories(int fleur_id, String nomFleur, int prix, String descriptions, String images, int categoryId,
            String nomCategory) {
        this.fleur_id = fleur_id;
        this.nomFleur = nomFleur;
        this.prix = prix;
        this.descriptions = descriptions;
        this.images = images;
        this.categoryId = categoryId;
        this.nomCategory = nomCategory;
    }
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
    public int getPrix() {
        return prix;
    }
    public void setPrix(int prix) {
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
    public int getFleur_id() {
        return fleur_id;
    }
    public void setFleur_id(int fleur_id) {
        this.fleur_id = fleur_id;
    }
    public int getQuantite() {
        return quantite;
    }
    public void setQuantite(int quantite) {
        this.quantite = quantite;
    }

}
