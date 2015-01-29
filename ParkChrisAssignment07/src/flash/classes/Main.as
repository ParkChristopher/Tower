package 
{
	import com.greensock.loading.LoaderMax;
	import com.greensock.loading.XMLLoader;
	import com.natejc.input.KeyboardManager;
	import flash.display.MovieClip;
	import com.natejc.utils.StageRef;
	import com.greensock.events.LoaderEvent;
	
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
		/** Credits Screen */
		public var mcCreditsScreen	:MovieClip;
		
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
			this.mcTitleScreen.creditsSignal.add(startCredits);
			this.mcResultScreen.screenCompleteSignal.add(startTitle);
			this.mcCreditsScreen.screenCompleteSignal.add(startTitle);
			
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
		
		protected function progressHandler(event:LoaderEvent):void
		{
			  trace("progress: " + event.target.progress);
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		protected function completeHandler(event:LoaderEvent):void
		{
			trace(event.target + " is complete!");
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		protected function errorHandler(event:LoaderEvent):void
		{
			trace("error occured with " + event.target + ": " + event.text);
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Initializes the game
		 */
		protected function init():void
		{
			this.mcTitleScreen.begin();
			this.mcResultScreen.end();
			this.mcCreditsScreen.end();
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
			this.mcCreditsScreen.end();
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
		
		/**
		 * Stops any resources and transitions to CreditsScreen
		 */
		public function startCredits():void
		{
			trace("Main: TitleScreen ended. Transitioning to CreditsScreen");
			this.mcTitleScreen.end();
			this.mcCreditsScreen.begin();
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
	}
}

