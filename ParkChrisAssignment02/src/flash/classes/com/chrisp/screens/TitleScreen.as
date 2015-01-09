package com.chrisp.screens
{
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	import org.osflash.signals.Signal;
	/**
	 * ...
	 * @author Chris Park
	 */
	
	
	public class TitleScreen extends MovieClip
	{
		public var btPlay :SimpleButton;
		public var sigPlayClicked :Signal = new Signal();
		
		public function TitleScreen()
		{
			this.sigPlayClicked.add(playClicked);
			this.btPlay.addEventListener(MouseEvent.CLICK, playClicked);	
		}
	
		private function playClicked(e:MouseEvent):void
		{
			this.sigPlayClicked.dispatch();
			trace("Play");
		}
	}
	
	
	
}