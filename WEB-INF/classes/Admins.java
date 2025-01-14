package admi;

public class Admins {
    private String nomAdmin;
    private String email;
    private String mdp;
    
    
    public Admins() {
    }
    
    public Admins(String nomAdmin, String email, String mdp) {
        this.nomAdmin = nomAdmin;
        this.email = email;
        this.mdp = mdp;
    }
 
    public String getNomAdmin() {
        return nomAdmin;
    }
    public void setNomAdmin(String nomAdmin) {
        this.nomAdmin = nomAdmin;
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
