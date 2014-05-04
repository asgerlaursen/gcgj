/**
 * Created by asgerlaursen on 04/05/14.
 */
package ui.mediators {
import domain.basket.BasketItem;

import events.GameEvent;

import flash.display.MovieClip;

import flash.display.Sprite;

public class BasketMediator
{
    private var _basketUI:Sprite;
    private var _game:Game;
    private var _scaleFactor:Number;

    private var _uiList:Array = [];

    private var _basketUIList:Array;

    public function BasketMediator() {
        _game = Game.getInstance();
        _game.addEventListener(GameEvent.EVENT_BASKET_CLEARED, handleBasketCleared);
        _game.addEventListener(GameEvent.EVENT_ITEM_ADDED, handleItemAdded);

        _basketUIList = [
                Product_1,
                Product_2,
                Product_3,
                Product_4,
                Product_5,
                Product_6,
                Product_7,
                Product_8,
                Product_9,
                Product_10,
                Product_11,
                Product_12,
                Product_13,
                Product_14,
                Product_15,
                Product_16,
                Product_17,
                Product_18,
                Product_19,
                Product_20
        ];


    }

    private function handleItemAdded(event:GameEvent):void {
        removeAll();
        buildBasket();
    }

    private function buildBasket():void {
        var basketList:Array = _game.basket.getBasketList();
        var x:int = 5;
        var y:int = 5;
        var m:int = 5;
        var my:int = 20;
        var mx:int = 300;

        for each(var i:BasketItem in basketList)
        {
            var C:Class = _basketUIList[i.id+1] as Class;
            var item:MovieClip = new C();
            if((x + item.x + m ) > mx)
            {
                x = 0;
                y += 20;
            }
            item.x = x;
            item.y = y;

            x += item.x +m;
        }

    }

    private function handleBasketCleared(event:GameEvent):void {
        removeAll();
    }

    private function removeAll():void
    {
        for each(var i:MovieClip in _uiList)
        {
            _basketUI.removeChild(i);
        }
    }
}
}
