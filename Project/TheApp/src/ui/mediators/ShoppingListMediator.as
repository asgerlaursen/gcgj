/**
 * Created by asgerlaursen on 03/05/14.
 */
package ui.mediators {
import flash.events.MouseEvent;

public class ShoppingListMediator {

    private var _list:ShoppingList;
    private var _game:Game;
    private var _toggled:Boolean = false;

    public function ShoppingListMediator(sl:ShoppingList) {
        _game = Game.getInstance();
        _list = sl;
        _list._checkOutBtn.addEventListener(MouseEvent.CLICK, handleCheckout)
        _list._pullOut.addEventListener(MouseEvent.CLICK, toggleList);
    }

    private function toggleList(event:MouseEvent):void {
        _toggled = !_toggled;
        if(_toggled)
        {
            _list.x = -400;
        }
    }

    private function handleCheckout(event:MouseEvent):void {
         _game.checkOut();
    }
}
}
