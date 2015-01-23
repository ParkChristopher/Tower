package com.chrisp.screens
{
	import com.chrisp.objects.AbstractGameObject;
	import com.chrisp.objects.entities.AbstractEntity;
	import com.chrisp.objects.entities.Ghost;
	import com.chrisp.objects.entities.Hero;
	import com.chrisp.objects.items.AbstractItem;
	import com.chrisp.objects.items.Potion;
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.text.TextField;
	import flash.utils.Timer;
	import com.natejc.utils.StageRef;
	
	
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
		//public var btEndGame			:SimpleButton;
		/** Vector that holds all enemies added to the Game Screen.*/
		public var vEnemies				:Vector.<AbstractEntity>;
		/**Vector that holds all attacks currently unleashed by the player. */
		public var vHeroAttacks			:Vector.<AbstractItem>;
		/**Vector that holds items obtainable by the hero. */
		public var vItems				:Vector.<AbstractItem>;
		/** Timer that triggers a new enemy spawn on the Game Screen.*/
		public var spawnTimer			:Timer;
		/** Timer that triggers the spawn of an item*/
		public var itemTimer			:Timer;
		/** Onscreen Score Display */
		public var txtScore				:TextField;
		/** Onscreen Health display*/
		public var txtHealth			:TextField;
		/** Numerical score */
		public var nScore				:Number;
		
		
		
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
			
			this.nScore = 0;
			this.txtScore.text = this.nScore.toString();
			this.vEnemies = new Vector.<AbstractEntity>();
			this.vHeroAttacks = new Vector.<AbstractItem>();
			this.vItems = new Vector.<AbstractItem>();
			
			this.addEventListener(Event.ENTER_FRAME, checkCollision);
			
			this.spawnTimer = new Timer(750);
			this.spawnTimer.addEventListener(TimerEvent.TIMER, spawnEnemy);
			
			this.itemTimer = new Timer(5000);
			this.itemTimer.addEventListener(TimerEvent.TIMER, spawnItem);
			
			spawnHero(StageRef.stage.stageWidth * 0.5, StageRef.stage.stageHeight * 0.75);
			this.mcHero.attackSignal.add(addHeroAttack);
			this.txtHealth.text = this.mcHero.nHealth.toString();
			this.spawnTimer.start();
			this.itemTimer.start();
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
			
			this.spawnTimer.removeEventListener(TimerEvent.TIMER, spawnEnemy);
			this.spawnTimer.stop();
			
			this.itemTimer.removeEventListener(TimerEvent.TIMER, spawnItem);
			this.itemTimer.stop();
			
			
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
			
			//Clean up any items
			for (i = 0; i < vItems.length; i++)
			{
				this.vItems[i].end();
				this.removeChild(vItems[i]);
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
			$enemy.y = Math.random() * this.stage.stageHeight * 0.45;
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Spawns enemies for the hero to battle with.
		 * @param	$e	TimerEvent.
		 */
		public function spawnEnemy($e:TimerEvent):void
		{
			var ghost :Ghost = new Ghost();
			
			initEnemy(ghost);
			this.vEnemies.push(ghost);
			this.addChild(ghost);
			ghost.begin();
		}
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Spawns the hero at the specified location on the game map.
		 * @param	$x	Position x,	Number
		 * @param	$y	Position y,	Number
		 */
		public function spawnHero($x:Number, $y:Number):void
		{
			this.mcHero = new Hero();
			this.mcHero.x = $x;
			this.mcHero.y = $y;
			this.addChild(mcHero);
			this.mcHero.begin();
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Spawns an item for the hero to collect
		 * 
		 * @param	$e TimerEvent.
		 */
		public function spawnItem($e:TimerEvent):void
		{
			var pickupItem	:Potion = new Potion();
			this.addChild(pickupItem);
			this.vItems.push(pickupItem);
			pickupItem.begin();
		}
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Adds a hero attack to vHeroAttacks for collision checks 
		 */
		public function addHeroAttack($attackItem:AbstractItem):void
		{	
			this.vHeroAttacks.push($attackItem);
			this.addChild($attackItem);
			$attackItem.begin();
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Dispatches a target for the enemy to move to
		 * 
		 * @param	$enemy
		 */
		public function dispatchTarget($enemy:AbstractEntity):void
		{
			$enemy.move(mcHero);
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Cleans up enemies. To be replaced by generic cleanup function
		 */
		public function cleanupEnemies():void
		{
			var vTempVector		:Vector.<AbstractEntity> = new Vector.<AbstractEntity>();
			
			for (var i:uint = 0; i < this.vEnemies.length; i++)
			{
				if (!this.vEnemies[i].bActive)
				{
					if (this.contains(this.vEnemies[i]))
					{
						this.vEnemies[i].end();
						this.removeChild(this.vEnemies[i]);
					}
				}
				else
				{
					vTempVector.push(this.vEnemies[i]);
				}
			}
			
			this.vEnemies = vTempVector;
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Cleans up swords. To be replaced with generic cleanup function
		 */
		public function cleanupSwords():void
		{
			var vTempVector :Vector.<AbstractItem> = new Vector.<AbstractItem>();
			
			for (var i:uint = 0; i < this.vHeroAttacks.length; i++)
			{
				if (!this.vHeroAttacks[i].bActive)
				{
					if (this.contains(this.vHeroAttacks[i]))
					{
						this.vHeroAttacks[i].end();
						this.removeChild(this.vHeroAttacks[i]);
					}
				}
				else
				{
					vTempVector.push(this.vHeroAttacks[i]);
				}
			}
			
			this.vHeroAttacks = vTempVector;
		}
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Cleans up Items, to be replaced with generic.
		 */
		public function cleanupItems():void
		{
			var vTempVector	:Vector.<AbstractItem> = new Vector.<AbstractItem>();
			
			for (var i:uint = 0; i < this.vItems.length; i++)
			{
				if (!this.vItems[i].bActive)
				{
					if (this.contains(this.vItems[i]))
					{
						this.vItems[i].end();
						this.removeChild(this.vItems[i]);
					}
				}
				else
				{
					vTempVector.push(vItems[i]);
				}
			}
			
			this.vItems = vTempVector;
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Checks game board for collisions.
		 * 
		 * @param	$e	ENTER_FRAME Event.
		 */
		public function checkCollision($e:Event):void
		{
			checkHeroCollision();
			checkHeroAttackCollision();
			checkItemCollision();
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Looks for a collision between the hero and an enemy.
		 */
		public function checkHeroCollision():void
		{
			
			//Return if hero is invulnerable.
			if (!this.mcHero.bActive)
				return;
			
			for (var i:uint = 0; i < vEnemies.length; i++)
			{
				if (this.vEnemies[i].mcHitbox.hitTestObject(this.mcHero.mcHitbox))
				{
						trace("GameScreen: Collision! " + i);
						this.mcHero.nHealth -= this.vEnemies[i].nAttackPower;
						this.txtHealth.text = this.mcHero.nHealth.toString();
						this.mcHero.becomeInvulnerable();
						
						trace("GameScreen: Hero Health: " + this.mcHero.nHealth);
						if (this.mcHero.nHealth <= 0)
							this.screenCompleteSignal.dispatch();
						
						break;
				}
			}
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Looks for a collision between the hero and an item.
		 */
		public function checkItemCollision():void
		{
			for (var i:uint = 0; i < vItems.length; i++)
			{
				if (this.mcHero.mcHitbox.hitTestObject(this.vItems[i].mcHitbox))
				{
					//NOTE: check for max health after leveling system is in place.
					this.mcHero.nHealth += this.vItems[i].nValue;
					this.txtHealth.text = this.mcHero.nHealth.toString();
					trace("GameScreen: Hero health +" + vItems[i].nValue);
					this.vItems[i].bActive = false;
				}
			}
			
			cleanupItems();
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Checks if the Hero's attack connects with an enemy.
		 */
		public function checkHeroAttackCollision():void
		{		
			for (var i:uint = 0; i < this.vHeroAttacks.length; i++)
			{
				for (var j:uint = 0; j < this.vEnemies.length; j++)
				{
					if (this.vHeroAttacks[i].hitTestObject(this.vEnemies[j]))
					{
						trace("GameScreen: Weapon " + i + " struck Enemy " + j);
						this.vEnemies[j].nHealth -= this.vHeroAttacks[i].nAttackPower;
						
						if (this.vEnemies[j].nHealth <= 0)
						{
							this.vEnemies[j].bActive = false;
							this.nScore += this.vEnemies[j].nValue;
							this.txtScore.text = this.nScore.toString();
						}
						this.vHeroAttacks[i].bActive = false;
					}
				}
			}
			
			cleanupSwords();
			cleanupEnemies();
			
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
	}
}

