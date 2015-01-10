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
		public var btPlay :SimpleButton;
		public var sigPlay :Signal = new Signal();
		
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
		 * Transitions to the game screen.
		 */
		private function playClicked($e:MouseEvent):void
		{
			this.visible = false;
			this.sigPlay.dispatch();
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Releases all resources used by the class.
		 */
		public function destroy():void
		{
			
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
	}
}