package com.chrisp.objects
{
	import flash.display.MovieClip;
	import flash.utils.Timer;

	
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
	}
}

