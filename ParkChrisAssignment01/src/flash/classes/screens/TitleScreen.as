package screens
{
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author Chris Park
	 */
	
	
	public class TitleScreen extends MovieClip
	{
		public var btPlay :SimpleButton;
		
		public function TitleScreen()
		{
			btPlay.addEventListener(MouseEvent.CLICK, playClicked);
		}
	
		private function playClicked(e:MouseEvent):void
		{
			trace("Play");
		}
	}
	
	
	
}