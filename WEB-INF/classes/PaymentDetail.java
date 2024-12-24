public class PaymentDetail {
    private int id;
    private int numero;
    private int idPayment;

    public PaymentDetail(int numero, int idPayment) {
        this.numero = numero;
        this.idPayment = idPayment;
    }
    public PaymentDetail() {
    }
    public PaymentDetail(int id, int numero, int idPayment) {
        this.id = id;
        this.numero = numero;
        this.idPayment = idPayment;
    }


    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public int getNumero() {
        return numero;
    }
    public void setNumero(int numero) {
        this.numero = numero;
    }
    public int getIdPayment() {
        return idPayment;
    }
    public void setIdPayment(int idPayment) {
        this.idPayment = idPayment;
    }

}


// CREATE TABLE paymentDetail (
//     id SERIAL PRIMARY KEY, 
//     numero INT,
//     idPayment INT ,
//     Foreign Key (idPayment) REFERENCES payment(id)
// );
