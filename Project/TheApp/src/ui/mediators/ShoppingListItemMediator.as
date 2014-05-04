/**
 * Created by asgerlaursen on 03/05/14.
 */
package ui.mediators {
import domain.shopping.ShoppingListItemImpl;

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
    }

    private function handleItemClick(event:MouseEvent):void {
        _game.changeScene(_model.scene);
    }
}
}
