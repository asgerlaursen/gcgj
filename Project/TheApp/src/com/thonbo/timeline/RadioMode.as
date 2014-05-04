package com.thonbo.timeline {
	
	import com.thonbo.timeline.SwitchMode;
	import flash.events.MouseEvent;

	/**
	 * TimelineUtils
	 * @author Thonbo.com
	 */

	public class RadioMode extends SwitchMode {
		private static var newSelection:RadioMode;
		private static var oldSelection:RadioMode;
		private var _passive:Boolean = false;

		public function RadioMode():void {
			super();
		}

		public function turnOff():void {
			_passive = true;
			buttonMode = false;
			mouseEnabled = false;
		}

		public function turnOn():void {
			_passive = false;
			buttonMode = true;
			mouseEnabled = true;
		}

		public function setFocus():void {
			newSelection = this;
			if (! newSelection._passive) {
				newSelection.turnOff();
			}
			if (newSelection.rollState != "on") {
				newSelection.switchState = true;
			}
			if (oldSelection != null) {
				oldSelection.turnOn();
				oldSelection.switchState = false;
			}
			oldSelection = newSelection;
		}

		public static function killFocus():RadioMode {
			var tempSelection:RadioMode = oldSelection;
			if (oldSelection) {
				oldSelection.goBack();
				oldSelection.turnOn();
				oldSelection = null;
				return tempSelection;
			} else {
				return null;
			}
		}

		public static function getFocus():RadioMode {
			if (oldSelection) {
				return oldSelection;
			} else {
				return null;
			}
		}
	}
}