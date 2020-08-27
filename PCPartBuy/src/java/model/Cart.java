package model;

import java.util.ArrayList;
import java.util.List;


enum CartStatus {
    Active,
    Expired
}

public class Cart {
    private int cartID;
    private CartStatus status;
    private double cartTotal;
    private List<CartItem> items;
    
    
    
    public Cart() {
        this.status = CartStatus.Active;
        this.cartTotal = 0.00;
        this.items = new ArrayList<CartItem>(); 
        
    }   

    public int getCartID() {
        return cartID;
    }

    public void setCartID(int cartID) {
        this.cartID = cartID;
    }

    public double getCartTotal() {
        return cartTotal;
    }

    public void setCartTotal(double cartTotal) {
        this.cartTotal = cartTotal;
    } 
    
    public void Add(CartItem cartItem) {
        items.add(cartItem);
        calculateTotal();
    }
    
    public void Remove(int cartItemID){
        items.remove(cartItemID);
        calculateTotal();
        
    }

    public List<CartItem> getItems() {
        return items;
    }
    
    public CartItem getCartItem(int cartItemID){
        for (CartItem cartItem : this.getItems()) {
            if (cartItem.getItemID() == cartItemID){
                return cartItem;
            }
        }
        return null;
    }
    
    public void calculateTotal(){
        cartTotal = 0;
        for (CartItem cartItem : this.getItems()) {
             cartTotal = cartTotal + (cartItem.getQuantity() * cartItem.getPrice());
        }
        
    }
    
    public int numOfItems(){
        int numOfItems = items.size();
        return numOfItems;
    }
    
}
