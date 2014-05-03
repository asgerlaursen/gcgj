/**
 * Created by asgerlaursen on 03/05/14.
 */
package ui {
import dk.webyte.util.TestUtil;

import events.GameEvent;

import flash.display.Sprite;
import flash.events.Event;
import flash.utils.Dictionary;

public class GameUI extends Sprite {

    private var _game:Game;

    //UI Elements:
    private var _init:Sprite;
    private var _intro:Sprite;
    //Game
    private var _chrome:Sprite;
    private var _scene:Sprite;

    public function GameUI() {
        super();
        init();
    }

    private function init():void {
        addEventListener(Event.ADDED_TO_STAGE, handleAddedToStage)
        _game = Game.getInstance();
        _game.addEventListener(GameEvent.EVENT_GAME_STATE_CHANGE, gameStateChangeHandler);
    }

    private function handleAddedToStage(event:Event):void {
        setupUI();
        updateUIFromGameState();
    }

    private function gameStateChangeHandler(event:GameEvent):void {
        updateUIFromGameState();
    }

    private function updateUIFromGameState():void {
        var state:String = _game.currentState;
        addChild(_scene);
        addChild(_chrome);
    }

    private function setupUI():void {
        //_init = new Sprite();
        //_intro = new Sprite();
        _chrome = new Sprite();
        _chrome.addChild(TestUtil.createButton("Jeg er chrome"));
        _scene = new Sprite();
    }



}
}
