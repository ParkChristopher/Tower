package com.chrisp.screens
{
	import com.chrisp.collision.CollisionManager;
	import com.chrisp.collision.GameObjectType;
	import com.chrisp.objects.AbstractGameObject;
	import com.chrisp.objects.entities.AbstractEntity;
	import com.chrisp.objects.entities.Ghost;
	import com.chrisp.objects.entities.Hero;
	import com.chrisp.objects.items.Potion;
	import com.natejc.utils.StageRef;
	import flash.events.TimerEvent;
	import flash.text.TextField;
	import flash.utils.Timer;
	import com.greensock.loading.LoaderMax;
	
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
		/** Array that holds all enemies added to the Game Screen.*/
		public var aEnemies				:Array;
		/**Array that holds all attacks currently unleashed by the player. */
		public var aHeroAttacks			:Array;
		/**Array that holds items obtainable by the hero. */
		public var aItems				:Array;
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
		/** Current Score Multiplier */
		public var nMultiplier			:Number = 0;
		/** Base Score Multiplier */
		public var nBaseMultiplier		:Number = 0;
		/** Health multiplier that increases enemy difficulty*/
		public var nHealthMultiplier	:Number = 0;
		/** Hero's kill count*/
		public var nKillCount			:Number = 0;
		
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
			CollisionManager.instance.reset();
			CollisionManager.instance.begin();
			
			parseXML();
			
			this.txtScore.text = this.nScore.toString();
			this.aEnemies = new Array();
			this.aHeroAttacks = new Array();
			this.aItems = new Array();
			
			this.spawnTimer = new Timer(750);
			this.spawnTimer.addEventListener(TimerEvent.TIMER, spawnEnemy);
			
			this.itemTimer = new Timer(10000);
			this.itemTimer.addEventListener(TimerEvent.TIMER, spawnItem);
			
			spawnHero(StageRef.stage.stageWidth * 0.5, StageRef.stage.stageHeight * 0.75);
			
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
			CollisionManager.instance.end();
			
			this.spawnTimer.removeEventListener(TimerEvent.TIMER, spawnEnemy);
			this.spawnTimer.stop();
			
			this.itemTimer.removeEventListener(TimerEvent.TIMER, spawnItem);
			this.itemTimer.stop();
			
			
			this.mcHero.end();
			this.removeChild(mcHero);
			
			//Clean up any enemies
			for (i = 0; i < aEnemies.length; i++)
			{
				this.aEnemies[i].end();
				this.removeChild(aEnemies[i]);
			}
			
			//Clean up any on screen attacks.
			for (i = 0; i < aHeroAttacks.length; i++)
			{
				this.aHeroAttacks[i].end();
				this.removeChild(aHeroAttacks[i]);
			}
			
			//Clean up any items
			for (i = 0; i < aItems.length; i++)
			{
				this.aItems[i].end();
				this.removeChild(aItems[i]);
			}
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Parses the relevant data from the xml config file for this object.
		 */
		protected function parseXML():void
		{
			var xConfig:XML = LoaderMax.getContent("xmlConfig");
			this.nScore = Number(xConfig.scoring.initial);
			this.nBaseMultiplier = Number(xConfig.scoring.multiplier);
			this.nHealthMultiplier = Number(xConfig.difficulty.healthModifier);
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Updates the health text on the screen.
		 * 
		 * @param	$health Number.
		 */
		public function updateHealthText($health:Number):void
		{
			txtHealth.text = $health.toString();
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Signals that the game has ended.
		 */
		public function gameEnded():void
		{
			this.screenCompleteSignal.dispatch();
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/*
		 * Initializes the enemies for level.
		 */
		public function initEnemy($enemy:AbstractEntity):void
		{
			$enemy.readyToMoveSignal.add(targetRequest);
			$enemy.x = Math.random() * this.stage.stageWidth;
			$enemy.y = Math.random() * this.stage.stageHeight * 0.45;
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Spawns enemies for the hero to battle with.
		 * 
		 * @param	$e	TimerEvent.
		 */
		public function spawnEnemy($e:TimerEvent):void
		{
			
			var ghost :Ghost = new Ghost(this.mcHero);
			
			initEnemy(ghost);
			CollisionManager.instance.add(ghost);
			this.aEnemies.push(ghost);
			this.addChild(ghost);
			ghost.cleanupSignal.add(cleanupObject);
			ghost.begin();
			ghost.nHealth += nHealthMultiplier * nKillCount;
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Spawns the hero at the specified location on the game map.
		 * 
		 * @param	$x	Position x,	Number
		 * @param	$y	Position y,	Number
		 */
		public function spawnHero($x:Number, $y:Number):void
		{
			this.mcHero = new Hero();
			this.mcHero.x = $x;
			this.mcHero.y = $y;
			
			CollisionManager.instance.add(this.mcHero);
			this.addChild(mcHero);
			this.txtHealth.text = this.mcHero.nHealth.toString();
			this.mcHero.attackSignal.add(addHeroAttack);
			this.mcHero.heroDiedSignal.add(gameEnded);
			this.mcHero.healthUpdateSignal.add(updateHealthText);
			this.mcHero.resetMultiplierSignal.add(resetMultiplier);
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
			
			CollisionManager.instance.add(pickupItem);
			this.aItems.push(pickupItem);
			this.addChild(pickupItem);
			pickupItem.cleanupSignal.add(cleanupObject);
			pickupItem.begin();
		}
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Adds a hero attack to aHeroAttacks for collision checks 
		 * 
		 * @param	$attackItem AbstractGameobject
		 */
		public function addHeroAttack($attackItem:AbstractGameObject):void
		{	
			CollisionManager.instance.add($attackItem);
			this.aHeroAttacks.push($attackItem);
			this.addChildAt($attackItem, 1);
			$attackItem.cleanupSignal.add(cleanupObject);
			$attackItem.begin();
			
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Responds to a game objects request for the heros information.
		 * @param	$object the object requesting a target
		 */
		public function targetRequest($object:AbstractGameObject):void
		{
			$object.currentTarget = this.mcHero;
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Resets the current score multiplier
		 */
		public function resetMultiplier():void
		{
			this.nMultiplier = 0;
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Cleans up objects while the game is being played.
		 * 
		 * @param	$object AbstractGameObject.
		 */
		public function cleanupObject($object:AbstractGameObject):void
		{
			var tempArray	:Array;
			
			if ($object.objectType == GameObjectType.TYPE_COLLECTIBLE)
			{
				tempArray = this.aItems;
				removefromPlay($object, tempArray);
				this.aItems = tempArray;
				return;
			}
			
			if ($object.objectType == GameObjectType.TYPE_ENEMY)
			{
				nKillCount++;
				trace("Kill count is: " + nKillCount.toString());
				
				
				nScore += ($object.nValue + ($object.nValue * nMultiplier));
				nMultiplier += nBaseMultiplier;
				if (nMultiplier > 3.0)
					nMultiplier = 3.0;
					
				txtScore.text = nScore.toString();
				tempArray = this.aEnemies;
				removefromPlay($object, tempArray);
				this.aEnemies = tempArray;
				return;
			}
			
			if ($object.objectType == GameObjectType.TYPE_WEAPON)
			{
				tempArray = this.aHeroAttacks;
				removefromPlay($object, tempArray);
				this.aHeroAttacks = tempArray;
				return;
			}
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Removes an object from play.
		 * 
		 * @param	$object			AbstractGameObject to be removed.
		 * @param	$objectArray 	Array that contains the object.
		 */
		public function removefromPlay($object:AbstractGameObject, $objectArray:Array):void
		{
			var objectIndex :int = $objectArray.indexOf($object);
			
			//Debug line.
			if ($object == null)
				return;
			
			if (objectIndex >= 0)
				{
					$object.end();
					this.removeChild($object);
					$objectArray.splice(objectIndex, 1);
				}
		}
		
		/* ---------------------------------------------------------------------------------------- */
	}
}

