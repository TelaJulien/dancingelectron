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
		int moleculeId = Integer.valueOf(request.getParameter("moleculeID"));


		// creation de l'action (CRUD + undo + redo)
		DeleteAction action = new DeleteAction();
		
		action.setMoleculeID(moleculeId);
		
		
		HttpSession session = request.getSession();
		//int userId = Integer.valueOf((String) session.getAttribute("userId"));
		//clientQuery.setUserID(userId);
		clientQuery.setUserID(1);
		clientQuery.setAction(action);

		session.setAttribute("MOLECULEID", moleculeId);
		
		System.out.println("User ID : " + clientQuery.getUserID());

		return clientQuery;
	}

}
