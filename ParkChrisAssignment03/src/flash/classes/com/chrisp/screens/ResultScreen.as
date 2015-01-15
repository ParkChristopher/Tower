package com.chrisp.screens
{
	import flash.events.MouseEvent;
	import org.osflash.signals.Signal;
	import flash.display.SimpleButton;
	
	/**
	 * Shows relevant results of a play of the game.
	 * 
	 * @author Chris Park
	 */
	public class ResultScreen extends AbstractScreen
	{
		
		public var btReturn			:SimpleButton;
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Constructs the ResultScreen object.
		 */
		public function ResultScreen()
		{
			super();
			this.mouseEnabled	= true;
			this.mouseChildren	= true;
		}
		
		/* ---------------------------------------------------------------------------------------- */		
		
		/**
		 * Initializes this screen.
		 */
		override public function begin():void
		{
			this.visible = true;
			this.btReturn.addEventListener(MouseEvent.CLICK, returnToTitle);
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Ends use of this screen.
		 */
		override public function end():void
		{
			this.visible = false;
			this.btReturn.removeEventListener(MouseEvent.CLICK, returnToTitle);
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 *  Signals ready for return to title screen.
		 * 
		 * @param	$e		MouseEvent.
		 */
		public function returnToTitle($e:MouseEvent)
		{
			this.end();
			this.screenCompleteSignal.dispatch();
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
	}
}

