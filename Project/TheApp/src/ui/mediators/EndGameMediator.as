/**
 * Created by asgerlaursen on 04/05/14.
 */
package ui.mediators {
import domain.basket.BasketItem;
import domain.products.ProductCatalog;
import domain.shopping.ShoppingListItemImpl;

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
        var price:Number = 0;
        var list:Array = _game.currentShoppingList.Items;
        var pc:ProductCatalog = _game.products;

        for each(var i:ShoppingListItemImpl in list)
        {
            if(i.itemInBasket)
            {
                var pList:Array = pc.getProductsForGroup(i.groupAlias);
                var ava:Number = 0;
                for each(var p:BasketItem in pList)
                {
                    ava += p.price;
                }
                price += ava/pList.length;

            }
        }
        _game.wallet.deposit(price);
        _game.dispatchEvent(new GameEvent(GameEvent.EVENT_UPDATE_CHROME));

    }
}
}
