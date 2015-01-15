package com.chrisp.objects.entities
{
	import flash.display.MovieClip;
	
	/**
	 * Base abstraction class for Entities
	 * 
	 * @author Chris Park
	 */
	public class AbstractEntity extends MovieClip
	{
		public var sName		:String;
		public var nHealth		:Number;
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Constructs the A_Entity object.
		 * @param	$name 		Entity name.
		 * @param	$health	Entity health value.
		 */
		public function AbstractEntity($name:String, $health:Number)
		{
			super();
			
			this.mouseEnabled	= false;
			this.mouseChildren	= false;
			
			this.sName = $name;
			this.nHealth = $health;
		}
		
		/* ---------------------------------------------------------------------------------------- */		
		
		/**
		 * Frees all memory used by this object.
		 */
		public function destroy():void
		{
			while (this.numChildren > 0)
				this.removeChildAt(0);
		}
		
		/* ---------------------------------------------------------------------------------------- */
	}
}

