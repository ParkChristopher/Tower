package com.chrisp.screens
{
	import com.greensock.*;
	import com.greensock.easing.*;
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	import org.osflash.signals.Signal;
	import treefortress.sound.SoundAS;
	
	/**
	 * Controls the game flow and transitions between screens.
	 * 
	 * @author Chris Park
	 */
	public class TitleScreen extends FadeScreen
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
			super.begin();
			
			this.btPlay.addEventListener(MouseEvent.CLICK, playClicked);
			this.btCredits.addEventListener(MouseEvent.CLICK, creditsClicked);
			TweenMax.from(mcTower, 1.5, { x:100, ease:Bounce.easeOut } );
			TweenMax.from(mcClouds, 1.5, { x:700, ease:Quad.easeInOut } );
			TweenMax.from(btCredits, .8, { x: 0, ease:Bounce.easeOut } );
			TweenMax.from(btPlay, 1.2, { x: 0, ease:Bounce.easeOut } );
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		override public function show():void
		{
			super.show();
			
			SoundAS.fadeTo("TitleMusic", 1);
			SoundAS.playLoop("TitleMusic");
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Ends use of this screen.
		 */
		override public function end():void
		{
			super.end();
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		override public function hide():void
		{
			super.hide();
			
			SoundAS.fadeTo("TitleMusic", 0);
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
		
		/**
		 * Signals that the credits button has been clicked
		 * 
		 * @param	$e Mouse Event.
		 */
		private function creditsClicked($e:MouseEvent):void
		{
			this.creditsSignal.dispatch();
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
	}
}