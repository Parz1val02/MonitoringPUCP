package Funcion;

import Beans.Incidencia;
import Daos.IncidenciaDao;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.*;
import java.sql.SQLException;
import java.util.ArrayList;

public class EscribirExcel {

    public void metodoLlenarExcel(OutputStream outputStream){

        IncidenciaDao iDao = new IncidenciaDao();
        ArrayList<Incidencia> listaIncidencias;

        {
            try {
                listaIncidencias = iDao.obtenerIncidencias();
                Workbook libro = new XSSFWorkbook();
                final String nombreArchivo = "reporteincidencias.xlsx";
                Sheet hoja = libro.createSheet("Hoja 1");

                String[] encabezados = {"Nombre incidencia", "nivel de urgencia", "descripcion"};
                int indiceFila = 0;

                Row fila = hoja.createRow(indiceFila);
                for (int i = 0; i < encabezados.length; i++) {
                    String encabezado = encabezados[i];
                    Cell celda = fila.createCell(i);
                    celda.setCellValue(encabezado);
                }

                indiceFila++;
                for (int i = 0; i < listaIncidencias.size(); i++) {
                    fila = hoja.createRow(indiceFila);
                    Incidencia incidencia = listaIncidencias.get(i);
                    fila.createCell(0).setCellValue(incidencia.getNombreIncidencia());
                    fila.createCell(1).setCellValue(incidencia.getNivelUrgencia().getNivel());
                    fila.createCell(2).setCellValue(incidencia.getDescripcion());
                    indiceFila++;
                }

                // Guardamos
                /*File directorioActual = new File(".");
                String ubicacion = directorioActual.getAbsolutePath();
                String ubicacionArchivoSalida = ubicacion.substring(0, ubicacion.length() - 1) + nombreArchivo;
                FileOutputStream outputStream;*/
                try {
                    /*outputStream = new FileOutputStream(ubicacionArchivoSalida);*/
                    libro.write(outputStream);
                    libro.close();
                    System.out.println("Libro de personas guardado correctamente");
                } catch (FileNotFoundException ex) {
                    System.out.println("Error de filenotfound");
                } catch (IOException ex) {
                    System.out.println("Error de IOException");
                }

            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }
    }

}
