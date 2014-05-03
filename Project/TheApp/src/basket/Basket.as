/**
 * Created by asgerlaursen on 03/05/14.
 */
package basket {
public class Basket {

    private var _basketList:Array = [];
    public var runningTotal:Number = 0;

    public function Basket() {
    }


    public function clearBasket():void
    {
        _basketList =[];
        runningTotal = 0;
    }

    public function addItem(item:BasketItem):void
    {
        _basketList.push(item);
        runningTotal+= item.price;
    }

    public function checkout():Array
    {
        return _basketList;
    }
}
}
