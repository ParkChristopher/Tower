package com.chrisp.objects
{
	import flash.display.Sprite;

	
	/**
	 * Defines a contract for all game objects.
	 * 
	 * @author Chris Park
	 */
	public interface IGameObject
	{
		/**
		 * Initialization function for a game object.
		 */
		function begin():void;
		
		/**
		 * Clean up for a game object.
		 */
		function end():void;
		
		/**
		 * Resource freeing for a game object.
		 */
		function destroy():void;
		
		/* ---------------------------------------------------------------------------------------- */
	}
}

