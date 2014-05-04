package com.thonbo.utils {
	import flash.geom.Point;
	import flash.events.*;
	import flash.display.MovieClip
	import flash.display.DisplayObjectContainer;
	
	public class EyeFollow extends MovieClip
	{
		private var origin:Point;
		private var initXPos:Number;
		private var initYPos:Number;
		
		public var _distanceZ:Number;
		public var _ovality:Number;
		public var _eyeRadius:Number;
		public var _eyeLock:Boolean = false;
		public var _ease:Number = 0.42;
		
		public function EyeFollow()
		{
			_eyeRadius = 2;
			_distanceZ = 75;
			_ovality = 1;
			origin = new Point(this.x,this.y);
			initXPos = origin.x;
			initYPos = origin.y;
			addEventListener(Event.ENTER_FRAME,onFrame);
		}

		private function onFrame(e:Event):void
		{
			var xdiff:Number = mouseX - origin.x;
			var ydiff:Number = mouseY - origin.y;
			var radius:Number = Math.min(Math.max(Math.sqrt(xdiff * xdiff + ydiff * ydiff) / (_distanceZ*.1),0),_eyeRadius);
			var angle:Number = Math.atan2(ydiff,xdiff);
			var newXPos:Number = Math.cos(angle) * radius * _ovality + origin.x;
			var newYPos:Number = Math.sin(angle) * radius + origin.y;
			if (! _eyeLock)
			{
				this.x +=  newXPos - this.x * _ease;
				this.y +=  newYPos - this.y * _ease;
			}
		}
		public function setEyeBack(mc:DisplayObjectContainer):void{
			_eyeRadius = ((mc.width+mc.height)/2)*0.2-this.width*0.2
			_ovality = (mc.width/mc.height)
			trace(_ovality)
		}
	}
}