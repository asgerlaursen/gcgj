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
    public var shopListItem:ShoppingList;


    public function ShoppingListImpl(level:int) {
        if(level == 1) {
            addItem(groupAliasArr[0], 2);
            addItem(groupAliasArr[3], 1);
            addItem(groupAliasArr[5], 1);
            addItem(groupAliasArr[1], 1);
        }
        else if(level == 2) {
            addItem(groupAliasArr[2], 2);
            addItem(groupAliasArr[4], 2);
            addItem(groupAliasArr[6], 2);
            addItem(groupAliasArr[1], 1);
        }
        else if(level == 3) {
            addItem(groupAliasArr[0], 1);
            addItem(groupAliasArr[3], 1);
            addItem(groupAliasArr[2], 1);
            addItem(groupAliasArr[6], 1);
            addItem(groupAliasArr[5], 1);
            addItem(groupAliasArr[4], 1);
        }
        else if(level == 4) {
            addItem(groupAliasArr[0], 2);
            addItem(groupAliasArr[3], 1);
            addItem(groupAliasArr[5], 1);
            addItem(groupAliasArr[1], 1);
        }
        else if(level == 5) {
            addItem(groupAliasArr[2], 2);
            addItem(groupAliasArr[4], 2);
            addItem(groupAliasArr[6], 2);
            addItem(groupAliasArr[1], 1);
        }
        else if(level == 6) {
            addItem(groupAliasArr[0], 1);
            addItem(groupAliasArr[3], 1);
            addItem(groupAliasArr[2], 1);
            addItem(groupAliasArr[6], 1);
            addItem(groupAliasArr[5], 1);
            addItem(groupAliasArr[4], 1);
        }
        else if(level == 7) {
            addItem(groupAliasArr[0], 2);
            addItem(groupAliasArr[3], 1);
            addItem(groupAliasArr[5], 1);
            addItem(groupAliasArr[1], 1);
        }
        else if(level == 8) {
            addItem(groupAliasArr[2], 2);
            addItem(groupAliasArr[4], 2);
            addItem(groupAliasArr[6], 2);
            addItem(groupAliasArr[1], 1);
        }
        else if(level == 9) {
            addItem(groupAliasArr[0], 1);
            addItem(groupAliasArr[3], 1);
            addItem(groupAliasArr[2], 1);
            addItem(groupAliasArr[6], 1);
            addItem(groupAliasArr[5], 1);
            addItem(groupAliasArr[4], 1);
        }
        else if(level == 10) {
            addItem(groupAliasArr[0], 2);
            addItem(groupAliasArr[3], 1);
            addItem(groupAliasArr[5], 1);
            addItem(groupAliasArr[1], 1);
        }
        else if(level == 11) {
            addItem(groupAliasArr[2], 2);
            addItem(groupAliasArr[4], 2);
            addItem(groupAliasArr[6], 2);
            addItem(groupAliasArr[1], 1);
        }
        else if(level == 12) {
            addItem(groupAliasArr[0], 1);
            addItem(groupAliasArr[3], 1);
            addItem(groupAliasArr[2], 1);
            addItem(groupAliasArr[6], 1);
            addItem(groupAliasArr[5], 1);
            addItem(groupAliasArr[4], 1);
        }
        else if(level == 13) {
            addItem(groupAliasArr[0], 2);
            addItem(groupAliasArr[3], 1);
            addItem(groupAliasArr[5], 1);
            addItem(groupAliasArr[1], 1);
        }
        else if(level == 14) {
            addItem(groupAliasArr[2], 2);
            addItem(groupAliasArr[4], 2);
            addItem(groupAliasArr[6], 2);
            addItem(groupAliasArr[1], 1);
        }
        else if(level == 15) {
            addItem(groupAliasArr[0], 1);
            addItem(groupAliasArr[3], 1);
            addItem(groupAliasArr[2], 1);
            addItem(groupAliasArr[6], 1);
            addItem(groupAliasArr[5], 1);
            addItem(groupAliasArr[4], 1);
        }
        else if(level == 16) {
            addItem(groupAliasArr[0], 2);
            addItem(groupAliasArr[3], 1);
            addItem(groupAliasArr[5], 1);
            addItem(groupAliasArr[1], 1);
        }
        else if(level == 17) {
            addItem(groupAliasArr[2], 2);
            addItem(groupAliasArr[4], 2);
            addItem(groupAliasArr[6], 2);
            addItem(groupAliasArr[1], 1);
        }
        else if(level == 18) {
            addItem(groupAliasArr[0], 1);
            addItem(groupAliasArr[3], 1);
            addItem(groupAliasArr[2], 1);
            addItem(groupAliasArr[6], 1);
            addItem(groupAliasArr[5], 1);
            addItem(groupAliasArr[4], 1);
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

    public function getItemsForGroup(_group:String):Array {
        var returnArr:Array = [];
        for(var i:int = 0; i < Items.length; i++) {
            if(Items[i].groupAlias == _group) {
                returnArr.push(Items[i]);
            }
        }
        return returnArr;
    }

    public function clearList():void {
        Items = [];
    }
}
}
