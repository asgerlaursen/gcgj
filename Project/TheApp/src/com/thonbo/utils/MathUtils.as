package com.thonbo.utils {
	
	import flash.geom.Rectangle
	import flash.display.DisplayObject

	public class MathUtils {
		
		public static function distance(dx : Number,dy : Number) : Number {
			return Math.sqrt(dx *dx  + dy*dy);
		}
		
		public static function getRadian(degree:Number) : Number {
			return (degree * Math.PI /180);
		}
		
		public static function getDegree(radian:Number) : Number {
			return (radian * 180 / Math.PI);
		}
		
		public static function randRange(min:Number, max:Number):Number {
			var randomNum:Number = (Math.random()*(max-min))+min;
			return randomNum;
		}
		
		public static function ratioValue(value:Number, actualMin:Number, actualMax:Number, ratioMin:Number, ratioMax:Number):Number{
			return (((value - actualMin) / (actualMax - actualMin)) * (ratioMax - ratioMin)) + ratioMin;
		}
		
		public static function ratioValueCap(value:Number, actualMin:Number, actualMax:Number, ratioMin:Number, ratioMax:Number):Number{
			if(MathUtils.ratioValue(value, actualMin, actualMax, ratioMin, ratioMax) >= ratioMax){
				return ratioMax
			} else if(MathUtils.ratioValue(value, actualMin, actualMax, ratioMin, ratioMax) <= ratioMin){
				return ratioMin
			} else {
				return MathUtils.ratioValue(value, actualMin, actualMax, ratioMin, ratioMax);
			}
			
		}
		
		public static function prcRange(min:Number, max:Number, prc:Number):Number {
			return ((  max - min ) / 100)* prc + min
		}
	
		
		public static function valueBetween(value:Number, minimum:Number, maximum:Number):Number {
			return (value - minimum) / (maximum - minimum);
		}
		
		public static function panToWidth(_contentObj:DisplayObject, _contentBounds:Rectangle, _maskBounds:Rectangle, _mouseBounds:Rectangle = null):Number {
			if (_mouseBounds) {
				if (_contentObj.parent.mouseX < _mouseBounds.x){
					return _maskBounds.x
				} else if (_contentObj.parent.mouseX > _mouseBounds.width + _mouseBounds.x) {
					return -(_contentBounds.width - _maskBounds.width)+_maskBounds.x
				} else {
					return ((((_contentObj.parent.mouseX-_mouseBounds.x)*(_maskBounds.width/_mouseBounds.width))/_maskBounds.width)*-(_contentBounds.width-_maskBounds.width))+_maskBounds.x
				}
			} else {
				return -((_contentObj.parent.mouseX/_maskBounds.width)*(_contentBounds.width-_maskBounds.width));
			}
		}
		
		public function panToHeight(_contentObj:DisplayObject, _contentBounds:Rectangle, _maskBounds:Rectangle, _mouseBounds:Rectangle = null, handle:DisplayObject = null):Number {
			var controller:Number
			var bar:Number
			if(handle){
				controller = handle.y
				bar = _mouseBounds.height-handle.height
			} else {
				controller = _contentObj.parent.mouseY
				bar = _mouseBounds.height
			}
			if (_mouseBounds) {
				if (controller < _mouseBounds.y){
					return _maskBounds.y
				} else if (controller > bar + _mouseBounds.y) {
					return -(_contentBounds.height - _maskBounds.height)+_maskBounds.y
				} else {
					return ((((controller-_mouseBounds.y)*(_maskBounds.height/bar))/_maskBounds.height)*-(_contentBounds.height-_maskBounds.height))+_maskBounds.y
				}
			} else {
				return -((controller/bar)*(_contentBounds.height-_maskBounds.height));
			}
		}
		
	}
}
