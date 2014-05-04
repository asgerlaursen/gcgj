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
        var totalHealth = basket.totalHealth - 3.5;
        healt.ajust(totalHealth);
    }

    public function calculateMarked(markedPlace:Marked, basket:Basket):void {
        markedPlace.calculateSupplyAndDemand(basket);
    }

    public function calculateEnvironment(environment:World, basket:Basket):void {
            environment.calculateFootprint(basket);
    }

    public function hasSufficientFunds(wallet:Wallet, basket:Basket):Boolean {
        return wallet.balance >= basket.totalPrice;
    }
}
}
