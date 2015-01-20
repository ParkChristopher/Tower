package com.chrisp.screens
{
	import com.chrisp.objects.entities.AbstractEntity;
	import com.chrisp.objects.entities.Ghost;
	import com.chrisp.objects.entities.Hero;
	import com.chrisp.objects.items.AbstractItem;
	import flash.display.SimpleButton;
	import flash.events.Event;
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
		
		/** Hero object. */
		public var mcHero				:Hero;
		/** Temporary button to end the play cycle. */
		public var btEndGame			:SimpleButton;
		/** Vector that holds all enemies added to the Game Screen.*/
		public var vEnemies				:Vector.<AbstractEntity>;
		/**Vector that holds all attacks currently unleashed by the player. */
		public var vHeroAttacks			:Vector.<AbstractItem>;
		/** Timer that triggers a new enemy spawn on the Game Screen.*/
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
			this.vHeroAttacks = new Vector.<AbstractItem>();
			
			this.btEndGame.addEventListener(MouseEvent.CLICK, gameEnded);
			this.addEventListener(Event.ENTER_FRAME, checkCollision);
			
			this.spawnTimer = new Timer(3000 + Math.random() * 5000);
			this.spawnTimer.addEventListener(TimerEvent.TIMER, spawnEnemy);
			
			
			spawnHero(480, 450);
			this.mcHero.attackSignal.add(addHeroAttack);
			this.spawnTimer.start();
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Cleans up resources used by this object
		 */
		override public function end():void
		{
			var i	:uint;
			
			super.end();

			this.removeEventListener(Event.ENTER_FRAME, checkCollision);
			this.btEndGame.removeEventListener(MouseEvent.CLICK, gameEnded);
			this.spawnTimer.removeEventListener(TimerEvent.TIMER, spawnEnemy);
			this.spawnTimer.stop();
			
			this.mcHero.end();
			this.removeChild(mcHero);
			
			//Clean up any enemies
			for (i = 0; i < vEnemies.length; i++)
			{
				this.vEnemies[i].end();
				this.removeChild(vEnemies[i]);
			}
			
			//Clean up any on screen attacks.
			for (i = 0; i < vHeroAttacks.length; i++)
			{
				this.vHeroAttacks[i].end();
				this.removeChild(vHeroAttacks[i]);
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
		
		/**
		 * Spawns enemies for the hero to battle with.
		 * @param	$e	TimerEvent.
		 */
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
		 * Spawns the hero at the specified location on the game map.
		 * @param	$x	Position x,	Number
		 * @param	$y	Position y,	Number
		 */
		public function spawnHero($x:Number, $y:Number)
		{
			this.mcHero = new Hero();
			mcHero.x = $x;
			mcHero.y = $y;
			this.addChild(mcHero);
			this.mcHero.begin();
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/** Adds a hero attack to vHeroAttacks for collision checks */
		public function addHeroAttack($attackItem:AbstractItem):void
		{	
			vHeroAttacks.push($attackItem);
			this.addChild($attackItem);
			$attackItem.cleanupSignal.add(cleanupObjects);
			$attackItem.begin();
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
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * checks for objects that need to be removed during play.
		 */
		public function cleanupObjects():void
		{
			var i	:uint;
			var tempVector :Vector.<AbstractItem> = new Vector.<AbstractItem>();
			
			for (i = 0; i < vHeroAttacks.length; i++)
			{
				if (vHeroAttacks[i].bActive == false)
				{
					this.removeChild(vHeroAttacks[i]);
				}
				else
				{
					tempVector.push(vHeroAttacks[i]);
				}
			}
			
			vHeroAttacks = tempVector;
		}
		
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Checks game board for collisions.
		 * @param	$e	ENTER_FRAME Event.
		 */
		public function checkCollision($e:Event)
		{
				for (var i:uint = 0; i < vEnemies.length; i++)
				{
					if (vEnemies[i].mcHitbox.hitTestObject(mcHero.mcHitbox))
						trace("Collision! " + i);
				}
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Looks for a collision between the hero and an enemy.
		 */
		public function checkHeroCollision()
		{
			//if hero is colliding with an enemey
			//damage the hero with that enemies attack power
			//if the hero's health <= 0
			//destroy him
			//end the game
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Checks if the Hero's attack connects with an enemy.
		 */
		public function checkHeroAttackCollision()
		{
			//check all enemeies for collision with attack.
			//if a collision is found
			//damage the entity
			//remove instance of attack
			//if entity health is <= 0 destroy it.
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
	}
}

