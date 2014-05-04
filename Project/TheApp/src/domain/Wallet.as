/**
 * Created by asgerlaursen on 03/05/14.
 */
package domain {
public class Wallet {

    public var balance:Number = 100;

    public function Wallet() {
    }

    public function deduct(totalPrice:Number):void {
            balance -= totalPrice;

    }

    public function deposit(price:Number):void {
        balance += Math.round(price);
    }
}
}
