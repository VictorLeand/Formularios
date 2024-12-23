package org.aguzman.apiservlet.webapp.form;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

@WebServlet("/crear")
public class RegistroProductoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        getServletContext().getRequestDispatcher("/form.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");

        String nombre = req.getParameter("nombre");
        String precioStr = req.getParameter("precio");
        int precio = 0;
        String fabricante = req.getParameter("fabricante");
        String categoria = req.getParameter("categoria");

        Map<String, String> errores = new HashMap<>();

        if (nombre == null || nombre.isBlank()) {
            errores.put("nombre", "el nombre no puede ser vacío!");
        }

        if (precioStr == null || precioStr.isBlank()) {
            errores.put("precio", "el precio no puede ser vacío y debe ser número entero!");
        } else {
            try {
                precio = Integer.parseInt(precioStr);
                if (precio <= 0) {
                    errores.put("precio", "El precio debe ser mayor a 0");
                }
            } catch (NumberFormatException e) {
                errores.put("precio", "El precio debe ser un número válido.");
            }
        }

        if (fabricante == null || fabricante.isBlank()  ||fabricante.length() < 4 || fabricante.length() > 10) {
            errores.put("fabricante", "El fabricante no debe ser vacío y debe tener entre 4 y 10 carácteres.");
        }

        if (categoria == null || categoria.isBlank()) {
            errores.put("categoria", "debe seleccionar una categoria.");
        }

        if (errores.isEmpty()) {
            try (PrintWriter out = resp.getWriter()) {

                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("    <head>");
                out.println("        <meta charset=\"UTF-8\">");
                out.println("        <title>Resultado form</title>");
                out.println("    </head>");
                out.println("    <body>");
                out.println("        <h1>Resultado formulario productos</h1>");

                out.println("        <ul>");
                out.println("            <li>Nombre: " + nombre + "</li>");
                out.println("            <li>Precio: " + precio + "</li>");
                out.println("            <li>Fabricante: " + fabricante + "</li>");
                out.println("            <li>Categoría: " + categoria + "</li>");
                out.println("        </ul>");
                out.println("    </body>");
                out.println("</html>");
            }
        } else {
            req.setAttribute("errores", errores);
            getServletContext().getRequestDispatcher("/form.jsp").forward(req, resp);
        }
    }
}
