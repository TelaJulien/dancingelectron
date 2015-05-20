package receive;

import generated.UpdateAction;

import org.xml_cml.schema.cml2.core.Molecule;

import management.ThreadRequestCouple;

public class UpdateReceiveJob implements ReceiveJob {
	
	private ThreadRequestCouple couple;
	private Molecule molecule;

	public UpdateReceiveJob(ThreadRequestCouple couple, UpdateAction action) {
		this.couple = couple;
		molecule = action.getMolecule();
	}


	@Override
	public void execute() {
		couple.setRequestDispatcher("/resultAction.jsp");
		couple.getRequest().setAttribute("message", "Molecule has been updated");
	}

}
