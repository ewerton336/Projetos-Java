package servlets;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

/**
 * Servlet implementation class JurosSimplesServlet
 */
@WebServlet("/juros-simples.html")
public class JurosSimplesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public JurosSimplesServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		 try ( PrintWriter out = response.getWriter()) {
	            /* TODO output your page here. You may use following sample code. */
			   out.println("<!DOCTYPE html>");
	            out.println("<html>");
	            out.println("<head>");
	            out.println("<title>Calculadora</title>");            
	            out.println("</head>");
	            out.println("<body>");
	            double vp = Double.parseDouble(request.getParameter("vp"));
	            out.println("<h2>Valor Presente= R$"+vp+" </h2>");
	            double j = Double.parseDouble(request.getParameter("j"));
	            out.println("<h2>Juros= "+j+"% </h2>");
	            j = (j/100);
	            double n = Double.parseDouble(request.getParameter("n"));
	            out.println("<h2>meses= "+n+" </h2>");
	            double ValorFuturo=(vp + (1 + j * n));
	            out.println("<h1>Valor futuro= R$"+ValorFuturo+" </h2>");
	            
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
