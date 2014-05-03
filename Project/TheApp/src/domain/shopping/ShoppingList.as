/**
 * Created by Peter on 03/05/14.
 */
package domain.shopping {
public class ShoppingList {

    public var Items:Array = [];

    public function ShoppingList() {

    }

    public function addItem(groupAlias:String, amount:int):void {
        var found:Boolean = false;
        for(var i:int = 0; i < Items.length; i++) {
            if(Items[i].GroupAlias == groupAlias) {
                found = true;
                Items[i].RequeiredAmounts += amount;
            }
        }
        if(!found) {
            var listItem:ShoppingListItem = new ShoppingListItem();
            listItem.GroupAlias = groupAlias;
            listItem.RequeiredAmounts = amount;
            Items.push(listItem);
        }
    }

    public function clearList():void {
        Items = [];
    }
}
}
