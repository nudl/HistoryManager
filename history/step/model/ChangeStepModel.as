package history.step.model 
{
	import flash.display.DisplayObject;
	import history.HistoryManager;

	/**
	 * ...
	 * @author Igor Mironenko
	 */
	public class ChangeStepModel extends StepModel
	{
		private var _property		:String;
		private var _prewValue		:*;
		private var _newValue		:*;
		
		public function ChangeStepModel(child:DisplayObject, property:String, prewValue:*, newValue:*) 
		{
			super(child, HistoryManager.CHANGE_STEP);
			
			_property 	= property;
			_prewValue	= prewValue;
			_newValue	= newValue;
		}
		
		public function get property():String 
		{
			return _property;
		}
		
		public function get prewValue():* 
		{
			return _prewValue;
		}
		
		public function get newValue():* 
		{
			return _newValue;
		}
	}
}