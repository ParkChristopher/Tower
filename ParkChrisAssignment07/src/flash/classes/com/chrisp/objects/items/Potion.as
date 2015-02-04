package com.chrisp.objects.items
{
	import com.chrisp.collision.GameObjectType;
	import com.chrisp.objects.AbstractGameObject;
	import com.natejc.utils.StageRef;
	import com.greensock.loading.LoaderMax;
	
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
			parseXML();
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
		
		/**
		 * Parses relevant information for this object
		 */
		override protected function parseXML():void
		{
			var xConfig:XML = LoaderMax.getContent("xmlConfig");
			this.nValue = Number(xConfig.gameobjects.potion.pointValue);
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Responses to collision with another object.
		 * 
		 * @param	$object AbstractGameObject.
		 */
		override public function collidedWith($object:AbstractGameObject):void
		{}
		
		/* ---------------------------------------------------------------------------------------- */
		
	}
}
