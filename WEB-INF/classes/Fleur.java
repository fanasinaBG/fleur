package fleur;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Fleur {
    private int id;
    private String nomFleur;
    private int prix;
    private int idCategory;
    private String descriptions;
    private String images;
    private int quantite;


    
    
    public Fleur(int id, String nomFleur, int prix, int idCategory, String descriptions, String images, int quantite) {
        this.id = id;
        this.nomFleur = nomFleur;
        this.prix = prix;
        this.idCategory = idCategory;
        this.descriptions = descriptions;
        this.images = images;
        this.quantite = quantite;
    }

    public Fleur(int id) {
        this.id = id;
    }

    public Fleur(int id, String nomFleur, int prix) {
        this.id = id;
        this.nomFleur = nomFleur;
        this.prix = prix;
    }

    public Fleur(String nomFleur, int prix) {
        this.nomFleur = nomFleur;
        this.prix = prix;
    }

    public Fleur() {
    }
    
    public Fleur(String nomFleur, int prix, int idCategory, String descriptions, String images) {
        this.nomFleur = nomFleur;
        this.prix = prix;
        this.idCategory = idCategory;
        this.descriptions = descriptions;
        this.images = images;
    }
    public Fleur(int id, String nomFleur, int prix, int idCategory, String descriptions, String images) {
        this.id = id;
        this.nomFleur = nomFleur;
        this.prix = prix;
        this.idCategory = idCategory;
        this.descriptions = descriptions;
        this.images = images;
    }
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
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
    public int getIdCategory() {
        return idCategory;
    }
    public void setIdCategory(int idCategory) {
        this.idCategory = idCategory;
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

    public int getQuantite() {
        return quantite;
    }

    public void setQuantite(int quantite) {
        this.quantite = quantite;
    }
}
