package messages;

import messaging.AbstractMessageManager;

public class MessagesManager extends AbstractMessageManager {

	public MessagesManager() {
		super("validation/jms.properties");
	}

}
