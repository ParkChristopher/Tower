package 
{
	import com.natejc.input.KeyboardManager;
	import flash.display.MovieClip;
	import com.natejc.utils.StageRef;
	
	//NOTE: Refactor AbstractGameObjects so vector generics can be used for
	//strategy in a generic cleanup function.
	//BUG: Potions stop spawning at random time after game starts. Seems to vary between 1 - 5 spawns per game.
	//	-ToCheck: Collision and spawn functions for items. (GameScreen)
	//  -Does it have something to do with the vector swapping in the cleanup function? (GameScreen)
	//TO IMPLEMENT NEXT:
	//	-Health bar.
	//	-Experience values and leveling of base attack power
	//	-Fade effect to make ghosts dissappear and reappear on move.
	//	-Better Sword, Hero, GameScreen Background (too much grey, too many stone tiles)
	//		-Basic Tweens or animations for the first two.
	//  -More detail on the TitleScreen (tower still looks like crap, Mountains need to be fleshed out)
	//	-Game Title graphic with tweening.
	
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
		
		/* ---------------------------------------------------------------------------------------- */
		
	}
}

