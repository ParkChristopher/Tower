package 
{
	import com.natejc.input.KeyboardManager;
	import flash.display.MovieClip;
	
	/**
	 * Drives the project.
	 * 
	 * @author	Chris Park
	 */
	public class Main extends MovieClip
	{
		public var mcTitleScreen	:MovieClip;
		public var mcGameScreen		:MovieClip;
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Constructs the Main object.
		 */
		public function Main()
		{
			KeyboardManager.init(this.stage);
			this.mcTitleScreen.sigPlay.add(startGame);
			this.mcTitleScreen.begin();
			this.mcGameScreen.end();
			
			trace("Main: Initialized.");
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Stops any resources and transitions to GameScreen.
		 */
		public function startGame()
		{
			trace("Main: Play clicked. Transitioning to GameScreen");
			this.mcTitleScreen.end();
			this.mcGameScreen.begin();
		}
		
		/* ---------------------------------------------------------------------------------------- */
	}
}

