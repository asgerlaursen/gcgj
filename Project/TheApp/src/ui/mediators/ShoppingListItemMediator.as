/**
 * Created by asgerlaursen on 03/05/14.
 */
package ui.mediators {
import domain.basket.BasketItem;
import domain.shopping.ShoppingListItemImpl;

import events.GameEvent;

import flash.events.MouseEvent;

public class ShoppingListItemMediator {

    private var _item:ShoppingListItem;
    private var _model:ShoppingListItemImpl;
    private var _game:Game;

    public function ShoppingListItemMediator(item:ShoppingListItem,model:ShoppingListItemImpl) {
        _item = item;
        _model = model;
        _item.addEventListener(MouseEvent.CLICK, handleItemClick);
        _game = Game.getInstance();
        _game.addEventListener(GameEvent.EVENT_ITEM_ADDED, itemAddedHandler)
    }

    private function itemAddedHandler(event:GameEvent):void {
        var shoppingList:Array = _game.currentShoppingList.Items;
        for(var i:int = 0; i < shoppingList.length; i++) {
            var shopListItem:ShoppingListItemImpl = shoppingList[i] as ShoppingListItemImpl;
            var basketList:Array = _game.basket.getItemsForGroup(shopListItem.groupAlias);
            var totalAmount = 0;
            for(var x:int = 0; x < basketList.length; x++) {
                totalAmount += basketList[x].amount;
            }
            if(totalAmount >= shopListItem.requeiredAmounts) {
                shopListItem.itemInBasket = true;
                _game.currentShoppingList.shopListItem.turnItemOn(shopListItem.listItemModel);
            }
            else {
                shopListItem.itemInBasket = false;
                _game.currentShoppingList.shopListItem.turnItemOff(shopListItem.listItemModel);
            }

        }
    }

    private function handleItemClick(event:MouseEvent):void {
        _game.changeScene(_model.scene);
    }
}
}
