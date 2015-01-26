package com.chrisp.objects.items
{
	import com.natejc.utils.StageRef;
	import com.chrisp.collision.GameObjectType;
	import com.chrisp.collision.CollisionManager;
	import com.chrisp.objects.AbstractGameObject;
	
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
			this.x = Math.random() * StageRef.stage.stageWidth;
			this.y = Math.random() * StageRef.stage.stageHeight;
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
		
		
		override public function collidedWith($object:AbstractGameObject):void
		{
			trace("Potion: Collision:");
			/*
			if ($object.objectType == GameObjectType.TYPE_HERO)
			{
				trace("Potion collided with " + $object.objectType);
				
				
				this.bActive = false;
				CollisionManager.instance.remove(this);
				this.cleanupSignal.dispatch(this);
			}
			*/
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
	}
}
