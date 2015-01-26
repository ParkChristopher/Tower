package com.chrisp.objects
{
	import com.chrisp.collision.GameObjectType;
	import flash.display.MovieClip;
	import flash.utils.Timer;
	import org.osflash.signals.Signal;

	
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
		/** Object type used for collision detection. */
		protected var _sObjectType		:String;
		/** Array of objects this object can collide with */
		protected var _aCanCollideWith	:Array = new Array();
		/** Signals for this object to be cleaned up*/
		public var cleanupSignal		:Signal = new Signal(AbstractGameObject);
		
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
		
		public function get collidableTypes():Array
		{
			return _aCanCollideWith;
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		public function getHitbox():MovieClip
		{
			if (this.mcHitbox != null)
				return this.mcHitbox;
				
			return this;
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		public function addCollidableType($type:String):void
		{
			if (_aCanCollideWith.indexOf($type) < 0)
				_aCanCollideWith.push($type);
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		public function collidedWith($object:AbstractGameObject):void
		{
			//if object is collidable for this object
			//respond
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		
		
	}
}

