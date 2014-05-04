package com.thonbo.utils {
	
	import flash.geom.Rectangle
	import flash.display.*
	import com.thonbo.utils.MathUtils
	
	public class ScrollerUtil {
		
		private var _contentBounds:Rectangle
		private var _maskBounds:Rectangle
		private var _mouseBounds:Rectangle
		private var _contentObj:DisplayObject
		public const EASING:Number = 0.4
		private var _stage:Stage
		private var boundsArray:Array = new Array()
		private var _lockX:Boolean
		private var _lockY:Boolean
		public var handle:DisplayObject
		private var offset:Number = 0
		public var scrollAble:Boolean = true
		private var thisBounds:Rectangle;
		
		public function ScrollerUtil(_content:DisplayObject, scrollMask:Rectangle = null, scrollBar:Rectangle = null){
			_contentObj = _content
			_stage = _content.stage
			_contentBounds = _content.getRect(_content.parent)
			if(scrollMask){
				_maskBounds = scrollMask
			} else {
				_maskBounds = new Rectangle(0,0,_stage.stageWidth, _stage.stageHeight);
			}
			if(scrollBar){
				_mouseBounds = scrollBar
			} else {
				_mouseBounds = new Rectangle(0,0,_stage.stageWidth, _stage.stageHeight);
			}
		}
				
		public function panDisplayList(list:MovieClip):void {
			for (var i:int = 0; i < list.numChildren; i++) {
				var thisMc:MovieClip = MovieClip(list.getChildAt(i));
				var boundsRect:Rectangle
				if(getBoundsClip(thisMc)){
					boundsRect = getBoundsClip(thisMc).getBounds(thisMc)
				} else {
					boundsRect = thisMc.getBounds(list)
				}
				if (!_lockX) {
					thisMc.x += (MathUtils.panToWidth(thisMc, thisBounds, _maskBounds, _mouseBounds)-thisMc.x)*EASING;
				}
				if (!_lockY) {
					thisMc.y += (MathUtils.panToHeight(thisMc, thisBounds, _maskBounds, _mouseBounds)-thisMc.y)*EASING;
				}
			}
		}
		
		public function panHeight():Number{
			return MathUtils.panToHeight(_contentObj, thisBounds, _maskBounds, _mouseBounds)
		}
		
		public function updateContent(_content:DisplayObject):void{
			_contentObj = _content
			_stage = _content.stage
			_contentBounds = _content.getRect(_content.parent)
			if(_contentBounds.height < _maskBounds.height){
				scrollAble = false
			} else {
				scrollAble = true
			}
		}
		public function getBoundsClip(mc:MovieClip):MovieClip{
			return MovieClip(mc.getChildByName("_bounds"))
		}
		
	}
}
