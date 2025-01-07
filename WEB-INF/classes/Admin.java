package admin;

public class Admin {
    int id ;
    String nomAdmins ;
    String email ;
    String mdp ;

    
    public Admin(String nomAdmins, String email, String mdp) {
        this.nomAdmins = nomAdmins;
        this.email = email;
        this.mdp = mdp;
    }

    public Admin(int id, String nomAdmins, String email, String mdp) {
        this.id = id;
        this.nomAdmins = nomAdmins;
        this.email = email;
        this.mdp = mdp;
    }
    
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getNomAdmins() {
        return nomAdmins;
    }
    public void setNomAdmins(String nomAdmins) {
        this.nomAdmins = nomAdmins;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getMdp() {
        return mdp;
    }
    public void setMdp(String mdp) {
        this.mdp = mdp;
    }
}
