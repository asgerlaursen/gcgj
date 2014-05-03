/**
 * Created by asgerlaursen on 03/05/14.
 */
package {
import flash.display.Sprite;
import dk.webyte.util.TestUtil;

import flash.events.MouseEvent;

import ui.GameUI;

public class Main extends Sprite {

    private var game:Game;
    private var gameUI:GameUI;

    public function Main() {
        game = Game.getInstance();
        gameUI = new GameUI();
        addChild(gameUI);
    }

}
}
