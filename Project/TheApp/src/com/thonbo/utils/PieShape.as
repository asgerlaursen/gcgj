package com.thonbo.utils{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;

	public class PieShape extends Sprite {

		// vars
		private var tangent:Number;
		private var targetX:Number;
		private var targetY:Number;
		private var anchorX:Number;
		private var anchorY:Number;

		private var factor:int;
		private var _angle:Number;
		private var _autoPlaySpeed:Number;
		private var _radius:Number;
		private var _color:uint;
		private var pieComplete:Event;

		// constructor

		public function PieShape(size:Number = 100, color:uint = 0xFF0000):void {
			_angle = 0;
			_radius = size;
			_color = color;
			rotation = -90;
			graphics.beginFill(_color, 1);
			graphics.moveTo(0, 0);
			graphics.lineTo(_radius, 0);
		}

		// functions

		private function getRadian(_angle:Number):Number {
			return _angle * Math.PI / 180;
		}

		public function updatePie(newStep:Number, overwrite:Boolean = true):void {
			factor = _angle / Math.abs(_angle);
			if (overwrite) {
				_angle = 0;
				graphics.clear();
				graphics.beginFill(_color, 1);
				graphics.moveTo(0, 0);
				graphics.lineTo(_radius, 0);
			}
			if (newStep > 45 || newStep < -45) {
				var loops:Number = newStep / 45;
				newStep = (loops - Math.round(loops))*45;
				for (var i:int = 0; i < Math.abs(Math.round(loops)); i++) {
					_angle +=  45 * factor;
					tangent = Math.tan(getRadian(45 / 2));
					targetX = Math.cos(getRadian(_angle)) * _radius;
					targetY = Math.sin(getRadian(_angle)) * _radius;
					anchorX=targetX+_radius*tangent*Math.cos(getRadian(_angle-(90*factor)));
					anchorY=targetY+_radius*tangent*Math.sin(getRadian(_angle-(90*factor)));
					graphics.curveTo(anchorX, anchorY, targetX, targetY);
				}
			}
			_angle +=  newStep;
			tangent = Math.tan(getRadian(newStep / 2));
			targetX = Math.cos(getRadian(_angle)) * _radius;
			targetY = Math.sin(getRadian(_angle)) * _radius;
			anchorX = targetX + _radius * tangent * Math.cos(getRadian(_angle - 90));
			anchorY = targetY + _radius * tangent * Math.sin(getRadian(_angle - 90));
			graphics.curveTo(anchorX, anchorY, targetX, targetY);
			if (_angle >= 360) {
				_angle = 0;
				pieComplete = new Event(Event.COMPLETE);
				dispatchEvent(pieComplete);
			}
			if (overwrite) {
				graphics.endFill();
			}
		}

		protected function autoPlayHandler(e:Event):void {
			angle +=  _autoPlaySpeed;
		}


		public function centerTo(obj:Object):void {
			if (obj == stage) {
				x = stage.stageWidth * .5;
				y = stage.stageHeight * .5;
			} else {
				//trace(+" - "+DisplayObject(obj).x)
				x = DisplayObject(obj).getBounds(DisplayObject(obj)).x + DisplayObject(obj).x + DisplayObject(obj).width * .5;
				y = DisplayObject(obj).getBounds(DisplayObject(obj)).y + DisplayObject(obj).y + DisplayObject(obj).height * .5;
			}
		}
		//hasEventListener(Event.ENTER_FRAME)
		public function autoPlay(speed:Number = 5):void {
			if (!hasEventListener(Event.ENTER_FRAME)) {
				_autoPlaySpeed = speed;
				addEventListener(Event.ENTER_FRAME, autoPlayHandler);
			} else {
				if (speed == 0) {
					removeEventListener(Event.ENTER_FRAME, autoPlayHandler);
				} else {
					_autoPlaySpeed = speed;
				}
			}

		}

		public function set color(value:uint):void {
			_color = value;
		}

		public function get color():uint {
			return _color;
		}

		public function set angle(value:int):void {
			updatePie(value);
		}

		public function get angle():int {
			return _angle;
		}

		public function set radius(value:int):void {
			_radius = value;
		}

		public function get radius():int {
			return _radius;
		}

		public function get autoPlaySpeed():Number {
			return _autoPlaySpeed;
		}

		public function set autoPlaySpeed(speed : Number):void {
			autoPlay(speed)
		}
	}
}