package history.step 
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import history.HistoryManager;
	import history.step.model.VisualizeStepModel;
	/**
	 * ...
	 * @author Igor Mironenko
	 */
	public class AddStep extends VisualizeStep
	{		
		public function AddStep(container:DisplayObjectContainer, child:DisplayObject) 
		{
			_model = new VisualizeStepModel(HistoryManager.ADD_STEP, container, child);
		}
		
		override public function activate():void
		{
			addChild();
		}
		
		override public function deactivate():void
		{
			removeChild();
		}
	}
}