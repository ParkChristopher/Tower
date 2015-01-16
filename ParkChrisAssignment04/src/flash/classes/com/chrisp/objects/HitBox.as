package com.chrisp.objects
{
	import com.chrisp.objects.IGameObject;
	import flash.display.MovieClip;
	import flash.events.Event;
	import org.osflash.signals.Signal;

	
	/**
	 * Handles collision interaction between objects, and informs the hero as necessary.
	 * 
	 * @author Chris Park
	 */
	public class HitBox extends MovieClip implements IGameObject
	{
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Constructs the HitBox object.
		 */
		public function HitBox()
		{
			super();
			
			this.mouseEnabled	= false;
			this.mouseChildren	= false;
			this.visible = false;
		}
		
		/* ---------------------------------------------------------------------------------------- */		
		
		/**
		 * Initializes everything for this object.
		 */
		public function begin():void
		{
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Cleans up resources used by this object
		 */
		public function end():void
		{
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Relinquishes all memory used by this object.
		 */
		public function destroy():void
		{
			while (this.numChildren > 0)
				this.removeChildAt(0);
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
	}
}

