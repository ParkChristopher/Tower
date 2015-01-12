package com.chrisp.screens
{
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import com.chrisp.objects.entities.Ghost;
	import com.chrisp.objects.entities.Hero;
	import com.chrisp.objects.items.Potion;
	
	/**
	 * Provides first floor of the game, and listend for events
	 * from contained objects.
	 * 
	 * @author Chris Park
	 */
	public class GameScreen extends MovieClip
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
			
			this.mouseEnabled	= false;
			this.mouseChildren	= false;
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Relinquishes all memory used by this object.
		 */
		public function destroy():void
		{	
			while (this.numChildren > 0)
				this.removeChildAt(0);
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
			this.mcHero.removeEventListener(Event.ENTER_FRAME, mcHero.checkForAction)
			this.mcHero.end();
			
			this.mcGhost.end();
			this.mcPotion.end();
		}
		/* ---------------------------------------------------------------------------------------- */	
	}
}

