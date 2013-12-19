package history.step 
{
	import flash.display.DisplayObject;
	import history.step.model.StepModel;
	/**
	 * ...
	 * @author Igor Mironenko
	 */
	public class Step
	{
		protected var _model:StepModel;
		
		public function Step() 
		{
			super(); // static class
		}
		
		public function dispose():void 
		{
			_model = null;
		}
		
		public function activate():void 
		{
		}
		
		public function deactivate():void 
		{
		}
		
		public function get type():String
		{
			return _model.type;
		}
		
		public function get child():DisplayObject
		{
			return _model.child;
		}
		
	}

}