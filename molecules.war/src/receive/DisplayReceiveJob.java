package receive;

import java.util.List;

import org.xml_cml.schema.cml2.core.Molecule;

import generated.DisplayAction;
import management.ThreadRequestCouple;

public class DisplayReceiveJob implements ReceiveJob {

	private ThreadRequestCouple couple;
	private List<Molecule> molecules;

	public DisplayReceiveJob(ThreadRequestCouple couple, DisplayAction action) {
		this.couple = couple;
		molecules = action.getMolecule();
		
		for(Molecule molecule : molecules){
			System.out.println("id: "+molecule.getId());
		}
	}

	@Override
	public void execute() {
		couple.setRequestDispatcher("/displayMolecule.jsp");
		couple.getRequest().setAttribute("molecules", molecules);
	}

}
