package com.thonbo.utils 
{
	import flash.display.DisplayObject;
	import flash.geom.Point;
	/**
	 * ...
	 * @author ...
	 */
	public class DoUtils
	{
		public static function aspectHeight(dispObj:DisplayObject, newWidth:Number):Number {
			return dispObj.height * (dispObj.width / newWidth)
		}
		public static function aspectWidth(dispObj:DisplayObject, newHeight:Number):Number {
			return dispObj.width * (dispObj.height / newHeight)
		}
		public static function getAngle(dispObj:DisplayObject, _x:Number, _y:Number):Number {
			return MathUtils.getDegree(Math.atan2((dispObj.y-_y),(dispObj.x-_x)))
		}
		public static function getDistance(dispObj : DisplayObject, _x:Number, _y:Number) : Number {
			return MathUtils.distance(dispObj.x-_x, dispObj.y-_y)
		}
		
		public static function panToWidth(_content:DisplayObject, _maskBounds:Rectangle, _mouseBounds:Rectangle = null):Number {
			if (_mouseBounds) {
				if (_content.mouseX < _mouseBounds.x){
					return _maskBounds.x
				} else if (_content.mouseX > _mouseBounds.width + _mouseBounds.x) {
					return -(_content.width - _maskBounds.width)+_maskBounds.x
				} else {
					return ((((_content.mouseX-_mouseBounds.x)*(_maskBounds.width/_mouseBounds.width))/_maskBounds.width)*-(_content.width-_maskBounds.width))+_maskBounds.x
				}
			} else {
				return -((_content.mouseX/_maskBounds.width)*(_content.width-_maskBounds.width));
			}
		}

		public static function panToHeight(_content:DisplayObject, _maskBounds:Rectangle, _mouseBounds:Rectangle = null):Number {
			if (_mouseBounds) {
				if (_content.mouseY < _mouseBounds.y){
					return _maskBounds.y
				} else if (_content.mouseY > _mouseBounds.height + _mouseBounds.y) {
					return -(_content.height - _maskBounds.height)+_maskBounds.y
				} else {
					return ((((_content.mouseY-_mouseBounds.y)*(_maskBounds.height/_mouseBounds.height))/_maskBounds.height)*-(_content.height-_maskBounds.height))+_maskBounds.y
				}
			} else {
				return -((_content.mouseY/_maskBounds.height)*(_content.height-_maskBounds.height));
			}
		}
		
	}

}