package com.chrisp.screens
{
	import flash.display.Sprite;

	
	/**
	 * Provides first floor of the game.
	 * 
	 * @author Chris Park
	 */
	public class GameScreen extends Sprite
	{
		
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
		 * Initializes everything for this object.
		 */
		public function begin():void
		{
			
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
		
	}
}

