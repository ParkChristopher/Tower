package com.chrisp.objects.entities
{
	import com.chrisp.collision.GameObjectType;
	import com.chrisp.objects.AbstractGameObject;
	import com.greensock.*;
	import com.greensock.easing.*;
	import com.greensock.loading.LoaderMax;
	import flash.display.MovieClip;
	import flash.events.Event;
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
		public var MOVEMENT_SPEED		:Number = 0;
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Constructs the Ghost object.
		 */
		public function Ghost($currentTarget:AbstractGameObject)
		{
			super("Ghost", 20);
			this._sObjectType = GameObjectType.TYPE_ENEMY;
			this._currentTarget = $currentTarget;
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Initializes this object.
		 */
		override public function begin():void
		{
			super.begin();
			
			this.parseXML();
			this.bActive = true;
			this.addEventListener(Event.ENTER_FRAME, determineAnimation);
			
			this.movementTimer = new Timer(250 + Math.random() * 1000 );
			this.movementTimer.addEventListener(TimerEvent.TIMER, actionReady);
			this.movementTimer.start();
			TweenMax.to(this, 2, {glowFilter:{color:0x9933cc, alpha:1, blurX:15, blurY:20}, yoyo:true, repeat:-1});
			
			this.startFlicker();
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Stops object and cleans up resources.
		 */
		override public function end():void
		{
			super.end();
			
			this.stop();
			this.bActive = false;
			
			this.movementTimer.stop();
			this.movementTimer.removeEventListener(TimerEvent.TIMER, actionReady);
			this.removeEventListener(Event.ENTER_FRAME, determineAnimation);
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
		 * starts ghost movement flicker
		 */
		protected function startFlicker():void
		{
			flicker(this, 1.5, 50);
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
			this.move(_currentTarget);
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
			{
				this.x += MOVEMENT_SPEED;
			}
			
			if (this.x > $target.x)
			{
				this.x -= MOVEMENT_SPEED;
			}
			
			if (this.y < $target.y)
			{
				this.y += MOVEMENT_SPEED;
			}
			
			if (this.y > $target.y)
			{
				this.y -= MOVEMENT_SPEED;
			}
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * determines the direction that most likely faces the hero and calls
		 * to be animated in that direction
		 * 
		 * @param	$e ENTER_FRAME event.
		 */
		protected function determineAnimation($e:Event):void
		{
			var distX				:int;
			var distY				:int;
			var verticleFacing		:String;
			var horizontalFacing	:String;
			
			distX = this.x - _currentTarget.x;
			distY = this.y - _currentTarget.y;
			
			if (distX < 0)
				horizontalFacing = "right";
			else
				horizontalFacing = "left";
				
			if (distY < 0)
				verticleFacing = "down";
			else
				verticleFacing = "up";
			
			if (Math.abs(distX) > Math.abs(distY))
				animate(horizontalFacing);
			else
				animate(verticleFacing);
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Plays the animation associated with the given direction.
		 * 
		 * @param	$direction animation direction to play.
		 */
		protected function animate($direction:String):void
		{
			if ($direction == "left")
			{
				if (this.currentLabel != "walkWest")
					this.gotoAndPlay("walkWest");
			}
			
			if ($direction == "right")
			{
				if (this.currentLabel != "walkEast")
					this.gotoAndPlay("walkEast");
			}
			
			if ($direction == "up")
			{
				if (this.currentLabel != "walkNorth")
					this.gotoAndPlay("walkNorth");
			}
			
			if ($direction == "down")
			{
				if (this.currentLabel != "walkSouth")
					this.gotoAndPlay("walkSouth");
			}
			
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

