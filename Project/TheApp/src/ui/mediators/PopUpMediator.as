/**
 * Created by asgerlaursen on 04/05/14.
 */
package ui.mediators {
import events.GameEvent;

import flash.events.MouseEvent;

public class PopUpMediator {

    private var _popUp:Popup;
    private var _game:Game;

    public function PopUpMediator(popUp:Popup) {
        _popUp = popUp;
        _popUp.visible = false;
        _popUp._btn.addEventListener(MouseEvent.CLICK, handlePopUpClose);
        _game = Game.getInstance();
        _game.addEventListener(GameEvent.EVENT_NOT_SUFFICIENT_FUNDS, handleNotSufficientFunds);
    }

    private function handleNotSufficientFunds(event:GameEvent):void {
        var msg:String ="Not Sufficient Funds!\n You do not have sufficient funding to proceed with the checkout.\nPlease ajust your shopping to your fundings."
        showPopUp(msg);
    }

    private function handlePopUpClose(event:MouseEvent):void {
        _popUp.visible = false;
    }
    
    private function showPopUp(message:String):void
    {
        _popUp.visible = true;
        _popUp._msg.text = message;
    }
}
}
