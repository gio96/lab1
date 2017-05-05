/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

import dao.VehiculoFacadeLocal;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Vehiculo;

/**
 *
 * @author USER
 */
public class vehServlet extends HttpServlet {

    @EJB
    private VehiculoFacadeLocal vehiculoFacade;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
//        String matricula= request.getParameter("matricula");
        
        try {
            /* TODO output your page here. You may use following sample code. */
            String action = request.getParameter("action");
            String url = "";
            out.print(action);         
            
            switch(action)
            {
                case "lista":
                    List<Vehiculo> getAll = vehiculoFacade.findAll();
                    request.getSession().setAttribute("getAll", getAll);
                    url= "vehiculo.jsp";
                    System.out.println("estoy en lista");
                    break;
                
                case "buscar":
                    String matricula1= request.getParameter("matricula"); // AQUI ESTA EL HIJO DE PUTA PROBLEMA DE MIERDA
                    String marca = request.getParameter("marca");
                    String modelo = request.getParameter("modelo");
                    String color = request.getParameter("color");
                    String precio = request.getParameter("precio");
//                    out.print(matricula1);
                    System.out.println(matricula1 + " " + marca + " " + modelo + " " +color+ " " +precio );
                    
                    
                    Vehiculo vh = vehiculoFacade.find(matricula1);
                    
                    request.getSession().setAttribute("getOne", vh);
                    url="vehiculo.jsp";
//                    request.getRequestDispatcher("vehiculo.jsp").forward(request, response);
                    break;
                    
                case "funcio":
                    String placa = request.getParameter("placa");
                    System.out.println(placa );
                    
                    Vehiculo vh1 = vehiculoFacade.find(placa);
                    
                    request.getSession().setAttribute("getOne", vh1);
                    url="funcionara.jsp";
                
            }
            
//            RequestDispatcher dispatcher =getServletContext().getRequestDispatcher("/vehiculo.jsp");
//            dispatcher.forward(request, response);
            response.sendRedirect(url);
            
        }finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
