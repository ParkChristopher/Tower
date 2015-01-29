package com.chrisp.screens
{
	import com.greensock.*;
	import com.greensock.easing.*;
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	import org.osflash.signals.Signal;
	
	/**
	 * Controls the game flow and transitions between screens.
	 * 
	 * @author Chris Park
	 */
	public class TitleScreen extends AbstractScreen
	{
		/** Play Button */
		public var btPlay 			:SimpleButton;
		/** Credits Button*/
		public var btCredits		:SimpleButton;
		/** Tower Graphic */
		public var mcTower			:MovieClip;
		/** Cloud Graphic */
		public var mcClouds			:MovieClip;
		/** Credits Screen Signal. */
		public var creditsSignal	:Signal = new Signal();;
		
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
			this.btCredits.addEventListener(MouseEvent.CLICK, creditsClicked);
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
			this.end();
			this.screenCompleteSignal.dispatch();
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Signals that the credits button has been clicked
		 * 
		 * @param	$e Mouse Event.
		 */
		private function creditsClicked($e:MouseEvent):void
		{
			this.end();
			this.creditsSignal.dispatch();
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
	}
}