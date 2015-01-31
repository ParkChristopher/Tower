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
		/** Signals that the screen has completed its intended purpose. */
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
		 * Initializes this screen.
		 */
		public function begin():void
		{
			show();
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Shows the screen
		 */
		public function show():void
		{
			this.visible = true;
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Ends use of this screen.
		 */
		public function end():void
		{
			hide();
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Hides the screen
		 */
		public function hide():void
		{
			this.visible = false;
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

