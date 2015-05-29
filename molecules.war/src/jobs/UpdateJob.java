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
import generated.UpdateAction;

public class UpdateJob implements Job {
	
	private HttpServletRequest request;

	public UpdateJob(HttpServletRequest request) {
		this.request = request;
	}

	@Override
	public ClientQuery execute() {
		ClientQuery clientQuery = new ClientQuery();
		Molecule molecule = new Molecule();

		// get Name and Role of the updated molecule
		String moleculeName = request.getParameter("moleculeName");
		String moleculeRole = request.getParameter("moleculeRole");
		int moleculeId = Integer.valueOf(request.getParameter("moleculeId"));

		// Atom Array
		//String moleculeAtom = request.getParameter("moleculeAtom[0]");
		AtomArray atomArray = new AtomArray();
		String[] moleculeAtomArray = request.getParameterValues("moleculeAtom");
		for (String currentAtom : moleculeAtomArray){
			Atom atom = new Atom();
			atom.setTitle(currentAtom);
			atomArray.getAtom().add(atom);
		}

		// Bond Array
		BondArray bondArray = new BondArray();
		String[] moleculeBondArray = request.getParameterValues("moleculeBond");
		for(String currentBond : moleculeBondArray){
			Bond bond = new Bond();
			bond.setTitle(currentBond);
			bondArray.getBond().add(bond);
		}

		// Electron
		String[] moleculeElectronArray = request.getParameterValues("moleculeElectron");
		for(String currentElectron : moleculeElectronArray){
			Electron electron = new Electron();
			electron.setTitle(currentElectron);
			molecule.getElectron().add(electron);
		}

		// setters for the updated molecule
		molecule.setTitle(moleculeName);
		molecule.setRole(moleculeRole);
		molecule.setAtomArray(atomArray);
		molecule.setBondArray(bondArray);

		// creation de l'action (CRUD + undo + redo)
		UpdateAction action = new UpdateAction();
		action.setMolecule(molecule);
		action.setMoleculeID(moleculeId);
		
		HttpSession session = request.getSession();
		int userId = Integer.valueOf(session.getAttribute("userID").toString());
		clientQuery.setUserID(userId);
		//clientQuery.setUserID(1);
		clientQuery.setAction(action);

		//session.setAttribute("MOLECULENAME", moleculeName);
		//session.setAttribute("MOLECULEROLE", moleculeRole);

		System.out.println("User ID : " + clientQuery.getUserID());
		
		return clientQuery;
	}

}
