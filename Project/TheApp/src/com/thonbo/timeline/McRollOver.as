package com.thonbo.timeline{

	import com.thonbo.timeline.RollEvent;
	import com.thonbo.timeline.RollUtil;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.display.DisplayObject;
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName
	import flash.utils.Dictionary;

	/**
	 * TimelineUtils
	 * @author Thonbo.com
	 */

	public class McRollOver extends RollUtil {

		// shared objects
		private static var newSelection:McRollOver;
		private static var memory:Dictionary = new Dictionary();
		
		private var oldSelection:McRollOver;
		private var _passive:Boolean = false;
		private var _link:Array = new Array();

		public function McRollOver():void {
			stop();
			this.enabled = true;
			this.buttonMode = true;
			addEventListener(MouseEvent.ROLL_OVER, m_Over);
			addEventListener(MouseEvent.ROLL_OUT, m_Out);
		}

		private function m_Over(e:MouseEvent):void {
			e.currentTarget.goForward();
		}

		private function m_Out(e:MouseEvent):void {
			e.currentTarget.goBack();
		}

		public function turnOff():void {
			_passive = true;
			buttonMode = false;
			mouseEnabled = false;
			removeEventListener(MouseEvent.ROLL_OVER, m_Over);
			removeEventListener(MouseEvent.ROLL_OUT, m_Out);
		}

		public function turnOn():void {
			_passive = false;
			buttonMode = true;
			mouseEnabled = true;
			addEventListener(MouseEvent.ROLL_OVER, m_Over);
			addEventListener(MouseEvent.ROLL_OUT, m_Out);
		}

		public function setFocus():void {
			newSelection = this;

			if (! newSelection._passive) {
				newSelection.turnOff();
			}
			if (newSelection.rollState != "on") {
				newSelection.goForward();
			}
			// activate linked objects
			if (newSelection._link.length > 0) {
				for (var i:int = 0; i < newSelection._link.length; i++) {
					RollUtil(newSelection._link[i]).goForward();
				}
			}
			
			if (memory[getQualifiedClassName(newSelection)] != null) {
				oldSelection = memory[getQualifiedClassName(newSelection)]
				oldSelection.turnOn();
				oldSelection.goBack();
				// deactivate activated linked objects;
				if (oldSelection._link.length > 0) {
					for (var j:int = 0; j < oldSelection._link.length; j++) {
						RollUtil(oldSelection._link[j]).goBack();
					}
				}
			}
			addToMemory(newSelection);

		}

		public static function killFocus():McRollOver {
			var tempSelection:McRollOver
			for (var item:* in memory) { 
				tempSelection = memory[item]
				tempSelection.goBack();
				tempSelection.turnOn();
				// deactivate linked objects;
				if (tempSelection._link.length > 0) {
					for (var j:int = 0; j < tempSelection._link.length; j++) {
						RollUtil(tempSelection._link[j]).goBack();
					}
				}
				delete memory[item]
			}
			return tempSelection
		}

		public static function getFocus():McRollOver {
			var tempSelection:McRollOver
			for (var item:* in memory) { 
				tempSelection = memory[item]
			}
			return tempSelection
		}

		public function setLinks(list:Array):void {
			this._link = list;
		}

		public function addLink(obj:RollUtil):void {
			this._link.push(obj);
		}

		public function getLinkObj(no:int):RollUtil {
			return this._link[no];
		}
		private function addToMemory(obj:McRollOver):void {
			memory[getQualifiedClassName(obj)] = obj;
		}

	}
}