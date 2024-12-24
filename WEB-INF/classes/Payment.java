public class Payment {
    private int id;
    private String nomPayment;


    public Payment(String nomPayment) {
        this.nomPayment = nomPayment;
    }

    public Payment() {
    }

    public Payment(int id, String nomPayment) {
        this.id = id;
        this.nomPayment = nomPayment;
    }
    
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getNomPayment() {
        return nomPayment;
    }
    public void setNomPayment(String nomPayment) {
        this.nomPayment = nomPayment;
    }
}

