/**
 * Created by asgerlaursen on 03/05/14.
 */
package ui.mediators {
import events.GameEvent;

import flash.events.MouseEvent;

public class ShoppingListMediator {

    private var _list:ShoppingList;
    private var _game:Game;
    private var _toggled:Boolean = false;

    public function ShoppingListMediator(sl:ShoppingList) {
        _game = Game.getInstance();
        _game.addEventListener(GameEvent.EVENT_GAME_STATE_CHANGE, handleGameStateChange)
        _list = sl;
        _list._checkOutBtn.addEventListener(MouseEvent.CLICK, handleCheckout)
        _list._pullOut.addEventListener(MouseEvent.CLICK, toggleList);
        _list.y = Math.round(_list.y);
    }

    private function handleGameStateChange(event:GameEvent):void {
        if(_game.currentState == Game.STATE_CHEKCOUT)
        {
            _toggled = true;
            respondeToToggle();
        }
    }

    private function toggleList(event:MouseEvent):void {
        _toggled = !_toggled;
        respondeToToggle();
    }


    private function respondeToToggle():void
    {
        if(_toggled)
        {
            _list.x = -260;
        }
        else
        {
            _list.x = 0;
        }
    }

    private function handleCheckout(event:MouseEvent):void {
         _game.checkOut();
    }
}
}
