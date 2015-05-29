package receive;

import java.io.UnsupportedEncodingException;

import management.ThreadRequestCouple;

public class CreateReceiveJob implements ReceiveJob {

	private ThreadRequestCouple couple;

	public CreateReceiveJob(ThreadRequestCouple couple) {
		this.couple = couple;
	}

	@Override
	public void execute() {
		couple.setRequestDispatcher("/resultAction.jsp");
		couple.getRequest().setAttribute("message", "createMsg");
		

	}

}
