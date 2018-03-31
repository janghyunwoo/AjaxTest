

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.fasterxml.jackson.core.JsonFactory;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * Servlet implementation class AjaxController
 */
@WebServlet("/AjaxController")
public class AjaxController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	//request.response.getWriter().append("Served at: ").append(request.getContextPath());
		System.out.println(request.getParameter("id"));

		response.setContentType("text/html;charset=euc-kr");
		/*String strClassPath = System.getProperty("java.class.path");
		System.out.println(strClassPath+"::"+request.getParameter("id")
				+":"+request.getParameter("pw")
				);*/
		ObjectMapper mapper = new ObjectMapper();
/*
		ArrayList<User> users = new ArrayList<>();
		User user1 = new User(request.getParameter("id"), request.getParameter("pw"), new Date());
		User user2 = new User(request.getParameter("id")+"2", request.getParameter("pw")+"2", new Date());
		users.add(user1);
		users.add(user2);

		try {
			response.getWriter().print(mapper.writeValueAsString(users));
		} catch (Exception e) {
			// TODO: handle exception
		}*/

		String oldstring = "2011-01-18 00:00:00.0";
		Date date = null;
		try {
			date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S").parse(oldstring);
		} catch (ParseException e1) {
			// TODO 자동 생성된 catch 블록
			e1.printStackTrace();
		}
		System.out.println(date);
		//디비에서 받아온 date를 아래 코드로 파싱하면 될듯
		String newstring = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S").format(System.currentTimeMillis());
		System.out.println(newstring);

		ArrayList<User> memberlist = new ArrayList<>();
		User user1 = new User(request.getParameter("id"), request.getParameter("pw"), date,newstring);
		User user2 = new User(request.getParameter("id")+"2", request.getParameter("pw")+"2", new Date(),"dd");
		memberlist.add(user1);
		memberlist.add(user2);

		 HashMap<String,Object> map=new HashMap<String,Object>();

		 map.put("memberlist",memberlist);

		 JSONObject jsonObject= new JSONObject();

		 jsonObject.putAll(map);


		 try {
				response.getWriter().print(mapper.writeValueAsString(jsonObject));
			} catch (Exception e) {
				// TODO: handle exception
			}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
