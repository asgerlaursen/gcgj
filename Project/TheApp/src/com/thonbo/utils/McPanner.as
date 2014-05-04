package com.thonbo.utils{

	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.display.Stage;
	import flash.geom.Rectangle;
	import flash.display.DisplayObject;

	public class McPanner extends MovieClip {

		public var _contentBounds:Rectangle;
		public var _lockX:Boolean;
		public var _lockY:Boolean;
		public var _inactive:Boolean;
		public var easing:Number = 0.03;
		public var _mouseBounds:Rectangle = null;
		public var boundsArray:Array

		public function McPanner():void {

			setContentBounds(getChildByName("contentbounds"));
			setMouseBounds(getChildByName("mousebounds"));
			boundsArray = new Array()
			_lockX = false;
			_lockY = false;
			_inactive = false;
			setInitBounds()
			if (!_inactive) {
				this.addEventListener(Event.ENTER_FRAME, onFrameHandler);
			}
		}

		private function setInitBounds(){
			for (var i:int = 0; i < this.numChildren; i++) {
				var thisMc:MovieClip = MovieClip(this.getChildAt(i));
				boundsArray.push(thisMc.getBounds(this))
			}
		}

		private function onFrameHandler(e:Event):void {
			panDisplayList(this);
		}

		
		public function panDisplayList(list:MovieClip) {
			for (var i:int = 0; i < list.numChildren; i++) {
				var thisMc:MovieClip = MovieClip(list.getChildAt(i));
				var thisBounds:Rectangle = Rectangle(boundsArray[i])
				//if(!thisMc.deactivated){
					if (!_lockX) {
						thisMc.x += (MathUtils.panToWidth(thisBounds, _contentBounds, _mouseBounds)-thisMc.x)*easing;
					}
					if (!_lockY) {
						thisMc.y += (MathUtils.panToHeight(thisBounds, _contentBounds, _mouseBounds)-thisMc.y)*easing;
					}
				//} 
			}
		}
		public function activate():void {
			if (! this.hasEventListener(Event.ENTER_FRAME)) {
				this.addEventListener(Event.ENTER_FRAME, onFrameHandler);
			}
		}
		public function deactivate():void {
			if (this.hasEventListener(Event.ENTER_FRAME)) {
				this.removeEventListener(Event.ENTER_FRAME, onFrameHandler);
			}
		}

		public function setContentBounds(_do:DisplayObject):void {
			if (_do) {
				_contentBounds = _do.getRect(this);
			}
			removeChild(_do);
		}
		public function setMouseBounds(_do:DisplayObject):void {
			if (_do) {
				_mouseBounds = _do.getRect(this);
			}
			removeChild(_do);
		}
	}
}