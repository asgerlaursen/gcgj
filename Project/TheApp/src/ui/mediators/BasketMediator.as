/**
 * Created by asgerlaursen on 04/05/14.
 */
package ui.mediators {
import domain.basket.BasketItem;

import events.GameEvent;

import flash.display.MovieClip;
import flash.display.Sprite;
import flash.events.MouseEvent;

public class BasketMediator
{
    private var _game:Game;
    private var _scaleFactor:Number;

    private var _uiList:Array = [];

    private var _basketUIList:Array;
    private var _basketClearBtn:MovieClip;
    private var _basketPopUp:MovieClip;
    private var _basketCounter:MovieClip;
    private var _basketBtn:MovieClip;
    private var _basketClose:MovieClip;

    public function BasketMediator(basket:MovieClip, basketCount:MovieClip, basketUI:MovieClip) {
        _basketBtn = basket;
        _basketBtn.addEventListener(MouseEvent.CLICK, handleBasketClick)
        _basketCounter = basketCount;
        updateCounter();
        _basketPopUp = basketUI;
        _basketPopUp.visible = false;
        _basketClearBtn = basketUI["_clearBtn"];
        _basketClose = basketUI["_close"];
        _basketClose.addEventListener(MouseEvent.CLICK, handleBasketClick)
        _basketClearBtn.addEventListener(MouseEvent.CLICK, handleClearBasket)
        
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

    private function handleClearBasket(event:MouseEvent):void {
       _game.basket.clearBasket();
        removeAll();
        updateCounter();
    }

    private function handleBasketClick(event:MouseEvent):void {
        _basketPopUp.visible = !_basketPopUp.visible;
    }

    private function handleItemAdded(event:GameEvent):void {
        removeAll();
        buildBasket();
    }

    private function buildBasket():void {
        var basketList:Array = _game.basket.getBasketList();
        _uiList = [];
        var x:int = 5;
        var y:int = 5;
        var m:int = 2;
        var my:int = 80;
        var mx:int = _basketPopUp.width;

        for each(var i:BasketItem in basketList)
        {
            var id:int = Number(i.id)-1;
            var C:Class = _basketUIList[id] as Class;
            var item:MovieClip = new C();
            item.scaleX = item.scaleY = 0.3;
            if((x + item.width + m ) > mx)
            {
                x = 0;
                y += my;
            }
            item.x = x;
            item.y = y;

            x += item.width +m;
            _basketPopUp["_items"].addChild(item);
            _uiList.push(item);
        }
        updateCounter();
    }

    private function updateCounter():void
    {
        _basketCounter["_label"].text = String(_uiList.length);
    }

    private function handleBasketCleared(event:GameEvent):void {
        removeAll();
        updateCounter();
    }

    private function removeAll():void
    {
        for each(var i:MovieClip in _uiList)
        {
            _basketPopUp["_items"].removeChild(i);
        }
        _uiList = [];
    }
}
}
