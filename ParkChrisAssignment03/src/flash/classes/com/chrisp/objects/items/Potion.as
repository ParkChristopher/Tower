package com.chrisp.objects.items
{
	
	/**
	 * Base abstraction class for Items
	 * 
	 * @author Chris Park
	 */
	public class Potion extends A_Item
	{
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Constructs the Potion object.
		 */
		public function Potion()
		{
			super("Potion");
		}
		
		/* ---------------------------------------------------------------------------------------- */		
		
		/**
		 * Initializes the potion object.
		 */
		public function begin():void
		{
			this.visible = true;
		}
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Ends and stops the potion object.
		 */
		public function end():void
		{
			this.visible = false;
		}
		
		/* ---------------------------------------------------------------------------------------- */
	}
}
