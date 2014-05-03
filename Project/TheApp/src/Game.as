/**
 * Created by asgerlaursen on 03/05/14.
 */
package {
import domain.basket.Basket;
import domain.products.ProductCatalog;
import flash.geom.Point;
import domain.Health;
import domain.Marked;
import domain.POS;
import domain.shopping.ShoppingList;
import domain.Wallet;
import domain.World;

public class Game {

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

    /*
    EVENTS
     */
    public static const EVENT_NOT_SUFFICIENT_FUNDS:String = "notSufficientFunds";


    /*
    MEMBERS
     */
    public var currentShoppingList:ShoppingList;
    public var basket:Basket;
    public var currentState:String;
    public var currentScene:String;

    //Domain Models
    public var wallet:Wallet;
    public var healt:Health;
    public var environment:World
    public var markedPlace:Marked;


    // Products
    public var products:ProductCatalog;



    //Point of sale system:
    private var _pos:POS;



    public function Game(){
        if(_isSingleton == false)
        {
            throw new Error("You should never call new on this class")
        }

        products = new ProductCatalog();

    }

    public static function getInstance():Game
    {
        if(_instance == null)
        {
            _isSingleton = true;
            _instance = new Game();
            _isSingleton = false;
        }
        return _instance;
    }






    /*
    *
    * GAME FLOW METHODS:
    *____________________________________________________________________________
     */
    public function checkOut():void
    {
        _pos.calculateWealth(wallet,basket);
        _pos.calculateHealth(healt,basket);
        _pos.calculateMarked(markedPlace,basket);
        _pos.calculateEnvironment(environment,basket);


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




}
}
