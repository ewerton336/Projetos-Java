package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DataHora
 */
@WebServlet("/MathServlet")
public class MathServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public MathServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	    try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
	    	response.setContentType("text/html;charset=UTF-8");
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Calculadora</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("Números digitados:");
            double n1 = Double.parseDouble(request.getParameter("n1"));
            out.println("<h2>N1= "+n1+" </h2>");
            double n2 = Double.parseDouble(request.getParameter("n2"));
            out.println("<h2>N2= "+n2+" </h2>");
            out.println("<br> <br> <h3> Soma: </h3>");
            out.println(n1+ " + " +n2+ " = "+ (n1+n2)  );
            out.println("<br> <br> <h3> Subtração: </h3>");
            out.println(n1+ " + " +n2+ " = "+ (n1-n2)  );
            out.println("<br> <br> <h3> Multiplicação: </h3>");
            out.println(n1+ " + " +n2+ " = "+ (n1*n2)  );
            out.println("<br> <br> <h3> Divisão: </h3>");
            out.println(n1+ " + " +n2+ " = "+ (n1/n2)  );
            out.println("</body>");
            out.println("</html>");
        }
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
