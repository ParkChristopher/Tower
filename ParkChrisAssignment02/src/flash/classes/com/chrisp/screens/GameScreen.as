package com.chrisp.screens
{
	import com.chrisp.objects.entities.Ghost;
	import com.chrisp.objects.entities.Hero;
	import com.chrisp.objects.items.Potion;
	import flash.events.Event;
	
	/**
	 * Provides first floor of the game, and listend for events
	 * from contained objects.
	 * 
	 * @author Chris Park
	 */
	public class GameScreen extends BaseScreen
	{
		
		public var mcHero		:Hero;
		public var mcGhost		:Ghost;
		public var mcPotion		:Potion;
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Constructs the GameScreen object.
		 */
		public function GameScreen()
		{
			super();
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Initializes everything for this object.
		 */
		public function begin():void
		{
			this.mcHero.begin();
			this.mcHero.addEventListener(Event.ENTER_FRAME, mcHero.checkForAction);
			
			this.mcGhost.begin();
			this.mcPotion.begin();
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Cleans up resources used by this object
		 */
		public function end():void
		{
			this.mcHero.removeEventListener(Event.ENTER_FRAME, mcHero.checkForAction);
			this.mcHero.end();
			
			this.mcGhost.end();
			this.mcPotion.end();
		}
		
		/* ---------------------------------------------------------------------------------------- */
	}
}

