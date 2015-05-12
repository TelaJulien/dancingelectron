package management;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ThreadRequestCouple {

	private Thread thread;
	private HttpServletRequest request;
	private RequestDispatcher dispatcher;

	public ThreadRequestCouple(Thread thread, HttpServletRequest request) {
		this.thread = thread;
		this.request = request;
	}

	public Thread getThread() {
		return thread;
	}

	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequestDispatcher(String url) {
		dispatcher = request.getRequestDispatcher(url);
	}

	public void forward(HttpServletResponse response) {
		try {
			dispatcher.forward(request, response);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}

	}

}
