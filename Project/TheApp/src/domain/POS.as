/**
 * Created by asgerlaursen on 03/05/14.
 */
package domain {
import domain.basket.Basket;

public class POS {
    public function POS() {
    }

    public function calculateWealth(wallet:Wallet,basket:Basket):void
    {
        //how much money have you left
        var totalPrice:Number = basket.totalPrice;
        wallet.deduct(totalPrice);
    }

    public function calculateHealth(healt:Health, basket:Basket):void {
        var totalHealth;
    }

    public function calculateMarked(markedPlace:Marked, basket:Basket):void {

    }

    public function calculateEnvironment(environment:World, basket:Basket):void {

    }
}
}
