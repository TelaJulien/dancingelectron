package receive;

import management.ThreadRequestCouple;

public class UpdateReceiveJob implements ReceiveJob {
	
	private ThreadRequestCouple couple;

	public UpdateReceiveJob(ThreadRequestCouple couple) {
		this.couple = couple;
	}


	@Override
	public void execute() {
		couple.setRequestDispatcher("/resultAction.jsp");
		couple.getRequest().setAttribute("message", "Molecule has been updated");
	}

}
