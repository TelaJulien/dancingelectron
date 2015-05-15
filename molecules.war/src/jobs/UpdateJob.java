package jobs;

import javax.servlet.http.HttpServletRequest;

import generated.ClientQuery;

public class UpdateJob implements Job {
	
	private HttpServletRequest request;

	public UpdateJob(HttpServletRequest request) {
		this.request = request;
	}

	@Override
	public ClientQuery execute() {
		// TODO Auto-generated method stub
		return null;
	}

}
