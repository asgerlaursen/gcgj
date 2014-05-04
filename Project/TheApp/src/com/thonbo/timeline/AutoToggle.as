package com.thonbo.timeline{
	import com.thonbo.timeline.McRollOver;
	import com.thonbo.timeline.SwitchMode;
	import flash.events.MouseEvent;

	/**
	 * TimelineUtils
	 * @author Thonbo.com
	 */

	public class AutoToggle extends SwitchMode {
		public function AutoToggle():void {
			super();
			addEventListener(MouseEvent.CLICK, onClickHandler);
		}
		private function onClickHandler(me:MouseEvent):void {
			toggle();
		}
		public function toggle():void {
			if (switchState) {
				switchState = false;
			} else {
				switchState = true;
			}
		}
	}
}