package com.thonbo.utils {

	import flash.display.BitmapDataChannel;
	import flash.events.Event;
	import flash.display.BitmapData;
	import flash.filters.ColorMatrixFilter;
	import flash.geom.Vector3D;
	import flash.utils.ByteArray;
	import flash.geom.Point;
	import org.papervision3d.core.math.Number3D;
	
	/**
	 * ...
	 * @author Thonbo.com
	 *  
	 */
	
	public class Wiggle extends ByteArray{

		public var perlinData:BitmapData;
		public var pixelValue:uint = 0
		public var name:String;
		private var _multiplier:Number = 1
		private var _perlinSize:Number;
		private var _roughNess:Number;
		private var _looping:Boolean;
		private var _fractal:Boolean;
		private var _combined:Boolean;
		private var rValue:uint;
		private var gValue:uint;
		private var bValue:uint;
		private var aValue:uint;
		private var _seed:uint
		
		private var contrastFilter:ColorMatrixFilter;

		public function Wiggle(perlinSize:Number = 100, roughNess:Number = 2, fractal:Boolean = true, looping:Boolean = true, combined:Boolean = false) {
			_perlinSize = perlinSize
			_roughNess = roughNess
			_seed = uint(Math.random() * 1000)
			_looping = looping
			_fractal = fractal
			_combined = combined
			perlinData = new BitmapData(2880, 1, false, 0x808080);
			contrastFilter = new ColorMatrixFilter()
			
			initPattern()
			
			position = 0;
		}
		
		private function initPattern() {
			perlinData.perlinNoise(_perlinSize, 1, _roughNess, _seed, _looping, _fractal, BitmapDataChannel.RED | BitmapDataChannel.BLUE | BitmapDataChannel.GREEN | BitmapDataChannel.ALPHA, _combined, null);
			contrastFilter.matrix = [2.0348570346832275,-0.6124469041824341,-0.08241000026464462,0,-55.09000015258789,-0.31014299392700195,1.7325528860092163,-0.08241000026464462,0,-55.08999252319336,-0.31014299392700195,-0.6124469041824341,2.262589931488037,0,-55.089996337890625,0,0,0,1,0]
			perlinData.applyFilter(perlinData, perlinData.rect, new Point(0,0), contrastFilter)
			writeBytes(perlinData.getPixels(perlinData.rect))
		}
		
		public function newValues() {
			if (this.position+4 >= this.length) {
				this.position = 0
			}
			aValue = pixelValue >> 32 & 0xFF
			rValue = pixelValue >> 16 & 0xFF
			gValue = pixelValue >> 8 & 0xFF
			bValue = pixelValue & 0xFF
			pixelValue = this.readUnsignedInt()
		}
			
		public function get xValue():uint{
			return rValue*_multiplier
		}
		public function get yValue():uint{
			return gValue*_multiplier
		}
		public function get zValue():uint{
			return bValue*_multiplier
		}
		public function get wValue():uint{
			return aValue*_multiplier
		}
		public function get pointValue():Point{
			return new Point(rValue*_multiplier, gValue*_multiplier)
		}
		public function get point3D():Number3D{
			return new Number3D(rValue*_multiplier, gValue*_multiplier, bValue*_multiplier);
		}
		
		public function get perlinSize():Number { return _perlinSize; }
		
		public function set perlinSize(value:Number):void 
		{
			_perlinSize = value;
			initPattern()
		}
		
		public function get roughNess():Number { return _roughNess; }
		
		public function set roughNess(value:Number):void 
		{
			_roughNess = value;
			initPattern()
		}
		
		public function get looping():Boolean { return _looping; }
		
		public function set looping(value:Boolean):void 
		{
			_looping = value;
			initPattern()
		}
		
		public function get fractal():Boolean { return _fractal; }
		
		public function set fractal(value:Boolean):void 
		{
			_fractal = value;
			initPattern()
		}
		
		public function get combined():Boolean { return _combined; }
		
		public function set combined(value:Boolean):void 
		{
			_combined = value;
			initPattern()
		}
		
		public function get multiplier():Number { return _multiplier; }
		
		public function set multiplier(value:Number):void 
		{
			_multiplier = value;
		}		
	}
}