package client;

public class Clients {
    private int id;
    private String nomClient;
    private String email;
    private String mdp;
    private int idPayment;

    
    public Clients() {
    }


    public Clients(int id, String nomClient, String email, String mdp, int idPayment) {
        this.id = id;
        this.nomClient = nomClient;
        this.email = email;
        this.mdp = mdp;
        this.idPayment = idPayment;
    }

    
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getNomClient() {
        return nomClient;
    }
    public void setNomClient(String nomClient) {
        this.nomClient = nomClient;
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
    public int getIdPayment() {
        return idPayment;
    }
    public void setIdPayment(int idPayment) {
        this.idPayment = idPayment;
    }

    
    
}

/*
    CREATE TABLE clients (
    id SERIAL PRIMARY KEY, 
    nomClient VARCHAR(100) NOT NULL,
    email VARCHAR(100)NOT NULL,
    mdp VARCHAR (100) NOT NULL,
    idPayment INT ,
    Foreign Key (idPayment) REFERENCES payment(id)
    );

 */