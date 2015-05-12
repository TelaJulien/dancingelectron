package receive;

import management.ThreadRequestCouple;
import generated.Action;
import generated.CreateAction;
import generated.DisplayAction;

public class ReceiveJobFactory {

	public static ReceiveJob build(ThreadRequestCouple couple, Action action) {

		if (action instanceof CreateAction) {
			return new CreateReceiveJob(couple);
		} else if (action instanceof DisplayAction) {
			return new DisplayReceiveJob(couple, (DisplayAction) action);
		}

		return null;
	}
}
