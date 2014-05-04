/**
 * Created by Peter on 03/05/14.
 */
package domain.shopping {
import domain.basket.BasketItem;
import domain.products.ProductCatalog;
import Game;

public class ShoppingListItemImpl {
    public var groupAlias:String;
    public var itemInBasket:Boolean = false;
    public var requeiredAmounts:int;
    public var label:String;
    public var scene:String;

    public function ShoppingListItemImpl(_alias:String, _amount:int) {
        groupAlias = _alias;
        requeiredAmounts = _amount;
        createLabel();
        scene = createScene();
    }

    private function createScene():String {
        var prod:BasketItem =  Game.getInstance().products.getProductsForGroup(groupAlias)[0];
        return prod.scene;
    }

    private function createLabel():void {
        var prod:BasketItem =  Game.getInstance().products.getProductsForGroup(groupAlias)[0];
        trace(prod);
        if(prod != null) {
            if (groupAlias == "milk") {
                label = requeiredAmounts.toString() + " " + prod.quantifier + " milk";
            }
            else if (groupAlias == "egg") {
                label = requeiredAmounts.toString() + " " + prod.quantifier + " egg" + ((requeiredAmounts > 1) ? "s" : "");
            }
            else if (groupAlias == "butter") {
                label = requeiredAmounts.toString() + " " + prod.quantifier + " of butter";
            }
            else if (groupAlias == "coffee") {
                label = requeiredAmounts.toString() + " " + prod.quantifier + " coffee";
            }
            else if (groupAlias == "chocolate") {
                label = requeiredAmounts.toString() + " " + prod.quantifier + " chocolate";
            }
            else if (groupAlias == "banana") {
                label = requeiredAmounts.toString() + " " + prod.quantifier + " banan" + ((requeiredAmounts > 1) ? "as" : "a");
            }
            else if (groupAlias == "lettuce") {
                label = requeiredAmounts.toString() + " " + prod.quantifier + " lettuce";
            }
            trace(label);
        }
        else {
            trace("prod = null");
        }
    }
}
}
