/**
 * Created by Peter on 03/05/14.
 */
package domain.products {
public class ProductCatalog {

    private var productArr:Array = [{"ID":"1","Group":"milk","Name":"Just Milk","Price":"5","Amount":"1","Stock":"10","Fair":"-2","Health":"-0.5","Eco":"-2","Quantifier":"liter","ConsumerRate":"","Expire":"1","Scene":"diari-cooler","id":0},{"ID":"2","Group":"milk","Name":"Eco Giant Milk","Price":"7","Amount":"1","Stock":"6","Fair":"2","Health":"0.5","Eco":"0","Quantifier":"liter","ConsumerRate":"","Expire":"1","Scene":"diari-cooler","id":1},{"ID":"3","Group":"milk","Name":"Eco Local Milk","Price":"9","Amount":"1","Stock":"3","Fair":"5","Health":"0.5","Eco":"0","Quantifier":"liter","ConsumerRate":"","Expire":"1","Scene":"diari-cooler","id":2},{"ID":"4","Group":"egg","Name":"Just Eggs","Price":"20","Amount":"12","Stock":"10","Fair":"-4","Health":"-3","Eco":"-2","Quantifier":"stk","ConsumerRate":"","Expire":"1","Scene":"diari-cooler","id":3},{"ID":"5","Group":"egg","Name":"Local Eggs","Price":"28","Amount":"12","Stock":"7","Fair":"-1","Health":"-3","Eco":"0","Quantifier":"stk","ConsumerRate":"","Expire":"1","Scene":"diari-cooler","id":4},{"ID":"6","Group":"egg","Name":"Eco Eggs","Price":"30","Amount":"10","Stock":"5","Fair":"3","Health":"1","Eco":"0","Quantifier":"stk","ConsumerRate":"","Expire":"1","Scene":"diari-cooler","id":5},{"ID":"7","Group":"butter","Name":"Just Butter","Price":"5","Amount":"1","Stock":"10","Fair":"-2","Health":"-0.5","Eco":"-2","Quantifier":"gram","ConsumerRate":"","Expire":"1","Scene":"diari-cooler","id":6},{"ID":"8","Group":"butter","Name":"Eco Giant Butter","Price":"7","Amount":"1","Stock":"6","Fair":"2","Health":"0.5","Eco":"0","Quantifier":"gram","ConsumerRate":"","Expire":"1","Scene":"diari-cooler","id":7},{"ID":"9","Group":"butter","Name":"Eco Local Butter","Price":"9","Amount":"1","Stock":"3","Fair":"5","Health":"0.5","Eco":"0","Quantifier":"gram","ConsumerRate":"","Expire":"1","Scene":"diari-cooler","id":8},{"ID":"10","Group":"coffee","Name":"Just Coffee","Price":"18.5","Amount":"500","Stock":"10","Fair":"-4","Health":"-2","Eco":"-4","Quantifier":"gram","ConsumerRate":"","Expire":"0","Scene":"processed","id":9},{"ID":"11","Group":"coffee","Name":"Eco Coffee","Price":"40","Amount":"400","Stock":"7","Fair":"0","Health":"-1","Eco":"0","Quantifier":"gram","ConsumerRate":"","Expire":"0","Scene":"processed","id":10},{"ID":"12","Group":"coffee","Name":"Eco Fair Coffee","Price":"52","Amount":"400","Stock":"5","Fair":"4","Health":"-1","Eco":"0","Quantifier":"gram","ConsumerRate":"","Expire":"0","Scene":"processed","id":11},{"ID":"13","Group":"chocolate","Name":"Just Chocolate","Price":"10","Amount":"200","Stock":"10","Fair":"-4","Health":"-3","Eco":"-4","Quantifier":"gram","ConsumerRate":"","Expire":"0","Scene":"processed","id":12},{"ID":"14","Group":"chocolate","Name":"Eco Chocolate","Price":"15","Amount":"150","Stock":"7","Fair":"0","Health":"-2","Eco":"0","Quantifier":"gram","ConsumerRate":"","Expire":"0","Scene":"processed","id":13},{"ID":"15","Group":"chocolate","Name":"Eco Fair Chocolate","Price":"22","Amount":"150","Stock":"5","Fair":"4","Health":"-2","Eco":"0","Quantifier":"gram","ConsumerRate":"","Expire":"0","Scene":"processed","id":14},{"ID":"16","Group":"banana","Name":"Just Bananas","Price":"10","Amount":"10","Stock":"10","Fair":"-4","Health":"-1","Eco":"-3.5","Quantifier":"stk","ConsumerRate":"","Expire":"1","Scene":"fruit-green","id":15},{"ID":"17","Group":"banana","Name":"Eco Bananas","Price":"15","Amount":"6","Stock":"7","Fair":"0","Health":"1","Eco":"0","Quantifier":"stk","ConsumerRate":"","Expire":"1","Scene":"fruit-green","id":16},{"ID":"18","Group":"banana","Name":"Eco Fair Bananas","Price":"20","Amount":"5","Stock":"5","Fair":"3","Health":"1","Eco":"0","Quantifier":"stk","ConsumerRate":"","Expire":"1","Scene":"fruit-green","id":17},{"ID":"19","Group":"lettuce","Name":"Giant Lettuce","Price":"10","Amount":"1","Stock":"10","Fair":"0","Health":"-1.5","Eco":"-2.5","Quantifier":"stk","ConsumerRate":"","Expire":"1","Scene":"fruit-green","id":18},{"ID":"20","Group":"lettuce","Name":"Eco Local Lettuce","Price":"18","Amount":"1","Stock":"5","Fair":"3","Health":"2.5","Eco":"0","Quantifier":"stk","ConsumerRate":"","Expire":"1","Scene":"fruit-green","id":19}];
    private var productsList:Array = [];

    public function ProductCatalog() {
        for(var i:int = 0; i < productArr.length; i++) {
            var _prod:Object = productArr[i];
            if(_prod.Name != "") {
                var prod:Product = new Product();
                prod.id = _prod.ID;
                prod.group = _prod.Group;
                prod.name = _prod.Name;
                prod.price = Number(_prod.Price);
                prod.amount = int(_prod.Amount);
                prod.stock = int(_prod.Stock);
                prod.fairness = Number(_prod.Fair);
                prod.health= Number(_prod.Health);
                prod.environment = Number(_prod.Eco);
                prod.quantifier = _prod.Quantifier;
                prod.consumerRate = Number(_prod.ConsumerRate);
                prod.expire = _prod.Expire;
                prod.scene = _prod.Scene;
                productsList.push(prod);

            }
        }
    }

    public function getProductsForScene(_scene:String):Array {
        var returnArr:Array = [];
        for(var i:int = 0; i < productsList.length; i++) {
           if(productsList[i].scene == _scene) {
               returnArr.push(productsList[i]);
           }
        }
        return returnArr;
    }

    public function getProductsForGroup(_group:String):Array {
        var returnArr:Array = [];
        for(var i:int = 0; i < productsList.length; i++) {
            if(productsList[i].group == _group) {
                returnArr.push(productsList[i]);
            }
        }
        return returnArr;
    }

    public function getProduct(_id:String):Product {
        for(var i:int = 0; i < productsList.length; i++) {
            if(productsList[i].id == _id) {
                return productsList[i];
            }
        }
        return new Product();
    }
}
}
