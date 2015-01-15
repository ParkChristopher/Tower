package com.chrisp.objects.items
{
	import com.chrisp.objects.AbstractGameObject;
	import flash.display.MovieClip;

	
	/**
	 * Base abstraction class for Items
	 * 
	 * @author Chris Park
	 */
	public class AbstractItem extends AbstractGameObject
	{
		
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

