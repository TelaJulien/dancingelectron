package jobs;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import generated.ClientQuery;
import generated.LoginAction;

public class LoginJob implements Job {
	private HttpServletRequest request;

	public LoginJob(HttpServletRequest request) {
		this.request = request;
	}

	@Override
	public ClientQuery execute() {
		ClientQuery clientQuery = new ClientQuery();
		
		//get les infos (username & password)
		String username = request.getParameter("username");
		String password = request.getParameter("password");
				
		//creation de l'action
		LoginAction action = new LoginAction();
		action.setLogin(username);
		action.setPassword(password);

		System.out.println("Username : " + username);
		System.out.println("Password : " + password);
		
		clientQuery.setAction(action);
		
		return clientQuery;
	}

}
