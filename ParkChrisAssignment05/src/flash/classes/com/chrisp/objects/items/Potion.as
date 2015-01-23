package com.chrisp.objects.items
{
	import com.natejc.utils.StageRef;
	import com.chrisp.collision.GameObjectType;
	
	/**
	 * Base abstraction class for Items
	 * 
	 * @author Chris Park
	 */
	public class Potion extends AbstractItem
	{
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Constructs the Potion object.
		 */
		public function Potion()
		{
			super("Potion");
			this.nValue = 50;
			this.x = Math.random() * StageRef.stage.width;
			this.y = Math.random() * StageRef.stage.height;
			this._sObjectType = GameObjectType.TYPE_COLLECTIBLE;
			addCollidableType(GameObjectType.TYPE_HERO);
		}
		
		/* ---------------------------------------------------------------------------------------- */		
		
		/**
		 * Initializes the potion.
		 */
		override public function begin():void
		{
			super.begin();
			this.bActive = true;
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Cleans up potion activity.
		 */
		override public function end():void
		{
			super.end();
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
	}
}
