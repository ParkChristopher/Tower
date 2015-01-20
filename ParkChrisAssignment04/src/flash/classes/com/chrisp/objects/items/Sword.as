package com.chrisp.objects.items
{
	import flash.display.MovieClip;
	import com.natejc.utils.StageRef;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import org.osflash.signals.Signal;

	
	/**
	 * Dicatates behavior of the hero's sword attack
	 * 
	 * @author Chris Park
	 */
	public class Sword extends AbstractItem
	{
		/** Direction of travel. */
		public var sDirection			:String;
		/**Damage dealt by sword. */
		public var nAttackPower			:Number = 10;
		/** Timer used to control sword movement.*/
		public var movementTimer		:Timer;
		/** Movement speed of the sword.*/
		public var MOVE_SPEED			:Number = 16;
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Constructs the Sword object.
		 */
		public function Sword($startX:Number, $startY:Number, $direction:String)
		{
			super("sword");
			
			this.x = $startX;
			this.y = $startY;
			this.sDirection = $direction;
			rotate();
		}
		
		/* ---------------------------------------------------------------------------------------- */		
		
		/**
		 * Initializes the hero's sword.
		 */
		override public function begin():void
		{
			super.begin();
			
			this.bActive = true;
			this.movementTimer = new Timer(30);
			this.movementTimer.addEventListener(TimerEvent.TIMER, move);
			this.movementTimer.start();
			
		}
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Cleans up the hero's sword.
		 */
		override public function end():void
		{
				super.end();
				this.movementTimer.stop();
				this.movementTimer.removeEventListener(TimerEvent.TIMER, move);
		}
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Rotates the sword to point in the direction it travels.
		 */
		public function rotate():void
		{
			if (sDirection == "right")
				this.rotation += 90;
				
			if (sDirection == "left")
				this.rotation -= 90;
			
			if (sDirection == "down")
				this.rotation += 180;
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Handles movement of the sword across the screen.
		 * 
		 * @param $e	TimerEvent.
		 */
		public function move($e:TimerEvent):void
		{	
			if (sDirection == "right")
			{
				if (this.x > StageRef.stage.width)
				{
					this.bActive = false;
					this.cleanupSignal.dispatch();
					return;
				}
				
				this.x += MOVE_SPEED;
			}
			
			if (sDirection == "left")
			{
				if (this.x < 0)
				{
					this.bActive = false;
					this.cleanupSignal.dispatch();
					return;
				}
				
				this.x -= MOVE_SPEED;
			}
			
			if (sDirection == "up")
			{
				if (this.y < 0)
				{
					this.bActive = false;
					this.cleanupSignal.dispatch();
					return;
				}
				
				this.y -= MOVE_SPEED;
			}
			
			if (sDirection == "down")
			{
				if (this.y > StageRef.stage.height)
				{
					this.bActive = false;
					this.cleanupSignal.dispatch();
					return;
				}
				
				this.y += MOVE_SPEED;
			}
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
	}
}

