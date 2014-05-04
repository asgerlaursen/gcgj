package com.thonbo.utils{

	import com.thonbo.utils.ScrollerUtil;
	
	import flash.display.*;
	import flash.events.*;
	import flash.geom.Rectangle;

	public class ScrollBox extends MovieClip {

		private var contentRect:Rectangle
		private var moveContent:Boolean = false;
		private var barRect:Rectangle
		private var handleHeight:Number
		private const EASE:Number = 0.2;
		private var scrollTarget:Number
		private var _scrollContent:MovieClip;
		private var _scrollBar:MovieClip;
		private var _scrollMask:MovieClip;
		private var _scrollHandle:MovieClip
		private var isActive:Boolean = false
		
		public function ScrollBox() {
			this.addEventListener(Event.ADDED_TO_STAGE, init)
			_scrollContent = content;
			_scrollBar = bar;
			_scrollMask = scrollMask;
			_scrollHandle = handle;
		}

		private function init(e:Event):void{
			trace("scrollBox initiated...")

				handleHeight = _scrollHandle.height
				barRect = new Rectangle(bar.x,bar.y,0,bar.height-handleHeight);
				//contentRect = content.getBounds(this)
				//_scrollContent.mask = _scrollMask;
				_scrollHandle.addEventListener(MouseEvent.MOUSE_DOWN, onScrollDown);
				stage.addEventListener(MouseEvent.MOUSE_UP, onScrollUp);
				//_scrollHandle.addEventListener(MouseEvent.MOUSE_MOVE, onMoveHandle);
				_scrollHandle.buttonMode = true;
				//scrollTarget = -MathUtils.ratioValueCap(_scrollHandle.y, _scrollMask.y, _scrollMask.y+_scrollMask.height,barRect.y, barRect.y+barRect.height-_scrollHandle.height)*1.05
				scrollTarget = MathUtils.ratioValue(_scrollHandle.y, barRect.y, barRect.y+barRect.height, _scrollMask.y, _scrollMask.y-(_scrollContent.height-_scrollMask.height))
	
				this.addEventListener(Event.ENTER_FRAME, onScrolling);
				//updateContent()
		}

		private function onScrollDown(me:MouseEvent):void {

			_scrollHandle.startDrag(false, barRect)
			moveContent = true;
		}

		private function onScrollUp(me:MouseEvent):void {

			moveContent = false;
			_scrollHandle.stopDrag();
		}

		private function onScrolling(e:Event):void {
			if (moveContent) {
				scrollTarget = MathUtils.ratioValue(_scrollHandle.y, barRect.y, barRect.y+barRect.height, _scrollMask.y, _scrollMask.y-(_scrollContent.height-_scrollMask.height))
			}
			if(Math.round(_scrollContent.y) != Math.round(scrollTarget)){
				_scrollContent.y += (scrollTarget-_scrollContent.y)*EASE;
			}
		}

		/*private function onMoveHandle(me:MouseEvent):void {
			
			if (moveContent) {


				//me.updateAfterEvent();
			}
		}*/

		public function updateContent():void{
		/*	trace("updateContent "+content.height)
			if(_scrollContent.height < _scrollMask.height){
				deactivate();
				_scrollHandle.y = _scrollBar.y;
				_scrollHandle.visible = false;
				_scrollBar.visible = false;
			} else {
				activate()
				this.addEventListener(Event.ENTER_FRAME, onScrolling);
				_scrollHandle.visible = true;
				_scrollBar.visible = true;
			}*/
		}
		public function deactivate():void{
			isActive = true
			this.removeEventListener(Event.ENTER_FRAME, onScrolling);
		}
		public function activate():void{
			isActive = true
			this.addEventListener(Event.ENTER_FRAME, onScrolling);
		}
		
		public function get handle():MovieClip{
			if(getChildByName("_handle") != null){
				return MovieClip(getChildByName("_handle"))
			} else {
				throw(new Error("set a scroll handle: '_handle'"))
			}
		}
		public function get content():MovieClip{
			if(getChildByName("_content") != null){
				return MovieClip(getChildByName("_content"))
			} else {
				throw(new Error("set scroll content: '_content'"))
			}
		}
		public function get bar():MovieClip{
			if(getChildByName("_bar") != null){
				return MovieClip(getChildByName("_bar"))
			} else {
				throw(new Error("set a scroll bar: '_bar'"))
			}
		}
		
		public function get scrollProgress():Number{
			return scrollTarget
		}
		
		public function get scrollMask():MovieClip{
			if(getChildByName("_mask") != null){
				return MovieClip(getChildByName("_mask"))
			} else {
				throw(new Error("set a scroll _mask: '_mask'"))
			}
		}
		
	}
}