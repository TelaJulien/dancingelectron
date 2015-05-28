package receive;



import javax.servlet.http.HttpSession;

import generated.Action;
import generated.LoginAction;
import management.ThreadRequestCouple;


public class LogInReceiveJob implements ReceiveJob {
	private ThreadRequestCouple couple;
	private LoginAction action;

	public LogInReceiveJob(ThreadRequestCouple couple, LoginAction action) {
		this.couple = couple;
		this.action = action;
	}

	@Override
	public void execute() {
		
		// faire le if avec OK et erreur donc retour à la page précédente avec ça : <a href="Javascript:history.go(-1)">
		couple.setRequestDispatcher("/menu.jsp");
		
		int userId = Integer.valueOf(couple.getRequest().getParameter("userId"));
		
		HttpSession session =couple.getRequest().getSession();
		session.setAttribute("userId", userId);
		
		
	}
}
