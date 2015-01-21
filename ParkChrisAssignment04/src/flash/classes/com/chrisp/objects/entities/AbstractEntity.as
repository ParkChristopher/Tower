package com.chrisp.objects.entities
{
	import com.chrisp.objects.AbstractGameObject;
	import com.chrisp.objects.HitBox;
	import flash.display.MovieClip;
	import flash.utils.Timer;
	import org.osflash.signals.Signal;
	
	/**
	 * Base abstraction class for Entities
	 * 
	 * @author Chris Park
	 */
	public class AbstractEntity extends AbstractGameObject
	{
		/** Entity health */
		public var nHealth					:Number;
		/** Signal for when movement timer has triggered. */
		public var readyToMoveSignal		:Signal = new Signal(AbstractEntity);
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Constructs the A_Entity object.
		 * 
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
		
		/**
		 * Determines movement of enemy
		 * 
		 * @param	$target MovieClip
		 */
		public function move($target:MovieClip):void
		{
			
		}
	}
}

