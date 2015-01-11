package com.chrisp.objects.entities
{
	
	/**
	 * Dictates the functionality and information for a ghost enemy.
	 * 
	 * @author Chris Park
	 */
	public class Ghost extends A_Entity
	{
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Constructs the Ghost object.
		 */
		public function Ghost()
		{
			super("Ghost", 20);
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Initializes the Ghost object.
		 */
		public function begin()
		{
				this.visible = true;
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Ends and stops the Ghost object.
		 */
		public function end()
		{
				this.visible = false;
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
	}
}

