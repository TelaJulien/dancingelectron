package receive;

import java.io.UnsupportedEncodingException;

import management.ThreadRequestCouple;

public class DeleteReceiveJob implements ReceiveJob {
	private ThreadRequestCouple couple;

	public DeleteReceiveJob(ThreadRequestCouple couple) {
		this.couple = couple;
	}

	@Override
	public void execute() {
		couple.setRequestDispatcher("/resultAction.jsp");
		couple.getRequest().setAttribute("message", "Molecule has been deleted");

	}
}
