package com.chrisp.screens
{
	import com.greensock.*;
	import com.greensock.easing.*;

	
	/**
	 * Screen with fading behavior
	 * 
	 * @author Chris Park
	 */
	public class FadeScreen extends AbstractScreen
	{
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Constructs the FadeScreen object.
		 */
		public function FadeScreen()
		{
			super();
			
		}
		/* ---------------------------------------------------------------------------------------- */
	
		override public function show():void
		{
			super.show();
			
			TweenMax.fromTo(this, 1, { alpha:0 }, { alpha:1, ease:Linear.easeNone } );
			trace("In");
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		override public function hide():void
		{
			TweenMax.fromTo(this, .5, {alpha:1}, {autoAlpha:0, ease:Linear.easeNone});
			super.hide();
			trace("out");
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
	}
}

