package 
{
	import com.chrisp.objects.AbstractGameObject;


	/**
	 * Manages collisions between game objects.
	 * 
	 * @author Chris Park
	 */
	public class CollisionManager
	{
		/** Stores a reference to the singleton instance. */  
		private static const _instance	:CollisionManager = new CollisionManager( SingletonLock );
		
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
		{}
		
		/* ---------------------------------------------------------------------------------------- */
		
		public function end():void
		{}
		
		/* ---------------------------------------------------------------------------------------- */
		
		public function add($object:AbstractGameObject):void
		{}
		
		/* ---------------------------------------------------------------------------------------- */
		
		public function remove($object:AbstractGameObject):void
		{}
		
		/* ---------------------------------------------------------------------------------------- */
		
	}
}



class SingletonLock {} // Do nothing, this is just to prevent external instantiation.


