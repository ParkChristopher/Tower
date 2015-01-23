package 
{


	/**
	 * 
	 * 
	 * @author Nate Chatellier
	 */
	public class SingletonExample
	{
		/** Stores a reference to the singleton instance. */  
		private static const _instance	:SingletonExample = new SingletonExample( SingletonLock );
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Constructs the SingletonExample object.
		 * 
		 * @param	lock	This class is a singleton and should not be externally instantiated.
		 */
		public function SingletonExample($lock:Class)
		{
			if ($lock != SingletonLock)
				throw new Error("SingletonExample is a singleton and should not be instantiated. Use SingletonExample.instance instead");
			
		}
		
		/* ---------------------------------------------------------------------------------------- */
	
		/**
		 * Returns an instance to this class.
		 *
		 * @return		An instance to this class.
		 */
		public static function get instance():SingletonExample
		{
			return _instance;
		}
		
		/* ---------------------------------------------------------------------------------------- */

	}
}



class SingletonLock {} // Do nothing, this is just to prevent external instantiation.


