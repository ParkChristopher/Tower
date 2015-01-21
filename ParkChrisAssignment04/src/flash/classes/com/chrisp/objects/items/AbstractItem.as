package com.chrisp.objects.items
{
	import com.chrisp.objects.AbstractGameObject;
	import flash.display.MovieClip;
	import org.osflash.signals.Signal;

	
	/**
	 * Base abstraction class for Items
	 * 
	 * @author Chris Park
	 */
	public class AbstractItem extends AbstractGameObject
	{
		
		/** Signals the hero that weapon needs to be cleaned up.*/
		public var cleanupSignal		:Signal = new Signal();
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Constructs the Item object.
		 * 
		 * @param	$name		Item name.
		 */
		public function AbstractItem($name:String)
		{
			super($name);
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		override public function begin():void
		{
			super.begin();
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		override public function end():void
		{
			super.end();
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
	}
}

