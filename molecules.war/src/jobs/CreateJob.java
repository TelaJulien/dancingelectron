package jobs;

import generated.ClientQuery;
import generated.CreateAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.xml_cml.schema.cml2.core.Atom;
import org.xml_cml.schema.cml2.core.AtomArray;
import org.xml_cml.schema.cml2.core.Bond;
import org.xml_cml.schema.cml2.core.BondArray;
import org.xml_cml.schema.cml2.core.Electron;
import org.xml_cml.schema.cml2.core.Molecule;

public class CreateJob implements Job {

	private HttpServletRequest request;

	public CreateJob(HttpServletRequest request) {
		this.request = request;
	}

	@Override
	public ClientQuery execute() {
		ClientQuery clientQuery = new ClientQuery();
		Molecule molecule = new Molecule();

		// get Name and Role of the created molecule
		String moleculeName = request.getParameter("moleculeName");
		String moleculeRole = request.getParameter("moleculeRole");

		// Atom Array
		String moleculeAtom = request.getParameter("moleculeAtom[0]");
		Atom atom = new Atom();
		atom.setTitle(moleculeAtom);
		AtomArray atomArray = new AtomArray();
		atomArray.getAtom().add(atom);

		// Bond Array
		String moleculeBond = request.getParameter("moleculeBond");
		Bond bond = new Bond();
		bond.setTitle(moleculeBond);
		BondArray bondArray = new BondArray();
		bondArray.getBond().add(bond);

		// Electron
		String moleculeElectron = request.getParameter("moleculeElectron");
		Electron electron = new Electron();
		electron.setTitle(moleculeElectron);

		// setters for the created molecule
		molecule.setTitle(moleculeName);
		molecule.setRole(moleculeRole);
		molecule.setAtomArray(atomArray);
		molecule.setBondArray(bondArray);
		molecule.getElectron().add(electron);

		// creation de l'action (CRUD + undo + redo)
		CreateAction action = new CreateAction();
		action.setMolecule(molecule);
		
		//int userID = clientQuery.getUserID();
		//clientQuery.setUserID(userID);
		clientQuery.setUserID(1);
		clientQuery.setAction(action);

		HttpSession session = request.getSession();
		session.setAttribute("MOLECULENAME", moleculeName);
		session.setAttribute("MOLECULEROLE", moleculeRole);

		return clientQuery;
	}
}
