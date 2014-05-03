/**
 * Created by asgerlaursen on 03/05/14.
 */
package basket {
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
    }

    public function addItem(item:BasketItem):void
    {
        _basketList.push(item);
        totalPrice+= item.price;
    }

    public function checkout():Array
    {
        return _basketList;
    }
}
}
