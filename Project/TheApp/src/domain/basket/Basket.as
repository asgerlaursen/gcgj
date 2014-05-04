/**
 * Created by asgerlaursen on 03/05/14.
 */
package domain.basket {
import events.GameEvent;

public class Basket {

    private var _basketList:Array = [];
    public var totalPrice:Number = 0;
    public var totalHealth:Number = 0;
    public var totalEnvironmental:Number = 0;

    public function Basket() {
    }

    public function clearBasket():void
    {
        _basketList =[];
        totalPrice = 0;
        Game.getInstance().dispatchEvent(new GameEvent(GameEvent.EVENT_BASKET_CLEARED));

    }

    public function addItem(item:BasketItem):void
    {
        _basketList.push(item);
        totalPrice+= item.price;
        Game.getInstance().dispatchEvent(new GameEvent(GameEvent.EVENT_ITEM_ADDED));
    }

    public function getBasketList():Array
    {
        return _basketList;
    }

    public function checkout():Array
    {
        return _basketList;
    }
}
}
