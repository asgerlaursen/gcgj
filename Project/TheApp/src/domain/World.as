/**
 * Created by asgerlaursen on 03/05/14.
 */
package domain {
import domain.basket.Basket;
import com.thonbo.utils.MathUtils

public class World {

    public var degration:int = 1;
    private var degrationPercent:Number = 100;
    private var steps:int = 12;
    private var healTheWorldEveryday:Number = 0.3;

    public function World() {
    }

    public function calculateFootprint(basket:Basket):void {
        var addToWorld = basket.totalEnvironmental + basket.totalFairness + healTheWorldEveryday;
        degrationPercent += addToWorld;
        degration = Math.round(MathUtils.ratioValue(degrationPercent, 0, 100, steps, 1));
        trace("degration: " + degration)
    }
}
}
