package com.chrisp.screens
{
	import flash.display.MovieClip;
	
	/**
	 * Base class for screens.
	 * 
	 * @author Chris Park
	 */
	public class BaseScreen extends MovieClip
	{
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Constructs the BaseScreen object.
		 */
		public function BaseScreen()
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

