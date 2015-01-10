package com.chrisp.screens
{
	import flash.display.MovieClip;
	import com.chrisp.objects.entities.Hero;
	/**
	 * Provides first floor of the game.
	 * 
	 * @author Chris Park
	 */
	public class GameScreen extends MovieClip
	{
		
		public var mcHero		:Hero;
		
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
			
		}
		
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Cleans up resources used by this object
		 */
		public function end():void
		{
			
		}
		/* ---------------------------------------------------------------------------------------- */		
		
		
		
	}
}

