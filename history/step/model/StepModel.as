package history.step.model 
{
	import flash.display.DisplayObject;
	/**
	 * ...
	 * @author Igor Mironenko
	 */
	public class StepModel 
	{
		protected var _child:DisplayObject;
		protected var _type :String;
		
		public function StepModel(child:DisplayObject, type:String) 
		{
			_child 	= child;
			_type 	= type;
		}
		
		public function get child():DisplayObject 
		{
			return _child;
		}
		
		public function get type():String 
		{
			return _type;
		}
	}
}