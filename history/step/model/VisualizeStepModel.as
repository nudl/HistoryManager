package history.step.model 
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	/**
	 * ...
	 * @author Igor Mironenko
	 */
	public class VisualizeStepModel extends StepModel
	{
		private var _container	:DisplayObjectContainer;
		
		public function VisualizeStepModel(type:String, container:DisplayObjectContainer, child:DisplayObject) 
		{
			_container = container;
			
			super(child, type);
		}
		
		public function get container():DisplayObjectContainer 
		{
			return _container;
		}
	}
}