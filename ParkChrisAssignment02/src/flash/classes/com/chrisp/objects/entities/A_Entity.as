package com.chrisp.objects.entities
{
	import flash.display.MovieClip;
	
	/**
	 * Base abstraction class for Entities
	 * 
	 * @author Chris Park
	 */
	public class A_Entity extends MovieClip
	{
		public var _sName		:String;
		public var _nHealth		:Number;
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Constructs the A_Entity object.
		 */
		public function A_Entity()
		{
			super();
			
			this.mouseEnabled	= false;
			this.mouseChildren	= false;
			
			
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

