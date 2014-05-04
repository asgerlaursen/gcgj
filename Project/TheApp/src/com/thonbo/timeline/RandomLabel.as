package com.thonbo.timeline {

	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.display.FrameLabel;
	import flash.utils.Timer;

	/**
	* TimelineUtils
	* @author Thonbo.com
	*/
	public class RandomLabel extends MovieClip {
		
		private var seqs:Array = new Array();
		public var _delay:Number = 0;
		private var time:Timer;
		private var _clickable:Boolean;
		
		public function RandomLabel() {
			
			time = new Timer(_delay);
			time.addEventListener(TimerEvent.TIMER_COMPLETE, gotoRndFrame);
			
			seqs = this.currentLabels;
			scriptLabels();
		}
		
		private function scriptLabels() {
			for each (var item:FrameLabel in seqs) {
				this.addFrameScript(int(item.frame) - 1, nextLabel);
			}
			this.addFrameScript(0, nextLabel);
			this.addFrameScript(this.totalFrames - 1, nextLabel);
			trace(this.totalFrames - 1, nextLabel);
			
		}
		
		private function nextLabel() {
			stop();
			if (!_clickable) {
				time.delay = _delay;
				time.reset();
				time.start();
			} 
		}
		
		private function gotoRndFrame(te:TimerEvent):void {
			var theLabel:FrameLabel = FrameLabel(seqs[int(Math.random() * seqs.length)]);
			gotoAndPlay(theLabel.frame+1);
		}
		
		public function set isClickable(_isClick:Boolean):void {
			if (_isClick) {
				this.addEventListener(MouseEvent.CLICK, clickHandler);
				_clickable = true;
				this.buttonMode = true;
			} else {
				this.removeEventListener(MouseEvent.CLICK, clickHandler);
				_clickable = false;
				this.buttonMode = false;
			}
		}

		private function clickHandler(e:MouseEvent):void {
			gotoRndFrame(null);
		}	
	}
}