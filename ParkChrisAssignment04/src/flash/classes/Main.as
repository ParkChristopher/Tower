package 
{
	import com.natejc.input.KeyboardManager;
	import flash.display.MovieClip;
	import com.natejc.utils.StageRef;
	
	//NOTE: Refactor AbstractGameObjects so vector generics can be used for
	//strategy in a generic cleanup funciton
	//-Potions stop spawning at random time after game starts.
	
	/**
	 * Drives the project.
	 * 
	 * @author	Chris Park
	 */
	public class Main extends MovieClip
	{
		/** Title Screen */
		public var mcTitleScreen	:MovieClip;
		/** Game Screen */
		public var mcGameScreen		:MovieClip;
		/** Result Screen */
		public var mcResultScreen	:MovieClip;
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Constructs the Main object.
		 */
		public function Main()
		{
			KeyboardManager.init(this.stage);
			StageRef.stage = this.stage;
			
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
			this.mcResultScreen.updateScore(this.mcGameScreen.txtScore.text);
			this.mcGameScreen.end();
			this.mcResultScreen.begin();
			
		}
	}
}

