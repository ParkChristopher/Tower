package 
{
	import com.chrisp.screens.CreditsScreen;
	import com.chrisp.screens.GameScreen;
	import com.chrisp.screens.ResultScreen;
	import com.chrisp.screens.TitleScreen;
	import com.greensock.events.LoaderEvent;
	import com.greensock.loading.LoaderMax;
	import com.greensock.loading.XMLLoader;
	import com.natejc.input.KeyboardManager;
	import com.natejc.utils.StageRef;
	import flash.display.MovieClip;
	
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
			init();
			trace("Main: Initialized.");
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Initializes the game
		 */
		protected function init():void
		{
			this.mcTitleScreen = new TitleScreen();
			this.mcGameScreen = new GameScreen();
			this.mcResultScreen = new ResultScreen();
			this.mcCreditsScreen = new CreditsScreen();
			
			this.mcGameScreen.screenCompleteSignal.add(startResults);
			this.mcTitleScreen.screenCompleteSignal.add(startGame);
			this.mcTitleScreen.creditsSignal.add(startCredits);
			this.mcResultScreen.screenCompleteSignal.add(startTitle);
			this.mcCreditsScreen.screenCompleteSignal.add(startTitle);
			
			this.stage.addChild(this.mcResultScreen);
			this.stage.addChild(this.mcGameScreen);
			this.stage.addChild(this.mcCreditsScreen);
			this.stage.addChild(this.mcTitleScreen);
			
			this.mcCreditsScreen.hide();
			this.mcResultScreen.hide();
			this.mcGameScreen.hide();
			
			this.mcTitleScreen.begin();
			
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

