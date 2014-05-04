package com.thonbo.utils
{
	import flash.display.Shape;
	import flash.display.Graphics
	import flash.geom.Matrix
		
	public class PatternToRect extends Shape
	{
		
		public var _matrix:Matrix
		private var _repeat:Boolean
		private var _smoothing:Boolean
		public var _tile:BitmapData
	
		public function PatternToRect(_rect:Rectangle, pattern:BitmapData)
		{

			_tile = BitmapData(pattern)
			_repeat = true;
			_smoothing = false;
			_matrix = new Matrix();
			with (graphics) {
				clear()
				beginBitmapFill(_tile,_matrix,_repeat,_smoothing);
				drawRect(_rect.x, _rect.y, _rect.width, _rect.height)
				endFill();
			}
			super();
		}
	}
}