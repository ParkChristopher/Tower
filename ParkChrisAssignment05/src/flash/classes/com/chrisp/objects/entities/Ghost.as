package com.chrisp.objects.entities
{
	import com.chrisp.collision.CollisionManager;
	import com.chrisp.collision.GameObjectType;
	import com.chrisp.objects.AbstractGameObject;
	import com.greensock.*;
	import com.greensock.easing.*;
	import flash.display.MovieClip;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	/**
	 * Dictates the functionality and information for a ghost enemy.
	 * 
	 * @author Chris Park
	 */
	public class Ghost extends AbstractEntity
	{
		/** Ghost movement speed. */
		public var MOVE_SPEED		:Number = 35;
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Constructs the Ghost object.
		 */
		public function Ghost()
		{
			super("Ghost", 20);
			this.nAttackPower = 20;
			this.nValue = 100;
			this._sObjectType = GameObjectType.TYPE_ENEMY;
			addCollidableType(GameObjectType.TYPE_HERO);
			addCollidableType(GameObjectType.TYPE_WEAPON);
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Initializes this object.
		 */
		override public function begin():void
		{
			super.begin();
			
			this.bActive = true;
			this.movementTimer = new Timer(250 + Math.random() * 1000 );
			this.movementTimer.addEventListener(TimerEvent.TIMER, actionReady);
			this.movementTimer.start();
			TweenMax.to(this, 2, {glowFilter:{color:0xffff99, alpha:1, blurX:15, blurY:20}, yoyo:true, repeat:-1});
			
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Stops object and cleans up resources.
		 */
		override public function end():void
		{
			super.end();
			
			this.bActive = false;
			this.movementTimer.stop();
			this.movementTimer.removeEventListener(TimerEvent.TIMER, actionReady);
			TweenMax.killTweensOf(this);
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Signals to GameScreen that it's ready to move.
		 * 
		 * @param	$e TimerEvent
		 */
		public function actionReady($e:TimerEvent):void
		{	
			this.readyToMoveSignal.dispatch(this);
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Determines movement of enemy.
		 * 
		 * @param	$target MovieClip.
		 */
		override public function move($target:MovieClip):void
		{
			if (this.x < $target.x)
				this.x += MOVE_SPEED;
				
			if (this.x > $target.x)
				this.x -= MOVE_SPEED;
				
			if (this.y < $target.y)
				this.y += MOVE_SPEED;
			
			if (this.y > $target.y)
				this.y -= MOVE_SPEED;
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		override public function collidedWith($object:AbstractGameObject):void
		{
			//trace("Ghost: collided with" + $object.objectType);
			
			if ($object.objectType == GameObjectType.TYPE_WEAPON)
			{
				//this.nHealth -= $object.nAttackPower;
				
				
				//$object.bActive = false;
				//CollisionManager.instance.remove($object);
				//$object.cleanupSignal.dispatch($object);
				
				/*
				if (this.nHealth <= 0)
				{
					this.bActive = false;
					CollisionManager.instance.remove(this);
					this.cleanupSignal.dispatch(this);
				}
				*/
			}
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
	}
}

