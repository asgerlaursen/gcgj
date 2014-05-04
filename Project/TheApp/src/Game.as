/**
 * Created by asgerlaursen on 03/05/14.
 */
package {
import domain.Health;
import domain.Marked;
import domain.POS;
import domain.Wallet;
import domain.World;
import domain.basket.Basket;
import domain.products.ProductCatalog;
import domain.shopping.ShoppingListImpl;

import events.GameEvent;

import flash.events.EventDispatcher;

[Event (name="initGame" , type="events.GameEvent")]
[Event (name="startGame" , type="events.GameEvent")]
[Event (name="enterShopping" , type="events.GameEvent")]
[Event (name="enterList" , type="events.GameEvent")]
[Event (name="checkoutBasket" , type="events.GameEvent")]
[Event (name="checkoutComplete" , type="events.GameEvent")]
[Event (name="gameStateChange" , type="events.GameEvent")]
[Event (name="notSufficinetFunds" , type="events.GameEvent")]
[Event (name="itemAdded" , type="events.GameEvent")]
[Event (name="basketCleared" , type="events.GameEvent")]
public class Game extends EventDispatcher{

    /*
    STATIC
     */
    private static var _instance:Game;
    private static var _isSingleton:Boolean;


    /*
    STATES:
     */
    public static const STATE_INIT:String = "stateInit";
    public static const STATE_INTRO:String = "stateIntro";
    public static const STATE_LIST:String = "stateList";
    public static const STATE_SHOPPING:String = "stateShopping";
    public static const STATE_CHEKCOUT:String = "stateCheckout";
    public static const STATE_GAMEOVER:String = "stateGameOver";

    /*
    MEMBERS
     */
    public var currentShoppingList:ShoppingListImpl;
    public var basket:Basket = new Basket();
    private var _currentState:String;
    public var currentScene:String;
    public var currentLevel:int = 1;

    public var gameOverMessage:String = "";



    //Domain Models
    public var wallet:Wallet = new Wallet();
    public var health:Health = new Health();
    public var environment:World = new World();
    public var markedPlace:Marked = new Marked();


    // Products
    public var products:ProductCatalog;



    //Point of sale system:
    private var _pos:POS = new POS();

    public function get currentState():String {
        return _currentState;
    }

    public function set currentState(value:String):void {
        _currentState = value;
        dispatchEvent(new GameEvent(GameEvent.EVENT_GAME_STATE_CHANGE));
        if (currentState == STATE_INIT) {
            // Show loading
        }
        else if (currentState == STATE_INTRO) {
            currentShoppingList = new ShoppingListImpl(currentLevel);
            changeScene("intro");
            // Show logo
        }
        else if (currentState == STATE_LIST) {

        }
    }

    public function Game(){
        if(_isSingleton == false)
        {
            throw new Error("You should never call new on this class")
        }


    }

    private function init():void {

        currentState = STATE_INIT;
        // Init Product Catalog
        products = new ProductCatalog();
        basket = new Basket();


    }


    public static function getInstance():Game
    {
        if(_instance == null)
        {
            _isSingleton = true;
            _instance = new Game();
            _isSingleton = false;
            _instance.init();
        }
        return _instance;
    }


    public function gameOver(s:String = ""):void {
        gameOverMessage = "Game Over!\n"+s;
        resetGame();
        dispatchEvent(new GameEvent(GameEvent.EVENT_GAME_OVER));
        currentState = STATE_GAMEOVER;
        changeScene("gameOver");
    }

    public function resetGame():void {
        currentLevel = 1;
        health.index = 1;
        wallet.balance = 100;
        environment.degration = 1;
        changeScene("diari-cooler");
    }

    public function pay() {
        if(_pos.hasSufficientFunds(wallet,basket))
        {
            _pos.calculateWealth(wallet,basket);
            _pos.calculateHealth(health,basket);
            _pos.calculateMarked(markedPlace,basket);
            _pos.calculateEnvironment(environment,basket);
            dispatchEvent(new GameEvent(GameEvent.EVENT_CHECKOUT_COMPLETE));
            basket.clearBasket();
        }
        else
        {
            dispatchEvent(new GameEvent(GameEvent.EVENT_NOT_SUFFICIENT_FUNDS));
        }
    }




    /*
    *
    * GAME FLOW METHODS:
    *____________________________________________________________________________
     */
    public function checkOut():void
    {
        if(basket.getBasketList().length > 0) {
            changeScene("checkOut");
            currentState = STATE_CHEKCOUT;
        }
        else {
            pay();
        }
    }

    public function changeScene(sceneID:String):void {
        currentScene = sceneID;
        dispatchEvent(new GameEvent(GameEvent.EVENT_GAME_SCENE_CHANGE));
    }
}
}
