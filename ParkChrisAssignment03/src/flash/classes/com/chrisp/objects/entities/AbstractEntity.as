package com.chrisp.objects.entities
{
	import com.chrisp.objects.AbstractGameObject;
	import com.chrisp.objects.IGameObject;
	import flash.display.MovieClip;
	
	/**
	 * Base abstraction class for Entities
	 * 
	 * @author Chris Park
	 */
	public class AbstractEntity extends AbstractGameObject
	{
		public var nHealth		:Number;
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Constructs the A_Entity object.
		 * @param	$name 		Entity name.
		 * @param	$health	Entity health value.
		 */
		public function AbstractEntity($name:String, $health:Number)
		{
			super($name);
			
			this.mouseEnabled	= false;
			this.mouseChildren	= false;
			
			this.sName = $name;
			this.nHealth = $health;
		}
		
		/* ---------------------------------------------------------------------------------------- */		
		
	}
}

