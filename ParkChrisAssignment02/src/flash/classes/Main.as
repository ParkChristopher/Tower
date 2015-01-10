package 
{
	import com.natejc.input.KeyboardManager;
	import com.natejc.input.KeyCode;
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	import org.osflash.signals.Signal;
	
	
	/**
	 * Drives the project.
	 * 
	 * @author	Chris Park
	 */
	public class Main extends MovieClip
	{
		public var mcTitleScreen :MovieClip;
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Constructs the Main object.
		 */
		public function Main()
		{
			KeyboardManager.init(this.stage);
			
			// start your stuff here
			trace("it's working");
			
			mcTitleScreen.sigPlay.add(playClicked);
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Stops any resources and transitions to GameScreen.
		 */
		public function playClicked()
		{
			trace("Main: Play clicked. Transitioning to GameScreen");
			//start game screen
		}
		
		/* ---------------------------------------------------------------------------------------- */

	}
}

