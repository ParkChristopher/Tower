package com.chrisp.screens
{
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import org.osflash.signals.Signal;
	import flash.display.SimpleButton;
	
	/**
	 * Shows relevant results of a play of the game.
	 * 
	 * @author Chris Park
	 */
	public class ResultScreen extends AbstractScreen
	{
		/** Button to return to the title screen. */
		public var btReturn			:SimpleButton;
		/** Ending score display*/
		public var txtResultScore	:TextField;
		
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
		public function updateScore($score:String):void
		{
			this.txtResultScore.text = $score;
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
	}
}

