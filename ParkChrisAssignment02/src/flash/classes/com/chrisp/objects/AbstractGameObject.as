package com.chrisp.
{
	import flash.display.Sprite;

	
	/**
	 * Base class for all game objects
	 * 
	 * @author Nate Chatellier
	 */
	public class AbstractGameObject extends Sprite
	{
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Constructs the AbstractGameObject object.
		 */
		public function AbstractGameObject()
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
		
	}
}

