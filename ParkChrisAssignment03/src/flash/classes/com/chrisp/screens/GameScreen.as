package com.chrisp.screens
{
	import com.chrisp.objects.entities.Ghost;
	import com.chrisp.objects.entities.Hero;
	import com.chrisp.objects.items.Potion;
	import flash.display.SimpleButton;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 * Provides first floor of the game, and listend for events
	 * from contained objects.
	 * 
	 * @author Chris Park
	 */
	public class GameScreen extends AbstractScreen
	{
		
		public var mcHero		:Hero;
		public var mcGhost		:Ghost;
		public var mcPotion		:Potion;
		public var btEndGame	:SimpleButton;
		
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
			this.btEndGame.addEventListener(MouseEvent.CLICK, gameEnded);
			this.mcHero.addEventListener(Event.ENTER_FRAME, mcHero.checkForAction);
			
			this.mcHero.begin();
			this.mcGhost.begin();
			this.mcPotion.begin();
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Cleans up resources used by this object
		 */
		override public function end():void
		{
			
			this.btEndGame.removeEventListener(MouseEvent.CLICK, gameEnded);
			this.mcHero.removeEventListener(Event.ENTER_FRAME, mcHero.checkForAction);
			
			//this.mcHero.end();
			//this.mcGhost.end();
			//this.mcPotion.end();
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Signals that the game has ended.
		 * 
		 * @param	$e MouseEvent.
		 */
		public function gameEnded($e:MouseEvent)
		{
			this.screenCompleteSignal.dispatch();
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
	}
}

