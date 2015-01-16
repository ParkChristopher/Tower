package com.chrisp.screens
{
	import com.greensock.*;
	import com.greensock.easing.*;
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	
	/**
	 * Controls the game flow and transitions between screens.
	 * 
	 * @author Chris Park
	 */
	public class TitleScreen extends AbstractScreen
	{
		public var btPlay 			:SimpleButton;
		public var mcTower			:MovieClip;
		public var mcClouds			:MovieClip;
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Constructs the TitleScreen object.
		 */
		public function TitleScreen()
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
			this.btPlay.addEventListener(MouseEvent.CLICK, playClicked);
			TweenMax.from(mcTower, 3.0, { x:100, ease:Quad.easeOut } );
			TweenMax.from(mcClouds, 3.0, { x:700, ease:Quad.easeInOut } );
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Ends use of this screen.
		 */
		override public function end():void
		{
			this.visible = false;
			TweenMax.killTweensOf(this);
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Signals that the play button has been clicked.
		 * 
		 * @param	$e		MouseEvent.
		 */
		private function playClicked($e:MouseEvent):void
		{
			this.screenCompleteSignal.dispatch();
		}
		
		/* ---------------------------------------------------------------------------------------- */
	}
}