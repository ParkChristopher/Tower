package 
{
	import com.natejc.input.KeyboardManager;
	import com.natejc.input.KeyCode;
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	
	
	/**
	 * Drives the project.
	 * 
	 * @author	Nate Chatellier
	 */
	public class Main extends MovieClip
	{
		
		/* ---------------------------------------------------------------------------------------- */
		public var TitleScreen :MovieClip;
		
		/**
		 * Constructs the Main object.
		 */
		public function Main()
		{
			KeyboardManager.init(this.stage);
			
			// start your stuff here
			trace("it's working");
		}

		/* ---------------------------------------------------------------------------------------- */

	}
}

