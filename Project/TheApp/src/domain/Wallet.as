/**
 * Created by asgerlaursen on 03/05/14.
 */
package domain {
public class Wallet {

    public var balance:Number;

    public function Wallet() {
    }

    public function deduct(totalPrice:Number):void {
            balance -= totalPrice;

    }
}
}