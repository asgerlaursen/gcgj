/**
 * Created by asgerlaursen on 03/05/14.
 */
package ui.mediators {
import flash.events.MouseEvent;

public class ShoppingListMediator {

    private var _list:ShoppingList;
    private var _game:Game;
    public function ShoppingListMediator(sl:ShoppingList) {
        _game = Game.getInstance();
        _list = sl;
        _list._checkOutBtn.addEventListener(MouseEvent.CLICK, handleCheckout)
    }

    private function handleCheckout(event:MouseEvent):void {
         _game.checkOut();
    }
}
}
