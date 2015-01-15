package com.chrisp.screens
{
	
	/**
	 * Shows relevant results of a play of the game.
	 * 
	 * @author Chris Park
	 */
	public class ResultScreen extends BaseScreen
	{
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Constructs the ResultScreen object.
		 */
		public function ResultScreen()
		{
			super();
		}
		
		/* ---------------------------------------------------------------------------------------- */		
		
		/**
		 * Initializes this screen.
		 */
		public function begin():void
		{
			this.visible = true;
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Ends use of this screen.
		 */
		public function end():void
		{
			this.visible = false;
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
	}
}

