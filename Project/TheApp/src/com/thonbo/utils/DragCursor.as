package com.thonbo.utils
{
	import dk.nozebra.core.Application;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObjectContainer;
	import flash.display.Stage;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;
	

	public class DragCursor
	{
		
		[Embed(source="handCursor.gif")]
		private static var HandCursor:Class;
		[Embed(source="handCursor2.gif")]
		private static var GrabCursor:Class;
		
		private static var cursorBmp:Bitmap;
		private static var handBmp:BitmapData;
		private static var dragBmp:BitmapData;
		private static var _dispObj:DisplayObjectContainer;
		private static var _active:Boolean = false;
		
		public var isDown:Boolean = false;
			
		
		public function DragCursor(displayObj:DisplayObjectContainer)
		{
			_dispObj = displayObj;
		}
			
		public function initDrag():void
		{
			_active = true;
			cursorBmp = new Bitmap();
			handBmp = new HandCursor().bitmapData;
			dragBmp = new GrabCursor().bitmapData;
			Mouse.hide();
			setHand();
			_dispObj.addChild(cursorBmp);
			_dispObj.addEventListener(MouseEvent.MOUSE_DOWN, onDown);
			_dispObj.addEventListener(MouseEvent.MOUSE_UP, onUp);
			_dispObj.addEventListener(MouseEvent.MOUSE_MOVE, onMove);
			cursorBmp.x = _dispObj.mouseX-(cursorBmp.width/2);
			cursorBmp.y = _dispObj.mouseY-(cursorBmp.height/2);
		}
		
		private function onDown(me:MouseEvent):void{
			isDown = true;
			setGrab();
			
			Application.wildcard = isDown;
		}
		private function onUp(me:MouseEvent):void{
			isDown = false;
			setHand();
			
			Application.wildcard = isDown;
		}
		
		private static function onMove(me:MouseEvent):void{
			cursorBmp.x = _dispObj.mouseX-(cursorBmp.width/2);
			cursorBmp.y = _dispObj.mouseY-(cursorBmp.height/2);
			me.updateAfterEvent();
		}
		
		public static function setHand():void{
			cursorBmp.bitmapData = handBmp;
		}
		
		public static function setGrab():void{
			cursorBmp.bitmapData = dragBmp;
		}
		
		public function removeDrag():void
		{
			_active = false;
			handBmp = null;
			dragBmp = null;
			Mouse.show();
			
			if(cursorBmp)
			{
				_dispObj.removeChild(cursorBmp);
				_dispObj.removeEventListener(MouseEvent.MOUSE_MOVE, onMove);
			}
		}
		
		public function set active(_bool:Boolean):void{
			_active = _bool;
		}
		public function get active():Boolean{
			return _active;
		}
		
		
	}
}