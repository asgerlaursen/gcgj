/**
 * Created by Peter on 03/05/14.
 */
package domain.shopping {
import domain.products.Product;
import domain.products.ProductCatalog;
import Game;

public class ShoppingListItem {
    public var groupAlias:String;
    public var itemInBasket:Boolean = false;
    public var requeiredAmounts:int;
    public var label:String;

    public function ShoppingListItem(_alias:String, _amount:int) {
        groupAlias = _alias;
        requeiredAmounts = _amount;
        createLabel();
    }

    private function createLabel():void {
        var prod:Product =  Game.getInstance().products.getProductsForGroup(groupAlias)[0];
        if(groupAlias == "milk") {
            label = requeiredAmounts.toString() + " " + prod.quantifier + " mælk";
        }
        else if(groupAlias == "æg") {
            label = requeiredAmounts.toString() + " " + prod.quantifier + " æg";
        }
        else if(groupAlias == "butter") {
            label = requeiredAmounts.toString() + " " + prod.quantifier + " smør";
        }
        else if(groupAlias == "coffee") {
            label = requeiredAmounts.toString() + " " + prod.quantifier + " kaffe";
        }
        else if(groupAlias == "chocolate") {
            label = requeiredAmounts.toString() + " " + prod.quantifier + " chokolade";
        }
        else if(groupAlias == "banana") {
            label = requeiredAmounts.toString() + " " + prod.quantifier + " banan" + ((requeiredAmounts > 1) ? "er" : "");
        }
        else if(groupAlias == "lettuce") {
            label = requeiredAmounts.toString() + " " + prod.quantifier + " salat";
        }

    }
}
}
