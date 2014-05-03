/**
 * Created by asgerlaursen on 03/05/14.
 */
package {
import basket.Basket;

import shopping.ShoppingList;

import user.User;

public class Game {

    /*
    STATIC
     */
    private static const _instance:Game;
    private static const _isSingleton:Boolean;

    public static const STATE_INIT:String = "stateInit";
    public static const STATE_INTRO:String = "stateIntro";
    public static const STATE_SHOPPING:String = "stateShopping";

    /*
    MEMBERS
     */
    public var user:User;
    public var currentShoppingList:ShoppingList;
    public var basket:Basket;
    public var currentState:String;
    public var currentScene:String;


    public function Game(){
        if(_isSingleton == false)
        {
            throw new Error("You should never call new on this class")
        }
    }

    public static  function getInstance():Game
    {
        if(_instance == null)
        {
            _isSingleton = true;
            _instance = new Game();
            _isSingleton = false;
        }
        return _instance;
    }
}
}
