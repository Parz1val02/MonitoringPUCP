package Servlets;

import Daos.IncidenciaDao;
import Funcion.EscribirExcel;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

@WebServlet(name = "FormatosServlet", value = "/FormatosServlet")
public class FormatosServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        IncidenciaDao iDao = new IncidenciaDao();

        String formato = request.getParameter("formato");

        switch (formato){

            case "excel":
                //abrir un archivo
                response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
                response.setHeader("Content-disposition", "attachment; filename=reporte.xlsx");

                try(OutputStream out = response.getOutputStream()) {

                    EscribirExcel excel = new EscribirExcel();
                    excel.metodoLlenarExcel(out);

                    /*byte[] buffer = new byte[ARBITARY_SIZE];

                    int numBytesRead;
                    while ((numBytesRead = in.read(buffer)) > 0) {
                        out.write(buffer, 0, numBytesRead);
                    }*/
                }
                break;
            case "pdf":
                //falta para pdf(similar a excel)
                break;
            case "txt":
                //formato que se meustre como un .csv (como comillas)
                break;


        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
