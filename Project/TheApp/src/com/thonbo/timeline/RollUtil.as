package com.thonbo.timeline {

	import flash.display.MovieClip;
	import flash.events.Event
	import com.thonbo.timeline.RollEvent;
	
	/**
	 * TimelineUtils
	 * @author Thonbo.com
	 */
	
	public class RollUtil extends MovieClip {

		private var _inverted:Boolean = false;
		private var _rollState:String = "off";

		public function RollUtil() {
			addFrameScript(0,firstFrame)
			addFrameScript(totalFrames-1, endFrame)
		}
		
		protected function firstFrame():void{
			if(rollState == "out"){
				dispatchEvent(new RollEvent(RollEvent.UP_STATE, false, false, 1));
			}
		}
		protected function endFrame():void{
			dispatchEvent(new RollEvent(RollEvent.OVER_STATE, false, false, totalFrames-1));
			stop()
		}

		public function goBack():void {
			this._rollState = "out";
			dispatchEvent(new RollEvent(RollEvent.ROLL_OUT,false, false, currentFrame));
			if (! _inverted) {
				this.removeEventListener(Event.ENTER_FRAME, go_Forward);
				this.addEventListener(Event.ENTER_FRAME, go_Back);
			} else {
				this.removeEventListener(Event.ENTER_FRAME, go_Back);
				this.addEventListener(Event.ENTER_FRAME, go_Forward);
			}
		}
		
		public function goForward():void {
			this._rollState = "in";
			dispatchEvent(new RollEvent(RollEvent.ROLL_IN,false, false, currentFrame));
			if (! _inverted) {
				this.removeEventListener(Event.ENTER_FRAME, go_Back);
				this.addEventListener(Event.ENTER_FRAME, go_Forward);
			} else {
				this.removeEventListener(Event.ENTER_FRAME, go_Forward);
				this.addEventListener(Event.ENTER_FRAME, go_Back);
			}
		}
		
		public function killRoll():void {
			if (this.hasEventListener(Event.ENTER_FRAME)) {
				this.removeEventListener(Event.ENTER_FRAME, go_Back);
				this.removeEventListener(Event.ENTER_FRAME, go_Forward);
			}
		}
		
		private function go_Back(e:Event):void {
			if (e.currentTarget.currentFrame > 1) {
				e.currentTarget.prevFrame();
			} else {
				e.currentTarget.removeEventListener(Event.ENTER_FRAME, go_Back);
				if (!_inverted) {
					_rollState = "off";
				} else {
					_rollState = "on";
				}
			}
		}
		
		private function go_Forward(e:Event):void {
			if (e.currentTarget.currentFrame < e.currentTarget.totalFrames) {
				e.currentTarget.nextFrame();
			} else {
				e.currentTarget.removeEventListener(Event.ENTER_FRAME, go_Forward);
				if (! _inverted) {
					_rollState = "on";
				} else {
					_rollState = "off";
				}
			}
		}
		public function set inverted(value:Boolean):void {
			_inverted = value;
			this.goBack()
		}
		public function get inverted():Boolean {
			return _inverted
		}
		
		public function get rollState():String { 
			return _rollState;
		}	
	}
}