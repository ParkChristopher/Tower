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
		/** Toggle is sword is doing something.*/
		public var bActive				:Boolean = false;
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
		
	}
}

