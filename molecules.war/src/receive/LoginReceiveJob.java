package receive;



import javax.servlet.http.HttpSession;

import generated.LoginAction;
import management.ThreadRequestCouple;


public class LoginReceiveJob implements ReceiveJob {
	private ThreadRequestCouple couple;
	private int userID;
	public LoginReceiveJob(ThreadRequestCouple couple, int userID) {
		this.couple = couple;
		this.userID = userID;
	}

	@Override
	public void execute() {
		
		// faire le if avec OK et erreur donc retour à la page précédente avec ça : <a href="Javascript:history.go(-1)">

		System.out.println("receive : "+userID);
		if(userID >= 0){
		HttpSession session =couple.getRequest().getSession();
		session.setAttribute("userID", userID);
		couple.setRequestDispatcher("/menu.jsp");
		}
		else couple.setRequestDispatcher("/login.jsp");
		
		
	}
}
