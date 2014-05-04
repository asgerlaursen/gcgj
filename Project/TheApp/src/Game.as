/**
 * Created by asgerlaursen on 03/05/14.
 */
package {
import dk.webyte.util.TestUtil;

import domain.basket.Basket;
import events.GameEvent;
import flash.events.EventDispatcher;
import domain.products.ProductCatalog;
import flash.geom.Point;
import domain.Health;
import domain.Marked;
import domain.POS;
import domain.shopping.ShoppingListImpl;
import domain.Wallet;
import domain.World;

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

    public function gameOver():void {
        //resetGame();
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






    /*
    *
    * GAME FLOW METHODS:
    *____________________________________________________________________________
     */
    public function checkOut():void
    {
        if(_pos.hasSufficientFunds(wallet,basket))
        {
            _pos.calculateWealth(wallet,basket);
            _pos.calculateHealth(health,basket);
            _pos.calculateMarked(markedPlace,basket);
            _pos.calculateEnvironment(environment,basket);
            basket.clearBasket();
            dispatchEvent(new GameEvent(GameEvent.EVENT_CHECKOUT_COMPLETE));
        }
        else
        {
            dispatchEvent(new GameEvent(GameEvent.EVENT_NOT_SUFFICIENT_FUNDS));
        }

        //Do we have funding=
        //if not - stop here and tell the world
        //if so - calculate:
        //money
        //reward:
            //money
            //health
            //environment
        //Marked:
            // Stock
            // Prices
            // Availability


    }

    public function changeScene(sceneID:String):void {
        currentScene = sceneID;
        dispatchEvent(new GameEvent(GameEvent.EVENT_GAME_SCENE_CHANGE));
    }
}
}
