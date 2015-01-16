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
		
		function begin():void;
		function end():void;
		function destroy():void;
		
		/* ---------------------------------------------------------------------------------------- */
	}
}

