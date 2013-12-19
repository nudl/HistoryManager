package history.event 
{
	import flash.events.Event;
	/**
	 * ...
	 * @author Igor Mironenko
	 */
	public class HistoryEvent extends Event
	{
		public static const HISTORY_CHANGED	:String = "historyChanged";
		public static const HISTORY_CLEANED	:String = "historyCleaned";
		
		public static const UNDO			:String	= "undo";
		public static const REDO			:String	= "redo";
		
		public function HistoryEvent(type:String) 
		{
			super(type);
		}
		
	}

}