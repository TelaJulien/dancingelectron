package servlet;

import generated.Action;
import generated.ClientQuery;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.TextMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jobs.Job;
import jobs.JobsFactory;
import management.ThreadRequestCouple;
import messages.MessagesManager;
import messaging.OnMessageReceived;
import receive.ReceiveJob;
import receive.ReceiveJobFactory;
import utils.JAXBUtils;

/**
 * Servlet implementation class GUIServlet
 */
@WebServlet("/GUIServlet")
public class GUIServlet extends HttpServlet implements OnMessageReceived {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */

	private MessagesManager messagesManager;
	private Map<String, ThreadRequestCouple> management;

	public GUIServlet() {
		super();

		// creation de la file de messages
		messagesManager = new MessagesManager();
		messagesManager.setMessageListener(this);

		management = new HashMap<String, ThreadRequestCouple>();

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String action = request.getParameter("action");
		Job job = JobsFactory.build(action, request);
		ClientQuery clientQuery = job.execute();

		// transformation du message en flux xml
		String xml = JAXBUtils.marshall(clientQuery, ClientQuery.class);

		// on met le flux dans un text message
		TextMessage textMessage = messagesManager.createTextMessage();
		String messageID = "";
		try {
			textMessage.setText(xml);
			messageID = messagesManager.send(textMessage);
			System.out.println(" id:" + messageID);
		} catch (JMSException e) {
			e.printStackTrace();
		}

		Thread thread = Thread.currentThread();
		ThreadRequestCouple couple = new ThreadRequestCouple(thread, request);
		management.put(messageID, couple);

		synchronized (thread) {
			try {
				thread.wait();
			} catch (InterruptedException e1) {
				e1.printStackTrace();
			}
		}

		couple.forward(response);
	}

	@Override
	public void processMessage(Message message) {

		ThreadRequestCouple couple = null;
		try {
			couple = management.get(message.getJMSCorrelationID());
		} catch (JMSException e) {
			e.printStackTrace();
		}

		TextMessage textMessage = (TextMessage) message;

		ClientQuery query = null;
		try {
			query = (ClientQuery) JAXBUtils.unmarshall(textMessage.getText(),
					ClientQuery.class);
		} catch (JMSException e) {
			e.printStackTrace();
		}

		
		Action action =  query.getAction();
		ReceiveJob job = ReceiveJobFactory.build(couple, action);
		job.execute();
		
		Thread thread = couple.getThread();
		synchronized (thread) {
			thread.notify();
		}

	}

}
