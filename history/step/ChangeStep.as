package history.step 
{
	import flash.display.DisplayObject;
	import history.step.model.ChangeStepModel;
	/**
	 * ...
	 * @author Igor Mironenko
	 */
	public class ChangeStep extends Step
	{		
		public function ChangeStep(child:DisplayObject, property:String, prewValue:*, newValue:*)
		{	
			_model = new ChangeStepModel(child, property, prewValue, newValue) 
		}
		
		override public function activate():void
		{
			var changeModel:ChangeStepModel = _model as ChangeStepModel;
			
			child[changeModel.property] = changeModel.newValue;
		}
		
		override public function deactivate():void
		{
			var changeModel:ChangeStepModel = _model as ChangeStepModel;
			
			child[changeModel.property] =  changeModel.prewValue;
		}
	}
}