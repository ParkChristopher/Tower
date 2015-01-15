package com.chrisp.objects
{
	import flash.display.MovieClip;

	
	/**
	 * Base class for all game objects
	 * 
	 * @author Chris Park
	 */
	public class AbstractGameObject extends MovieClip
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

