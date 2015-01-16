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
		public var mcResultScreen	:MovieClip;
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Constructs the Main object.
		 */
		public function Main()
		{
			KeyboardManager.init(this.stage);
			
			this.mcGameScreen.screenCompleteSignal.add(startResults);
			this.mcTitleScreen.screenCompleteSignal.add(startGame);
			this.mcResultScreen.screenCompleteSignal.add(startTitle);
			
			this.mcTitleScreen.begin();
			this.mcResultScreen.end();
			
			trace("Main: Initialized.");
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Stops any resources and transitions to GameScreen.
		 */
		public function startGame():void
		{
			trace("Main: Play clicked. Transitioning to GameScreen");
			this.mcTitleScreen.end();
			this.mcGameScreen.begin();
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Stops any resources and transitions to TitleScreen
		 */
		public function startTitle():void
		{
			trace("Main: Return to title clicked. Transitioning to TitleScreen");
			this.mcResultScreen.end();
			this.mcTitleScreen.begin();
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Stops any resources and transitions to ResultScreen
		 */
		public function startResults():void
		{
			trace("Main: Game ended. Transitioning to ResultScreen");
			this.mcGameScreen.end();
			this.mcResultScreen.begin();
		}
	}
}

