package history
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.events.EventDispatcher;
	import history.event.HistoryEvent;
	import history.step.AddStep;
	import history.step.ChangeStep;
	import history.step.RemoveStep;
	import history.step.Step;
	
	/**
	 * ...
	 * @author Igor Mironenko
	 */
	public class HistoryManager extends EventDispatcher
	{
		public static const REMOVE_STEP	:String = "removeStep";
		public static const ADD_STEP	:String = "addStep";
		public static const CHANGE_STEP	:String = "changeStep";
		
		private var _steps		:Vector.<Step>;
		private var _activeStep	:int;
		
		public function HistoryManager()
		{
			_steps = new Vector.<Step>();
		}
		
		//=============================================================================
		// PUBLIC SECTION 
		//=============================================================================
		
		public function clean():void
		{
			for (var i:int = _activeStep; i < _steps.length; i++) 
			{
				_steps[i].dispose();
			}
			
			_activeStep   = 0;
			_steps.length = 0;
			
			dispatchEvent(new HistoryEvent(HistoryEvent.HISTORY_CLEANED));
		}
		
		public function addRemoveStep(container:DisplayObjectContainer, child:DisplayObject):void
		{
			var step:RemoveStep = new RemoveStep(container, child);
			
			applyStep(step);
		}
		
		public function addAddStep(container:DisplayObjectContainer, child:DisplayObject):void
		{
			var step:AddStep = new AddStep(container, child);
			
			applyStep(step);
		}
		
		public function addChangeStep(child:DisplayObject, property:String, prewValue:*, newValue:*):void
		{
			var step:ChangeStep = new ChangeStep(child, property, prewValue, newValue); 
			
			applyStep(step);
		}
		
		public function undo():void
		{
			if(isUndoPossible())
				moveTostep(_activeStep - 1);
		}
		
		public function redo():void
		{
			if(isRedoPossible())
				moveTostep(_activeStep + 1);
		}
		
		public function isUndoPossible():Boolean
		{
			if (_activeStep != 0)
				return true;
			else
				return false;
		}
		
		public function isRedoPossible():Boolean
		{
			if (_activeStep < _steps.length)
				return true;
			else
				return false;
		}
		
		public function moveTostep(nextStep:int):void
		{
			var stepsLength:int = _steps.length;
			var eventType:String;
			
			if (nextStep < _activeStep)
			{
				for (var i:int = _activeStep; i != nextStep; i--)
				{
					_steps[i - 1].deactivate();	
				}
				
				eventType = HistoryEvent.UNDO;
			}
			else if (nextStep > _activeStep)
			{
				for (i = _activeStep; i != nextStep; i++)
				{
					_steps[i].activate();
				}
				
				eventType = HistoryEvent.REDO;
			}
			else
			{
				return;
			}
			
			if ((nextStep -1) > (_steps.length - 1) && (nextStep -1) < (_steps.length - 1))
			{
				_steps[nextStep - 1].activate();
			}
			
			_activeStep = nextStep;
			dispatchEvent(new HistoryEvent(eventType));
		}
		
		//=============================================================================
		// PRIVATE SECTION 
		//=============================================================================
		
		private function applyStep(step:Step):void
		{
			if (_activeStep < _steps.length - 1)
			{
				var startIndex:int = _activeStep + 1;
				
				for (var i:int = startIndex; i < (_steps.length - startIndex); i++) 
				{
					_steps[i].dispose();
				}
				
				_steps.splice(startIndex, _steps.length - startIndex);
			}
			
			_steps.push(step);
			_activeStep = _steps.length;
			
			dispatchEvent(new HistoryEvent(HistoryEvent.HISTORY_CHANGED));
		}
		
		//=============================================================================
		// GET/SET SECTION 
		//=============================================================================
		
		public function get activeStep():int 	{ return _activeStep; }
		public function get stepsLength():int 	{ return _steps.length; }
	}
}