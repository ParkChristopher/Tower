package com.chrisp.objects
{
	import flash.display.MovieClip;
	import flash.utils.Timer;
	import org.osflash.signals.Signal;
	import com.greensock.loading.LoaderMax;
	import com.greensock.TweenMax;
	import com.greensock.easing.Linear;
	
	/**
	 * Base class for all game objects
	 * 
	 * @author Chris Park
	 */
	public class AbstractGameObject extends MovieClip implements IGameObject
	{
		/** Game object name */
		public var sName 				:String;
		/** Game object Hitbox. */
		public var mcHitbox				:MovieClip;
		/** Movement timer for object*/
		public var movementTimer		:Timer;
		/** Toggles if an object is doing something. */
		public var bActive				:Boolean = false;
		/** Determines the attack power of a game object.*/
		public var nAttackPower			:Number = 0;
		/** Value of the game object*/
		public var nValue				:Number = 0;
		/** Entity health */
		public var nHealth				:Number;
		/** Object type used for collision detection. */
		protected var _sObjectType		:String;
		/** Array of objects this object can collide with */
		protected var _aCanCollideWith	:Array = new Array();
		/** Signals for this object to be cleaned up*/
		public var cleanupSignal		:Signal = new Signal(AbstractGameObject);
		/** The objects target if any. */
		protected var _currentTarget		:AbstractGameObject;
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Constructs the AbstractGameObject object.
		 */
		public function AbstractGameObject($sName:String)
		{
			super();
			
			this.mouseEnabled	= false;
			this.mouseChildren	= false;
			
			this.sName = $sName;
		}
		
		/* ---------------------------------------------------------------------------------------- */		
		
		/**
		 * Relinquishes all memory used by this object.
		 */
		public function destroy():void
		{
			while (this.numChildren > 0)
				this.removeChildAt(0);
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Initializes this class.
		 */
		public function begin():void
		{
			parseXML();
			this.visible = true;
		}

		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Ends and stops this class.
		 */
		public function end():void
		{
			this.visible = false;
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Parses the relevant data from the xml config file for this object.
		 */
		protected function parseXML():void
		{
			var xConfig:XML = LoaderMax.getContent("xmlConfig");
			//trace(xConfig);
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Makes a display object flicker in and out of view for a period of time.
		 * 
		 * @param	$mc				The object that is to start flickering.
		 * @param	$nDuration		The amount of time (in seconds) for each individual flicker.
		 * @param	$nRepeatCount	The number of times that the flicker should occur before stopping.
		 * 
		 * @return					A reference to the flicker Tween that will begin running.
		 */
		protected function flicker($mc:MovieClip, $nDuration:Number = .005, $nRepeatCount:uint = 5):void
		{
			TweenMax.to(this, $nDuration, { repeat:$nRepeatCount, yoyo:true, alpha:0, ease:Linear.easeNone, onComplete:stopFlicker, onCompleteParams:[$mc]} );
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Stops the object from flickering.
		 * 
		 * @param	$mc			The object that should stop flickering and return to normal.
		 * @param	$nDuration	The amount of time it takes (in seconds) for the object to recover.
		 */
		protected function stopFlicker($mc:MovieClip, $nDuration:Number = 0.25):void
		{
			TweenMax.to($mc, $nDuration, { alpha:1 } );
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Get or set the target for this object.
		 *
		 * @param	$target	The new target of this object
		 * @return			The target of this object
		 */
		public function get currentTarget():AbstractGameObject
		{
			return this._currentTarget;
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		public function set currentTarget($target:AbstractGameObject):void
		{
			this._currentTarget = $target;
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Get or set the collision object type for this object.
		 *
		 * @param	$value	Set object collision type.
		 * @return			Object collision type.
		 */
		public function get objectType ():String
		{
			return _sObjectType;
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		public function set objectType ($value:String):void
		{
			_sObjectType = $value;
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Returns the list of object types this object can collide with.
		 */
		public function get collidableTypes():Array
		{
			return _aCanCollideWith;
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * returns the hitbox of this object.
		 * 
		 * @return mcHitbox
		 */
		public function get Hitbox():MovieClip
		{
			if (this.mcHitbox != null)
				return this.mcHitbox;
				
			return this;
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Adds an object type to this objects possible collisions list.
		 * 
		 * @param	$type String.
		 */
		public function addCollidableType($type:String):void
		{
			if (_aCanCollideWith.indexOf($type) < 0)
				_aCanCollideWith.push($type);
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Responses to collision with another object.
		 * 
		 * @param	$object AbstractGameObject
		 */
		public function collidedWith($object:AbstractGameObject):void
		{}
		
		/* ---------------------------------------------------------------------------------------- */
		
		
		
	}
}

