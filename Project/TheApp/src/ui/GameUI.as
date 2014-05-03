/**
 * Created by asgerlaursen on 03/05/14.
 */
package ui {
import flash.display.Sprite;
import flash.utils.Dictionary;

public class GameUI extends Sprite {

    private var _game:Game;

    public function GameUI() {
        super();
        init();
    }


    private function init():void {
        _game = Game.getInstance();
    }


}
}
