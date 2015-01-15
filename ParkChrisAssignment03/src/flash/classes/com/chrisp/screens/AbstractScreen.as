package com.chrisp.screens
{
	import flash.display.MovieClip;
	import org.osflash.signals.Signal;
	
	/**
	 * Base class for screens.
	 * 
	 * @author Chris Park
	 */
	public class AbstractScreen extends MovieClip
	{
		public var screenCompleteSignal	:Signal = new Signal();
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Constructs the BaseScreen object.
		 */
		public function AbstractScreen()
		{
			super();
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
			this.screenCompleteSignal.dispatch();
			this.visible = false;
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
	}
}

