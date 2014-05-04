package com.thonbo.timeline {

	import flash.display.MovieClip;
	import flash.events.Event
	import com.thonbo.timeline.RollEvent;
	
	/**
	 * TimelineUtils
	 * @author Thonbo.com
	 */
	
	public class FrameLabels extends MovieClip {


		public function FrameLabels() {

		}
		
		public function goBack():void {
			this.removeEventListener(Event.ENTER_FRAME, go_Forward);
			this.addEventListener(Event.ENTER_FRAME, go_Back);
		}
		
		public function goForward():void {
			this.removeEventListener(Event.ENTER_FRAME, go_Back);
			this.addEventListener(Event.ENTER_FRAME, go_Forward);
		}
		
		public function killRoll():void {
			this.removeEventListener(Event.ENTER_FRAME, go_Back);
			this.removeEventListener(Event.ENTER_FRAME, go_Forward);
		}
		
		private function go_Back(e:Event):void {
			if (e.currentTarget.currentFrame > 1) {
				e.currentTarget.prevFrame();
			} else {
				e.currentTarget.removeEventListener(Event.ENTER_FRAME, go_Back);
			}
		}
		
		private function go_Forward(e:Event):void {

			if (e.currentTarget.currentFrame < e.currentTarget.totalFrames) {
				e.currentTarget.nextFrame();
			} else {
				e.currentTarget.removeEventListener(Event.ENTER_FRAME, go_Forward);
			}
		}
	}
}