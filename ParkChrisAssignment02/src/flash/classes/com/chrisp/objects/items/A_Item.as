package com.chrisp.objects.items
{
	import flash.display.MovieClip;

	
	/**
	 * Base abstraction class for Items
	 * 
	 * @author Chris Park
	 */
	public class A_Item extends MovieClip
	{
		public var sName :String;
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Constructs the Item object.
		 * 
		 * @param	$name		Item name.
		 */
		public function A_Item($name:String)
		{
			super();
			
			this.mouseEnabled	= false;
			this.mouseChildren	= false;
			
			this.sName = $name;
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

