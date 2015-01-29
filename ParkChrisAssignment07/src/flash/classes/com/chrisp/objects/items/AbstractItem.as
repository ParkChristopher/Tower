package com.chrisp.objects.items
{
	import com.chrisp.objects.AbstractGameObject;

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
		
		/**
		 * Starts the object.
		 */
		override public function begin():void
		{
			super.begin();
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Ends the object.
		 */
		override public function end():void
		{
			super.end();
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
	}
}

