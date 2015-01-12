package com.chrisp.screens
{
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	import org.osflash.signals.Signal;
	
	/**
	 * Controls the game flow and transitions between screens.
	 * 
	 * @author Chris Park
	 */
	public class TitleScreen extends MovieClip
	{
		public var btPlay 		:SimpleButton;
		public var sigPlay 		:Signal = new Signal();
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Constructs the TitleScreen object.
		 */
		public function TitleScreen()
		{
			super();
			
			this.btPlay.addEventListener(MouseEvent.CLICK, playClicked);
		}
	
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Releases all resources used by the class.
		 */
		public function destroy():void
		{
			
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Initializes the title screen.
		 */
		public function begin():void
		{
			this.visible = true;
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Ends use of the title screen.
		 */
		public function end():void
		{
			this.visible = false;
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Signals that the play button has been clicked.
		 * 
		 * @param	$e		Mouse event.
		 */
		private function playClicked($e:MouseEvent):void
		{
			this.sigPlay.dispatch();
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
	}
}