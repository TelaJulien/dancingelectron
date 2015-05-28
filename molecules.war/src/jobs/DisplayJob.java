package jobs;

import generated.ClientQuery;
import generated.DisplayAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class DisplayJob implements Job {
	private String xml;
	private HttpServletRequest request;

	public DisplayJob(HttpServletRequest request) {
		this.request = request;
	}

	@Override
	public ClientQuery execute() {
		ClientQuery clientQuery = new ClientQuery();

		// creation de l'action (CRUD + undo + redo)
		DisplayAction action = new DisplayAction();
		
		HttpSession session = request.getSession();
		//int userId = Integer.valueOf((String) session.getAttribute("userId"));
		//clientQuery.setUserID(userId);
		clientQuery.setUserID(1);
		clientQuery.setAction(action);

		System.out.println("User ID : " + clientQuery.getUserID());

		return clientQuery;
	}
}
