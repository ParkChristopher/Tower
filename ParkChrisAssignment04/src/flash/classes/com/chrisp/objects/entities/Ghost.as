package com.chrisp.objects.entities
{
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
		public var MOVE_SPEED		:Number = 30;
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Constructs the Ghost object.
		 */
		public function Ghost()
		{
			super("Ghost", 20);
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Initializes this object.
		 */
		override public function begin():void
		{
			bActive = true;
			this.movementTimer = new Timer(500 + Math.random() * 1500 );
			this.movementTimer.addEventListener(TimerEvent.TIMER, actionReady);
			this.movementTimer.start();
			this.visible = true;
			TweenMax.to(this, 2, {glowFilter:{color:0xffff99, alpha:1, blurX:15, blurY:20}, yoyo:true, repeat:-1});
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Stops object and cleans up resources.
		 */
		override public function end():void
		{
			this.visible = false;
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
		
	}
}

