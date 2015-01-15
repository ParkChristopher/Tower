package com.chrisp.objects.entities
{
	import flash.events.Event;
	import com.natejc.input.KeyboardManager;
	import com.natejc.input.KeyCode;
	

	/**
	 * Dictates the functionality and information for a hero character
	 * 
	 * @author Chris Park
	 */
	public class Hero extends AbstractEntity
	{
		private var MOVEMENT_SPEED = 3;
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Constructs the Hero object.
		 */
		public function Hero()
		{
			super("Hero", 100);
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Initializes the Hero object.
		 */
		public function begin():void
		{
			this.visible = true;
		}
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Ends and stops the Hero object.
		 */
		public function end():void
		{
			this.visible = false;
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Checks for events from the player.
		 * 
		 * @param	$e	ENTER_FRAME event.
		 */
		public function checkForAction($e:Event):void
		{
			if (KeyboardManager.instance.isKeyDown(KeyCode.D))
				moveRight();
				
			if (KeyboardManager.instance.isKeyDown(KeyCode.A))
				moveLeft();
				
			if (KeyboardManager.instance.isKeyDown(KeyCode.W))
				moveUp();
				
			if (KeyboardManager.instance.isKeyDown(KeyCode.S))
				moveDown();
		}
				
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Moves the player to the right.
		 */
		private function moveRight():void
		{
			if (this.x > stage.stageWidth - (this.width * 0.5))
				return;
				
			this.x += MOVEMENT_SPEED;
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Moves the player to the left.
		 */
		private function moveLeft():void
		{
			if (this.x - (this.width * 0.5) <= 0)
				return;
				
			this.x -= MOVEMENT_SPEED;
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Moves the player to the up.
		 */
		private function moveUp():void
		{
			if (this.y - (this.height * 0.5) <= 0)
				return;
				
			this.y -= MOVEMENT_SPEED;
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Moves the player to the down.
		 */
		private function moveDown():void
		{
			if (this.y > stage.stageHeight - (this.height * 0.5))
				return;
				
			this.y += MOVEMENT_SPEED;
		}
		
		/* ---------------------------------------------------------------------------------------- */
	}
}