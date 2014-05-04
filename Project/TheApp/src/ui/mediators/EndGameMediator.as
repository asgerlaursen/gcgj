/**
 * Created by asgerlaursen on 04/05/14.
 */
package ui.mediators {
import events.GameEvent;

import flash.events.MouseEvent;

public class EndGameMediator {

    private var _endScreen:EndScreen;
    private var _game:Game;

    public function EndGameMediator(endGame:EndScreen) {
        _endScreen = endGame;
        _endScreen.visible = false;
        _game = Game.getInstance();
        _game.addEventListener(GameEvent.EVENT_CHECKOUT_COMPLETE, handleCompleteGame);
        _endScreen.addEventListener(MouseEvent.CLICK, handleEndscreenClick);
    }

    private function handleEndscreenClick(event:MouseEvent):void {
        _endScreen.visible = false;
    }

    private function handleCompleteGame(event:GameEvent):void {
        _endScreen.visible = true;
    }
}
}
