package 
{


	/**
	 * This is an example setup for a static class. Customize it and make it your own.
	 * 
	 * @author	Nate Chatellier
	 */
	public class StaticClassExample
	{
		/** Var Sample. */  
		public static const	STATIC_VAR	:String;
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * This class is a static class and should not be instantiated.
		 */
		public function StaticClassExample()
		{
			throw new Error("StaticClassExample is a static class and should not be instantiated.");
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * This is just an example of a static function.
		 */
		public static function exampleStaticFunction():void
		{
			
		}
		
		/* ---------------------------------------------------------------------------------------- */

	}
}