package jobs;

import java.util.ArrayList;
import java.util.List;

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

		// setters for the created molecule
		molecule.setTitle(moleculeName);
		molecule.setRole(moleculeRole);
		molecule.setAtomArray(atomArray);
		molecule.setBondArray(bondArray);

		// creation de l'action (CRUD + undo + redo)
		CreateAction action = new CreateAction();
		action.setMolecule(molecule);
		
		HttpSession session = request.getSession();
		//int userId = Integer.valueOf((String) session.getAttribute("userId"));
		//clientQuery.setUserID(userId);
		clientQuery.setUserID(1);
		clientQuery.setAction(action);

		
		session.setAttribute("MOLECULENAME", moleculeName);
		session.setAttribute("MOLECULEROLE", moleculeRole);

		return clientQuery;
	}
}
