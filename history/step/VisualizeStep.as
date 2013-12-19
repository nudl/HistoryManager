package history.step 
{
	import flash.display.DisplayObject;
	import history.step.model.VisualizeStepModel;
	/**
	 * ...
	 * @author Igor Mironenko
	 */
	public class VisualizeStep extends Step
	{		
		public function VisualizeStep() 
		{
			super();
		}
		
		override public function dispose():void
		{
			var visualizeModel:VisualizeStepModel 	= _model as VisualizeStepModel;
			var child:DisplayObject					= visualizeModel.child;
			
			if (child.parent)
				child.parent.removeChild(child);
			
			super.dispose();
		}
		
		protected function addChild():void
		{
			var visualizeModel:VisualizeStepModel = _model as VisualizeStepModel;
			visualizeModel.container.addChild(visualizeModel.child);
		}
		
		protected function removeChild():void
		{
			var visualizeModel:VisualizeStepModel = _model as VisualizeStepModel;
			visualizeModel.container.removeChild(visualizeModel.child);
		}
	}
}