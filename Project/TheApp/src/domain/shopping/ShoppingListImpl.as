/**
 * Created by Peter on 03/05/14.
 */
package domain.shopping {
public class ShoppingListImpl {

    public var Items:Array = [];
    private var groupAliasArr = [
        "milk",      // 0
        "egg",       // 1
        "butter",    // 2
        "coffee",    // 3
        "chocolate", // 4
        "banana",    // 5
        "lettuce"    // 6
    ];


    public function ShoppingListImpl(level:int) {
        if(level == 1) {
            addItem(groupAliasArr[0], 2);
            addItem(groupAliasArr[3], 400);
            addItem(groupAliasArr[5], 3);
            addItem(groupAliasArr[1], 10);
        }
    }

    private function addItem(groupAlias:String, amount:int):void {
        var found:Boolean = false;
        for(var i:int = 0; i < Items.length; i++) {
            if(Items[i].groupAlias == groupAlias) {
                found = true;
                Items[i].requeiredAmounts += amount;
            }
        }
        if(!found) {
            var listItem:ShoppingListItemImpl = new ShoppingListItemImpl(groupAlias, amount);
            Items.push(listItem);
        }
    }

    public function clearList():void {
        Items = [];
    }
}
}
