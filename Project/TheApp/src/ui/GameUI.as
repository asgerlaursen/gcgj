/**
 * Created by asgerlaursen on 03/05/14.
 */
package ui {
import dk.webyte.util.TestUtil;

import domain.basket.BasketItem;
import domain.shopping.ShoppingListItemImpl;
import events.GameEvent;
import flash.display.Sprite;
import flash.events.DataEvent;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.text.TextField;
import flash.utils.Dictionary;

import ui.mediators.ChromeMediator;
import ui.mediators.EndGameMediator;
import ui.mediators.PopUpMediator;

import ui.mediators.ShoppingListItemMediator;
import ui.mediators.ShoppingListMediator;

public class GameUI extends Sprite {

    private var _game:Game;

    //UI Elements:
    private var _init:Sprite;
    private var _intro:Sprite;
    //Game
    private var _chrome:Chrome;
    private var _scene:Scenes;
    private var _popUp:Popup;

    public function GameUI() {
        super();
        init();
    }

    private function init():void {
        addEventListener(Event.ADDED_TO_STAGE, handleAddedToStage)
        _game = Game.getInstance();
        _game.addEventListener(GameEvent.EVENT_GAME_STATE_CHANGE, gameStateChangeHandler);
        _game.addEventListener(GameEvent.EVENT_GAME_SCENE_CHANGE,gameSceneChangeHandler);
        _game.addEventListener(GameEvent.EVENT_NEW_LEVEL, gameLevelChangeHandler);
    }

    private function gameLevelChangeHandler(event:GameEvent):void {
        _chrome._lvl.text = _game.currentLevel.toString();
    }


    private function handleAddedToStage(event:Event):void {
        setupUI();
        updateUIFromGameState();
    }

    private function gameStateChangeHandler(event:GameEvent):void {
        updateUIFromGameState();
    }

    private function gameSceneChangeHandler(event:GameEvent):void {
        clearScene();
        _scene.gotoAndStop(_game.currentScene);
        if(_game.currentScene == "intro") {
            _scene.addEventListener(MouseEvent.CLICK, onIntroClick);
        }
        else if(_game.currentScene == "checkout") {
            _chrome.visible = true;
        }
        else if(_game.currentScene == "gameOver") {
            _chrome.visible = false;
            trace(_scene.gameOver); //.text = _game.gameOverMessage;
            _scene.gameOver._msg.text = _game.gameOverMessage;
            _scene.gameOver.addEventListener(MouseEvent.CLICK, onGameOverClick);

        }
        else {
            _scene.addEventListener(DataEvent.DATA, onProductClick);
            _chrome.visible = true;
            var productsForScene:Array = _game.products.getProductsForScene(_game.currentScene);
            for(var i:int = 0; i < productsForScene.length; i++) {
                var priceText:TextField = _scene["scene_" + _game.currentScene.replace("-", "_")]["pricetag_"+ productsForScene[i].id].priceText as TextField;
                if(priceText != null) {
                    priceText.text = productsForScene[i].price + " KR";
                }

            }
        }
        /*
        else if(_game.currentScene == "diari-cooler") {
            _scene.addEventListener(DataEvent.DATA, onProductClick);
            _chrome.visible = true;
        }
        else if(_game.currentScene == "processed") {
            _chrome.visible = true;

        }
        else if(_game.currentScene == "fruit-green") {
            _chrome.visible = true;
        }
        */
    }

    private function onGameOverClick(event:MouseEvent):void {
        _scene.gameOver.removeEventListener(MouseEvent.CLICK, onGameOverClick);
        _game.resetGame();
        _game.currentState = Game.STATE_LIST;
    }

    private function clearScene() {
        _scene.removeEventListener(DataEvent.DATA, onProductClick);
    }

    private function onIntroClick(event:MouseEvent):void {
        _game.currentState = Game.STATE_LIST;
        _game.changeScene("diari-cooler");
        _scene.removeEventListener(MouseEvent.CLICK, onIntroClick);
    }

    private function onProductClick(event:DataEvent):void {
        var prodId:String = event.data;
        var prod:BasketItem = _game.products.getProduct(prodId);
        if(prod != null) {
            _game.basket.addItem(prod);
        }
        else {
            throw new Error("Couldn't find product");
        }

    }

    private function updateUIFromGameState():void {
        var state:String = _game.currentState;
        if(state == Game.STATE_INIT) {
            // Show loading
        }
        else if(state == Game.STATE_INTRO) {
            //
        }
        else if(state == Game.STATE_LIST) {
            //addChild(_scene);
            //addChild(_chrome);
            dummyList();
        }
        else if(state == Game.STATE_CHEKCOUT) {
            _scene.checkOut._display.text = _game.basket.totalPrice + " Kr";
            _scene.checkOut._callToAction.addEventListener(MouseEvent.CLICK, onCallToActionClick);
        }
    }

    private function onCallToActionClick(event:MouseEvent):void {
        _game.pay();

    }

    private function setupUI():void {
        //_init = new Sprite();
        //_intro = new Sprite();
        _chrome = new Chrome();
        new ChromeMediator(_chrome);
        _chrome.visible = false;
        _chrome._lvl.text = "1";
        _scene = new Scenes();
        _popUp = new Popup();
        var endGame:EndScreen = new EndScreen();

        new PopUpMediator(_popUp);

        new EndGameMediator(endGame);

        addChild(_scene);
        addChild(_chrome);
        addChild(_popUp);
        addChild(endGame);

    }

    private function dummyList():void {
        var y:int = 0;
        var currentList:Array = _game.currentShoppingList.Items;
        var sl:ShoppingList = _chrome.getChildByName("_orderList") as ShoppingList;
        _game.currentShoppingList.shopListItem = sl;
        new ShoppingListMediator(sl);
        sl.clearList();

        for each(var i:ShoppingListItemImpl in currentList)
        {
            var si:ShoppingListItem = sl.addItem(i.label) as ShoppingListItem;
            trace(i.label);
            i.listItemModel = si;
            new ShoppingListItemMediator(si,i);
        }




    }



}
}
