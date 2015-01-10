package com.chrisp.objects.entities
{
	import com.natejc.input.KeyboardManager;
	import com.natejc.input.KeyCode;
	import flash.events.Event;
	import flash.events.KeyboardEvent;

	/**
	 * Dictates the functionality and information for a hero character
	 * 
	 * @author Chris Park
	 */
	public class Hero extends A_Entity
	{
		private var MOVEMENT_SPEED = 3; 
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Constructs the Hero object.
		 */
		public function Hero()
		{
			super();
			
			this.addEventListener(Event.ENTER_FRAME, checkForAction);
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Moves the player.
		 * 
		 * @param	$e	ENTER_FRAME event.
		 */
		public function checkForAction($e:Event):void
		{
			if (KeyboardManager.instance.isKeyDown(KeyCode.D))
				this.x += MOVEMENT_SPEED;
				
			if (KeyboardManager.instance.isKeyDown(KeyCode.A))
				this.x -= MOVEMENT_SPEED;
				
			if (KeyboardManager.instance.isKeyDown(KeyCode.W))
				this.y -= MOVEMENT_SPEED;
				
			if (KeyboardManager.instance.isKeyDown(KeyCode.S))
				this.y += MOVEMENT_SPEED;
		}
				
		/* ---------------------------------------------------------------------------------------- */
	
	}
}