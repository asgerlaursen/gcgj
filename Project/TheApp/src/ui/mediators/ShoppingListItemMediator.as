/**
 * Created by asgerlaursen on 03/05/14.
 */
package ui.mediators {
import flash.events.MouseEvent;

public class ShoppingListItemMediator {

    private var _item:ShoppingListItem;

    public function ShoppingListItemMediator(item:ShoppingListItem) {
        _item = item;
        _item.addEventListener(MouseEvent.CLICK, handleItemClick);
    }

    private function handleItemClick(event:MouseEvent):void {
        trace("Click from meditator")
        //add open scene
    }
}
}
