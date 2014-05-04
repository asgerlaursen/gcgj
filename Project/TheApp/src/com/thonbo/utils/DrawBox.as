package com.thonbo.utils
{
	import flash.display.Shape;
	import flash.display.Graphics
	
	public class DrawBox extends Shape
	{
		public function DrawBox(myWidth:Number, myHeight:Number, myX:Number = 0, myY:Number = 0, myColor:uint = 0x000000)
		{
			{
				with(graphics){
					clear();
					beginFill(myColor);
					drawRect(myX, myY, myWith, myHeight)
					endFill();
				}
			super();
		}
	}
}