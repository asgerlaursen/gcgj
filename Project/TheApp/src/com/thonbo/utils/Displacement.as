package
{
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.filters.DisplacementMapFilter;
	
	public class Displacement extends Sprite
	{
		
		private var colorMap:BitmapData
		private var dFilter:DisplacementMapFilter;
		
		public function Displacement()
		{
			colorMap.draw(this)
			while(this.numChildren != 0){
				removeChildAt(0)
				trace(this.numChildren)
			}
		}
	}
}