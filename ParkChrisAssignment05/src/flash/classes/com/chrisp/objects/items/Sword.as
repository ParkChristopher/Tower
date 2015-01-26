package com.chrisp.objects.items
{
	import com.chrisp.objects.AbstractGameObject;
	import flash.display.MovieClip;
	import com.natejc.utils.StageRef;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import org.osflash.signals.Signal;
	import com.chrisp.collision.GameObjectType;
	import com.chrisp.collision.CollisionManager;

	
	/**
	 * Dicatates behavior of the hero's sword attack
	 * 
	 * @author Chris Park
	 */
	public class Sword extends AbstractItem
	{
		/** Direction of travel. */
		public var sDirection			:String;
		/** Movement speed of the sword.*/
		public var MOVE_SPEED			:Number = 16;
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Constructs the Sword object.
		 */
		public function Sword($startX:Number, $startY:Number, $direction:String)
		{
			super("sword");
			
			this._sObjectType = GameObjectType.TYPE_WEAPON;
			addCollidableType(GameObjectType.TYPE_ENEMY);
			
			this.x = $startX;
			this.y = $startY;
			this.nAttackPower = 8;
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
			if (this.sDirection == "right")
			{
				if (this.x > StageRef.stage.stageWidth)
				{
					this.bActive = false;
					CollisionManager.instance.remove(this);
					this.cleanupSignal.dispatch(this);
					return;
				}
				
				this.x += MOVE_SPEED;
			}
			
			if (this.sDirection == "left")
			{
				if (this.x < 0)
				{
					this.bActive = false;
					CollisionManager.instance.remove(this);
					this.cleanupSignal.dispatch(this);
					return;
				}
				
				this.x -= MOVE_SPEED;
			}
			
			if (this.sDirection == "up")
			{
				if (this.y < 0)
				{
					this.bActive = false;
					CollisionManager.instance.remove(this);
					this.cleanupSignal.dispatch(this);
					return;
				}
				
				this.y -= MOVE_SPEED;
			}
			
			if (this.sDirection == "down")
			{
				if (this.y > StageRef.stage.stageHeight)
				{
					this.bActive = false;
					CollisionManager.instance.remove(this);
					this.cleanupSignal.dispatch(this);
					return;
				}
				
				this.y += MOVE_SPEED;
			}
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		override public function collidedWith($object:AbstractGameObject):void
		{
			/*
			if ($object.objectType == GameObjectType.TYPE_ENEMY)
			{
				this.bActive = false;
				CollisionManager.instance.remove(this);
				this.cleanupSignal.dispatch(this);
			}
			*/
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
	}
}

