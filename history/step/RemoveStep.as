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
	public class RemoveStep extends VisualizeStep
	{
		public function RemoveStep(container:DisplayObjectContainer, child:DisplayObject) 
		{
			_model = new VisualizeStepModel(HistoryManager.REMOVE_STEP, container, child);
		}
		
		override public function activate():void
		{
			removeChild();
		}
		
		override public function deactivate():void
		{
			addChild();
		}
	}
}