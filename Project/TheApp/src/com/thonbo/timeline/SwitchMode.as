package com.thonbo.timeline {
	
	import com.thonbo.timeline.RollUtil;
	import flash.events.MouseEvent;

	/**
	 * TimelineUtils
	 * @author Thonbo.com
	 */

	public class SwitchMode extends RollUtil {
		private var _switchState:Boolean = false;
		public function SwitchMode():void {
			super();
			stop();
			buttonMode = true;
			_switchState = false;
		}

		public function set switchState(onOff:Boolean):void {
			_switchState = onOff;
			if (_switchState == true) {
				this.goForward();
			}
			if (_switchState == false) {
				this.goBack();
			}
		}
		public function get switchState():Boolean {
			return _switchState;
		}
	}
}