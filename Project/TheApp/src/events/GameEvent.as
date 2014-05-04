/**
 * Created by asgerlaursen on 03/05/14.
 */
package events {
import flash.events.Event;


public class GameEvent extends Event {
    public static const EVENT_INIT_GAME:String = "initGame";
    public static const EVENT_START_LEVEL:String = "startGame";
    public static const EVENT_ENTER_SHOPPING:String = "enterShopping";
    public static const EVENT_ENTER_LIST:String = "enterList";
    public static const EVENT_CHEKCOUT_BASKET:String = "checkoutBasket";
    public static const EVENT_CHECKOUT_COMPLETE:String = "checkoutComplete";
    public static const EVENT_GAME_STATE_CHANGE:String ="gameStateChange";
    public static const EVENT_NOT_SUFFICIENT_FUNDS:String = "notSufficinetFunds";
    public static const EVENT_GAME_SCENE_CHANGE:String = "gameSceneChange";
    public static const EVENT_GAME_OVER:String = "gameOver";

    public static const EVENT_ITEM_ADDED:String = "itemAdded";
    public static const EVENT_BASKET_CLEARED:String = "basketCleared";

    public function GameEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false) {
        super(type, bubbles, cancelable);
    }
}
}
