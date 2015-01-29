package com.chrisp.objects.entities
{
	import com.chrisp.collision.GameObjectType;
	import com.chrisp.objects.AbstractGameObject;
	import com.greensock.*;
	import com.greensock.easing.*;
	import flash.display.MovieClip;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import com.greensock.loading.LoaderMax;
	
	/**
	 * Dictates the functionality and information for a ghost enemy.
	 * 
	 * @author Chris Park
	 */
	public class Ghost extends AbstractEntity
	{
		/** Ghost movement speed. */
		public var MOVEMENT_SPEED		:Number = 0;
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Constructs the Ghost object.
		 */
		public function Ghost()
		{
			super("Ghost", 20);
			//this.nAttackPower = 20;
			//this.nValue = 100;
			this._sObjectType = GameObjectType.TYPE_ENEMY;
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Initializes this object.
		 */
		override public function begin():void
		{
			super.begin();
			
			parseXML();
			this.bActive = true;
			this.movementTimer = new Timer(250 + Math.random() * 1000 );
			this.movementTimer.addEventListener(TimerEvent.TIMER, actionReady);
			this.movementTimer.start();
			TweenMax.to(this, 2, {glowFilter:{color:0x9933cc, alpha:1, blurX:15, blurY:20}, yoyo:true, repeat:-1});
			
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
		 * Parses relevant information for this object
		 */
		override protected function parseXML():void
		{
			var xConfig:XML = LoaderMax.getContent("xmlConfig");
			this.MOVEMENT_SPEED = Number(xConfig.gameobjects.ghost.moveSpeed);
			this.nAttackPower = Number(xConfig.gameobjects.ghost.attackPower);
			this.nHealth = Number(xConfig.gameobjects.ghost.health);
			this.nValue = Number(xConfig.gameobjects.ghost.pointValue);
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
				this.x += MOVEMENT_SPEED;
				
			if (this.x > $target.x)
				this.x -= MOVEMENT_SPEED;
				
			if (this.y < $target.y)
				this.y += MOVEMENT_SPEED;
			
			if (this.y > $target.y)
				this.y -= MOVEMENT_SPEED;
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Responses to collision with another object.
		 * 
		 * @param	$object AbstractGameObject.
		 */
		override public function collidedWith($object:AbstractGameObject):void
		{}
		
		/* ---------------------------------------------------------------------------------------- */
		
	}
}

