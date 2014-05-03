/**
 * Created by asgerlaursen on 03/05/14.
 */
package ui {
import dk.webyte.util.TestUtil;

import domain.shopping.ShoppingListItemImpl;

import events.GameEvent;

import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.utils.Dictionary;

import ui.mediators.ChromeMediator;

import ui.mediators.ShoppingListItemMediator;
import ui.mediators.ShoppingListMediator;

public class GameUI extends Sprite {

    private var _game:Game;

    //UI Elements:
    private var _init:Sprite;
    private var _intro:Sprite;
    //Game
    private var _chrome:Chrome;
    private var _scene:Sprite;

    public function GameUI() {
        super();
        init();
    }

    private function init():void {
        addEventListener(Event.ADDED_TO_STAGE, handleAddedToStage)
        _game = Game.getInstance();
        _game.addEventListener(GameEvent.EVENT_GAME_STATE_CHANGE, gameStateChangeHandler);
        _game.addEventListener(GameEvent.EVENT_GAME_SCENE_CHANGE,gameSceneChangeHandler)
    }


    private function handleAddedToStage(event:Event):void {
        setupUI();
        updateUIFromGameState();
    }

    private function gameStateChangeHandler(event:GameEvent):void {
        updateUIFromGameState();
    }

    private function gameSceneChangeHandler(event:GameEvent):void {
        //TODO Peter handle scene change
    }

    private function updateUIFromGameState():void {
        var state:String = _game.currentState;
        addChild(_scene);
        addChild(_chrome);
    }

    private function setupUI():void {
        //_init = new Sprite();
        //_intro = new Sprite();
        _chrome = new Chrome();
        new ChromeMediator(_chrome);
        _scene = new Sprite();
        addChild(_scene);
        addChild(_chrome);
        dummyList();





        _scene = new Sprite();
    }

    private function dummyList():void {
        var y:int = 0;
        var currentList:Array = _game.currentShoppingList.Items;
        var sl:ShoppingList = _chrome.getChildByName("_orderList") as ShoppingList;
        new ShoppingListMediator(sl);
        for each(var i:ShoppingListItemImpl in currentList)
        {
            var si:ShoppingListItem = sl.addItem(i.groupAlias) as ShoppingListItem;
            new ShoppingListItemMediator(si,i);
        }
    }



}
}
