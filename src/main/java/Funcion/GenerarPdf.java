package Funcion;
import Beans.Incidencia;
import Daos.IncidenciaDao;
import com.itextpdf.text.Document;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;

public class GenerarPdf {

    public void crearPdf(OutputStream outputStream){

        Document document = new Document();
        IncidenciaDao iDao = new IncidenciaDao();
        ArrayList<Incidencia> listaIncidencias;

        try{
            listaIncidencias = iDao.obtenerIncidencias();
            PdfWriter.getInstance(document, outputStream);
            document.open();

            // Este codigo genera una tabla de 3 columnas
            PdfPTable table = new PdfPTable(5);

            // addCell() agrega una celda a la tabla, el cambio de fila
            // ocurre automaticamente al llenar la fila
            table.addCell("Nombre incidencia");
            table.addCell("Nivel de urgencia");
            table.addCell("Descripcion de la incidencia");

            table.addCell("Estado");
            table.addCell("Codigo del usuario");

            for (Incidencia incidencia:listaIncidencias){

                table.addCell(incidencia.getNombreIncidencia());
                table.addCell(incidencia.getNivelUrgencia().getNivel());
                table.addCell(incidencia.getDescripcion());
                table.addCell(incidencia.getEstadoIncidencia().getEstado());
                table.addCell(incidencia.getUsuario().getCodigo());
            }


            // Si desea crear una celda de mas de una columna
            // Cree un objecto Cell y cambie su propiedad span

            //PdfPCell celdaFinal = new PdfPCell(new Paragraph("Final de la tabla"));

            // Indicamos cuantas columnas ocupa la celda
            //celdaFinal.setColspan(3);
            //table.addCell(celdaFinal);

            // Agregamos la tabla al documento
            document.add(table);

            document.close();

        }catch(Exception e)
        {
            System.err.println("Ocurrio un error al crear el archivo");
            System.exit(-1);
        }
    }


    public void crearTxt(OutputStream outputStream){

        try {
            PrintWriter writer = new PrintWriter( outputStream , "UTF-8");
            writer.println("Primera línea");
            writer.print("Segunda línea");
            writer.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
