package receive;

import management.ThreadRequestCouple;
import generated.Action;
import generated.ClientQuery;
import generated.CreateAction;
import generated.DeleteAction;
import generated.DisplayAction;
import generated.LoginAction;
import generated.UpdateAction;

public class ReceiveJobFactory {

	public static ReceiveJob build(ThreadRequestCouple couple, ClientQuery query) {

		Action action = query.getAction();
		
		if (action instanceof CreateAction) {
			return new CreateReceiveJob(couple);
		} else if (action instanceof DisplayAction) {
			return new DisplayReceiveJob(couple, (DisplayAction) action);
		}
		else if (action instanceof UpdateAction){
			return new UpdateReceiveJob(couple);
		}
		else if (action instanceof DeleteAction){
			return new DeleteReceiveJob(couple);
		}
		else if(action instanceof LoginAction){
			return new LoginReceiveJob(couple, query.getUserID());
		}

		return null;
	}
}
