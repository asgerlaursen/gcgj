/**
 * Created by asgerlaursen on 03/05/14.
 */
package domain {
import events.GameEvent;

public class Health {

    public var index:Number = 1;

    public function Health() {
    }

    public function ajust(amount:Number):void
    {
        //check whether it is possitive or not
        //calculate how "bad or good" it can be
        trace(amount);

        var ajustmentAmount:Number = amount / 100;
        index += ajustmentAmount;

        if(index <= 0) {
            Game.getInstance().gameOver();
        }

    }


}
}
