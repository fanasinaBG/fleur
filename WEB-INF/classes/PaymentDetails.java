package payment;

public class PaymentDetails {
    private int idPayment ;
    private String cart;
    private String numerocart;
    
    public PaymentDetails(String cart, String numerocart) {
        this.cart = cart;
        this.numerocart = numerocart;
    }
    public PaymentDetails(int idPayment, String cart, String numerocart) {
        this.idPayment = idPayment;
        this.cart = cart;
        this.numerocart = numerocart;
    }
    public int getIdPayment() {
        return idPayment;
    }
    public void setIdPayment(int idPayment) {
        this.idPayment = idPayment;
    }
    public String getCart() {
        return cart;
    }
    public void setCart(String cart) {
        this.cart = cart;
    }
    public String getNumerocart() {
        return numerocart;
    }
    public void setNumerocart(String numerocart) {
        this.numerocart = numerocart;
    }
}
