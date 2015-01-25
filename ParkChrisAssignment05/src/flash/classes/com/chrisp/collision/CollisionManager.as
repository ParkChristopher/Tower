package com.chrisp.collision
{
	import com.chrisp.objects.AbstractGameObject;
	import com.natejc.utils.StageRef;
	import flash.events.Event;

	/**
	 * Manages collisions between game objects.
	 * 
	 * @author Chris Park
	 */
	public class CollisionManager
	{
		/** Stores a reference to the singleton instance. */  
		private static const _instance	:CollisionManager = new CollisionManager( SingletonLock );
		/** Lists of objects checked for collision. */
		protected var _aTrackedObjects	:Array = new Array();
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Constructs the CollisionManager object.
		 * 
		 * @param	lock	This class is a singleton and should not be externally instantiated.
		 */
		public function CollisionManager($lock:Class)
		{
			if ($lock != SingletonLock)
				throw new Error("CollisionManager is a singleton and should not be instantiated. Use CollisionManager.instance instead");
			
		}
		
		/* ---------------------------------------------------------------------------------------- */
	
		/**
		 * Returns an instance to this class.
		 *
		 * @return		An instance to this class.
		 */
		public static function get instance():CollisionManager
		{		
			return _instance;
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		public function reset():void
		{}
		
		/* ---------------------------------------------------------------------------------------- */
		
		public function begin():void
		{
			StageRef.stage.addEventListener(this.testCollision);
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		public function end():void
		{
			StageRef.stage.removeEventListener(this.testCollision);
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		public function add($object:AbstractGameObject):void
		{
			var aObjectsOfSameType :Array = this._aTrackedObjects[$object.objectType];
			
			if (aObjectsOfSameType == null)
				aObjectsOfSameType = new Array();
			
			aObjectsOfSameType.push($object);
			this._aTrackedObjects[$object.objectType] = aObjectsOfSameType;
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		public function remove($object:AbstractGameObject):void
		{
			var aObjectsOfSameType :Array = this._aTrackedObjects[$object.objectType];
			
			if (aObjectsOfSameType == null)
				return;
			
			var nObjectRemoveIndex :int = aObjectsOfSameType.indexOf($object);
			
			if (nObjectRemoveIndex >= 0)
				aObjectsOfSameType.splice(nObjectRemoveIndex, 1);
				
			this._aTrackedObjects[$object.objectType] = aObjectsOfSameType;
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		public function testCollisions($e:Event = null):void
		{}
		
		/* ---------------------------------------------------------------------------------------- */
		
	}
}



class SingletonLock {} // Do nothing, this is just to prevent external instantiation.


