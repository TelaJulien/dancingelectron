package jobs;

import javax.servlet.http.HttpServletRequest;

import generated.ClientQuery;
import generated.LoginAction;

public class LogInJob implements Job {
	private HttpServletRequest request;

	public LogInJob(HttpServletRequest request) {
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

		
		return clientQuery;
	}

}
