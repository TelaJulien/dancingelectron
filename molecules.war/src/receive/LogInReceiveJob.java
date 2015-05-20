package receive;

import generated.DisplayAction;

import java.util.List;

import management.ThreadRequestCouple;

import org.xml_cml.schema.cml2.core.Molecule;

public class LogInReceiveJob implements ReceiveJob {
	private ThreadRequestCouple couple;
	//private List<Molecule> molecules;

	public LogInReceiveJob(ThreadRequestCouple couple, DisplayAction action) {
		this.couple = couple;
		//molecules = action.getMolecule();
	}

	@Override
	public void execute() {
		couple.setRequestDispatcher("/menu.jsp");
		//couple.getRequest().setAttribute("molecules", molecules);
	}
}
