package com.thonbo.timeline
{
	import flash.events.Event;
	
	/**
	 * TimelineUtils
	 * @author Thonbo
	 */
	 
	public class RollEvent extends Event 
	{
		public static const UP_STATE:String = "up";
		public static const OVER_STATE:String = "over";
		public static const DOWN_STATE:String = "down";
		public static const ROLL_IN:String = "in";
		public static const ROLL_OUT:String = "out";
		
		public var frame:int
		
		public function RollEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false, _frame:int=undefined){ 
			super(type, bubbles, cancelable);
			frame = _frame;
		} 
	}
	
}