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
    public var totalFairness:Number = 0;

    public function Basket() {
    }

    public function clearBasket():void
    {
        _basketList =[];
        totalPrice = 0;
        totalHealth = 0;
        totalEnvironmental = 0;
        totalFairness = 0;
        Game.getInstance().dispatchEvent(new GameEvent(GameEvent.EVENT_BASKET_CLEARED));

    }

    public function addItem(item:BasketItem):void
    {
        _basketList.push(item);
        totalPrice+= item.price;
        totalHealth += item.health;
        totalEnvironmental += item.environment;
        totalFairness += item.fairness;
        Game.getInstance().dispatchEvent(new GameEvent(GameEvent.EVENT_ITEM_ADDED));
    }

    public function getItemsForGroup(_group:String):Array {
        var returnArr:Array = [];
        for(var i:int = 0; i < _basketList.length; i++) {
            if(_basketList[i].groupAlias == _group) {
                returnArr.push(_basketList[i]);
            }
        }
        return returnArr;
    }

    public function getBasketList():Array
    {
        return _basketList;
    }
0
    public function checkout():Array
    {
        return _basketList;
    }
}
}
