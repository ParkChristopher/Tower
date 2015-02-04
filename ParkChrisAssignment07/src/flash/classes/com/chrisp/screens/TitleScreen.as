package com.chrisp.screens
{
	import com.greensock.*;
	import com.greensock.easing.*;
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	import flash.net.SharedObject;
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
		/** Audio on button. */
		public var btAudioOn		:SimpleButton;
		/** Audio off button. */
		public var btAudioOff		:SimpleButton;
		/** Tower Graphic */
		public var mcTower			:MovieClip;
		/** Cloud Graphic */
		public var mcClouds			:MovieClip;
		/** Credits Screen Signal. */
		public var creditsSignal	:Signal = new Signal();
		
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
			this.btAudioOff.addEventListener(MouseEvent.CLICK, audioOffClicked);
			this.btAudioOn.addEventListener(MouseEvent.CLICK, audioOnClicked);
			
			var so:SharedObject = SharedObject.getLocal("audio");
			
			if (so.size == 0)
				so.data.mute = false;
			
			if (so.data.mute == true)
			{
				SoundAS.fadeMasterTo(0, 0, true);
				this.btAudioOn.visible = false;
				this.btAudioOff.visible = true;
			}
			else
				this.audioOffClicked();
			
			TweenMax.from(mcTower, 1.5, { x:100, ease:Bounce.easeOut } );
			TweenMax.from(mcClouds, 1.5, { x:700, ease:Quad.easeInOut } );
			TweenMax.from(btCredits, .8, { x: 0, ease:Bounce.easeOut } );
			TweenMax.from(btPlay, 1.2, { x: 0, ease:Bounce.easeOut } );
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Shows the screen and initializes any properties associated with the screen starting.
		 */
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
			
			this.btPlay.removeEventListener(MouseEvent.CLICK, playClicked);
			this.btCredits.removeEventListener(MouseEvent.CLICK, creditsClicked);
			this.btAudioOff.removeEventListener(MouseEvent.CLICK, audioOffClicked);
			this.btAudioOn.removeEventListener(MouseEvent.CLICK, audioOnClicked);
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Hides the screen and performs any actions related to the screen ending.
		 */
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
			SoundAS.playFx("ButtonSound");
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
			SoundAS.playFx("ButtonSound");
			this.creditsSignal.dispatch();
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Mutes the audio.
		 * 
		 * @param	$e MouseEvent.
		 */
		protected function audioOnClicked($e:MouseEvent = null):void
		{
			var so:SharedObject = SharedObject.getLocal("audio");
			
			so.data.mute = true;
			SoundAS.playFx("ButtonSound");
			this.btAudioOn.visible = false;
			this.btAudioOff.visible = true;
			SoundAS.fadeMasterTo(0);
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Unmutes the game audio.
		 * 
		 * @param	$e MouseEvent.
		 */
		protected function audioOffClicked($e:MouseEvent = null):void
		{
			var so:SharedObject = SharedObject.getLocal("audio");
			
			so.data.mute = false;
			
			this.btAudioOff.visible = false;
			this.btAudioOn.visible = true;
			SoundAS.fadeMasterTo(1);
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
	}
}