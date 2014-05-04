/**
 * Created by asgerlaursen on 04/05/14.
 */
package ui.mediators {
import events.GameEvent;

public class ChromeMediator {

    private var _game:Game;
    private var _chrome:Chrome;

    public function ChromeMediator(chrome:Chrome) {
        _chrome = chrome;
        new BasketMediator(_chrome._basket,_chrome._basketCount,_chrome._basketUI)
        _game = Game.getInstance();
        _game.addEventListener(GameEvent.EVENT_CHECKOUT_COMPLETE, handleCheckoutComplete);
        _game.addEventListener(GameEvent.EVENT_GAME_OVER, handleGameOverHandler);
        updateChrome();

    }

    private function handleGameOverHandler(event:GameEvent):void {
       updateChrome();
    }

    private function handleCheckoutComplete(event:GameEvent):void {
       updateChrome();
    }

    private function updateChrome():void
    {
        _chrome._earth.gotoAndStop(_game.environment.degration);
        _chrome._health["_bar"].scaleX = _game.health.index;
        _chrome._money.text = String(_game.wallet.balance) + " DKR";
    }

}
}
