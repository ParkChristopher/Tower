package com.chrisp.screens
{
	import com.greensock.*;
	import com.greensock.easing.*;
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	import flash.net.SharedObject;
	import flash.text.TextField;
	
	/**
	 * Shows relevant results of a play of the game.
	 * 
	 * @author Chris Park
	 */
	public class ResultScreen extends FadeScreen
	{
		/**Results screen title */
		public var mcScoreTitle		:MovieClip;
		/**High score header graphic. */
		public var mcHighScore		:MovieClip;
		/**Current score header graphic. */
		public var mcCurrentScore	:MovieClip;
		/** Button to return to the title screen. */
		public var btReturn			:SimpleButton;
		/** Ending score display*/
		public var txtScore			:TextField;
		/** All time high score display. */
		public var txtHighScore		:TextField;
		
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
			super.begin();
			
			this.btReturn.addEventListener(MouseEvent.CLICK, returnToTitle);
			TweenMax.from(mcHighScore, 1.2, { x:600, ease:Bounce.easeOut } );
			TweenMax.from(mcCurrentScore, 1, { x:600, ease:Bounce.easeOut } );
			TweenMax.from(btReturn, 1.5, { y: 0, ease:Bounce.easeOut } );
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Ends use of this screen.
		 */
		override public function end():void
		{
			super.end();
			this.btReturn.removeEventListener(MouseEvent.CLICK, returnToTitle);
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 *  Signals ready for return to title screen.
		 * 
		 * @param	$e		MouseEvent.
		 */
		public function returnToTitle($e:MouseEvent):void
		{
			this.end();
			this.screenCompleteSignal.dispatch();
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Updates the end of game score.
		 * 
		 * @param	$score	String
		 */
		public function updateScore($score:Number):void
		{
			var nHighScore :Number;
			var so:SharedObject = SharedObject.getLocal("data");
			
			if (so.size == 0)
			{
				so.data.highscore = 0;
			}
			
			
			this.txtScore.text = $score.toString();
			
			if (so.data.highscore < $score)
			{
				so.data.highscore = $score;
				this.txtHighScore.text = $score.toString();
			}
			else
			{
				nHighScore = so.data.highscore;
				this.txtHighScore.text = nHighScore.toString();
			}
			
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
	}
}

