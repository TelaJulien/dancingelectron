package receive;



import generated.LoginAction;
import management.ThreadRequestCouple;


public class LogInReceiveJob implements ReceiveJob {
	private ThreadRequestCouple couple;
	//private List<Molecule> molecules;

	public LogInReceiveJob(ThreadRequestCouple couple, LoginAction action) {
		this.couple = couple;
		//molecules = action.getMolecule();
	}

	@Override
	public void execute() {
		
		// faire le if avec OK et erreur donc retour à la page précédente avec ça : <a href="Javascript:history.go(-1)">
		couple.setRequestDispatcher("/menu.jsp");
	}
}
