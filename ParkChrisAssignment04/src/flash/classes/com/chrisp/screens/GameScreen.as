package com.chrisp.screens
{
	import com.chrisp.objects.entities.AbstractEntity;
	import com.chrisp.objects.entities.Ghost;
	import com.chrisp.objects.entities.Hero;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	/**
	 * Controls game flow.
	 * 
	 * @author Chris Park
	 */
	public class GameScreen extends AbstractScreen
	{
		
		public var mcHero				:Hero;
		public var btEndGame			:SimpleButton;
		public var vEnemies				:Vector.<AbstractEntity>;
		public var spawnTimer			:Timer;
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Constructs the GameScreen object.
		 */
		public function GameScreen()
		{
			super();
			this.mouseEnabled	= true;
			this.mouseChildren	= true;
			
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Initializes everything for this object.
		 */
		override public function begin():void
		{
			this.visible = true;
			
			this.vEnemies = new Vector.<AbstractEntity>();
			this.btEndGame.addEventListener(MouseEvent.CLICK, gameEnded);
			
			
			this.spawnTimer = new Timer(3000 + Math.random() * 5000);
			this.spawnTimer.addEventListener(TimerEvent.TIMER, spawnEnemy);
			
			
			
			this.mcHero.begin();
			this.spawnTimer.start();
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Cleans up resources used by this object
		 */
		override public function end():void
		{
			
			this.btEndGame.removeEventListener(MouseEvent.CLICK, gameEnded);
			this.spawnTimer.removeEventListener(TimerEvent.TIMER, spawnEnemy);
			this.spawnTimer.stop();
			this.mcHero.end();
			
			//NOTE: destroy all children here.
			for (var i:uint = 0; i < vEnemies.length; i++)
			{
				this.vEnemies[i].end();
				this.removeChild(vEnemies[i]);
			}
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Signals that the game has ended.
		 * 
		 * @param	$e MouseEvent.
		 */
		public function gameEnded($e:MouseEvent):void
		{
			this.screenCompleteSignal.dispatch();
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/*
		 * Initializes the enemies for level.
		 */
		public function initEnemy($enemy:AbstractEntity):void
		{
			$enemy.readyToMoveSignal.add(dispatchTarget);
			$enemy.x = Math.random() * this.stage.stageWidth;
			$enemy.y = Math.random() * this.stage.stageHeight * 0.5;
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		public function spawnEnemy($e:TimerEvent)
		{
			var ghost :Ghost = new Ghost();
			
			initEnemy(ghost);
			vEnemies.push(ghost);
			this.addChild(ghost);
			ghost.begin();
		}
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Dispatches a target for the enemy to move to
		 * 
		 * @param	$enemy
		 */
		public function dispatchTarget($enemy:AbstractEntity)
		{
			$enemy.move(mcHero);
		}
	}
}

