package jobs;

import javax.servlet.http.HttpServletRequest;

public class JobsFactory {

	public static Job build(String action, HttpServletRequest request) {

		switch (action) {
		case "creation":
			return new CreateJob(request);

		case "display":
			return new DisplayJob(request);
		
		case "update":
			return new UpdateJob(request);
			
		case "delete":
			return new DeleteJob(request);

		default:
			break;
		}

		return null;

	}
}
