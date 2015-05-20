package jobs;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.xml_cml.schema.cml2.core.Atom;
import org.xml_cml.schema.cml2.core.AtomArray;
import org.xml_cml.schema.cml2.core.Bond;
import org.xml_cml.schema.cml2.core.BondArray;
import org.xml_cml.schema.cml2.core.Electron;
import org.xml_cml.schema.cml2.core.Molecule;

import generated.ClientQuery;
import generated.CreateAction;

public class DeleteJob implements Job {
	
	private HttpServletRequest request;

	public DeleteJob(HttpServletRequest request) {
		this.request = request;
	}

	@Override
	public ClientQuery execute() {
		
		//POUR UPDATE IL FAUT ID MOLECULE
		ClientQuery clientQuery = new ClientQuery();
		Molecule molecule = new Molecule();

		// get ID of the molecule which will be deleted
		String moleculeID = request.getParameter("moleculeID");

		// setters for the created molecule
		molecule.setId(moleculeID);

		// creation de l'action (CRUD + undo + redo)
		CreateAction action = new CreateAction();
		action.setMolecule(molecule);
		clientQuery.setUserID(1);
		clientQuery.setAction(action);

		HttpSession session = request.getSession();
		session.setAttribute("MOLECULEID", moleculeID);

		return clientQuery;
	}

}
