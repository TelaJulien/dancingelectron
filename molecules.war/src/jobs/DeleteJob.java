package jobs;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import generated.ClientQuery;
import generated.DeleteAction;

public class DeleteJob implements Job {
	
	private HttpServletRequest request;

	public DeleteJob(HttpServletRequest request) {
		this.request = request;
	}

	@Override
	public ClientQuery execute() {
		
		ClientQuery clientQuery = new ClientQuery();

		// get ID of the molecule which will be deleted
		int moleculeId = Integer.valueOf(request.getParameter("moleculeId"));


		// creation de l'action (CRUD + undo + redo)
		DeleteAction action = new DeleteAction();
		
		action.setMoleculeID(moleculeId);
		
		
		//int userID = clientQuery.getUserID();
		//clientQuery.setUserID(userID);
		clientQuery.setUserID(1);
		clientQuery.setAction(action);

		HttpSession session = request.getSession();
		session.setAttribute("MOLECULEID", moleculeId);

		return clientQuery;
	}

}
