package 
{
	import com.greensock.loading.LoaderMax;
	import com.greensock.loading.XMLLoader;
	import com.natejc.input.KeyboardManager;
	import flash.display.MovieClip;
	import com.natejc.utils.StageRef;
	
	//TO IMPLEMENT NEXT:
	//	-Health bar.
	//	-Experience values and leveling of base attack power
	//	-Fade effect to make ghosts dissappear and reappear on move.
	//  -More detail on the TitleScreen ( Mountains need to be fleshed out)
	//	-Game Title graphic with tweening.
	//  -Animations for Hero and Enemies
	
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
			load();
			
			this.mcGameScreen.screenCompleteSignal.add(startResults);
			this.mcTitleScreen.screenCompleteSignal.add(startGame);
			this.mcResultScreen.screenCompleteSignal.add(startTitle);
			
			init();
			trace("Main: Initialized.");
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Loads any content from xml/config.xml
		 */
		protected function load():void
		{
			var queue:LoaderMax = new LoaderMax( { name:"xmlLoad", onProgress:progressHandler, onComplete:completeHandler, onError:errorHandler } );
			
			queue.append(new XMLLoader("xml/config.xml", { name:"xmlConfig" } ));
			queue.load();
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		protected function progressHandler():void
		{
			  trace("progress: " + event.target.progress);
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		protected function completeHandler():void
		{
			trace(event.target + " is complete!");
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		protected function errorHandler():void
		{
			trace("error occured with " + event.target + ": " + event.text);
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		//Initializes the game
		protected function init():void
		{
			this.mcTitleScreen.begin();
			this.mcResultScreen.end();
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

