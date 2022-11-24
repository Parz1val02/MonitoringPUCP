package Funcion;


/*public class PdfWriter {

    /*public void crearPdf(){

        Document doc = new Document();

// Añadir página
        Page page = doc.getPages().add();

// Crear una instancia de un objeto de tabla
        Table tab1 = new Table();

// Agregue la tabla en la colección de párrafos de la sección deseada
        page.getParagraphs().add(tab1);

// Establecer con anchos de columna de la tabla
        tab1.setColumnWidths ("50 50 50");

// Establecer borde de celda predeterminado usando el objeto BorderInfo
        tab1.setDefaultCellBorder(new BorderInfo(BorderSide.All, 0.1F));

// Establecer el borde de la tabla usando otro objeto BorderInfo personalizado
        tab1.setBorder (new BorderInfo(BorderSide.All, 1F));

// Cree el objeto MarginInfo y establezca sus márgenes izquierdo, inferior, derecho y superior
        MarginInfo margin = new MarginInfo();
        margin.setTop (5f);
        margin.setLeft (5f);
        margin.setRight (5f);
        margin.setBottom (5f);

// Establezca el relleno de celda predeterminado en el objeto MarginInfo
        tab1.setDefaultCellPadding(margin);

// Crear filas en la tabla y luego celdas en las filas
        Row row1 = tab1.getRows().add();
        row1.getCells().add("col1");
        row1.getCells().add("col2");
        row1.getCells().add();

        TextFragment mytext = new TextFragment("col3 with large text string");

        row1.getCells().get_Item(2).getParagraphs().add(mytext);
        row1.getCells().get_Item(2).setWordWrapped(false);

        Row row2 = tab1.getRows().add();
        row2.getCells().add("item1");
        row2.getCells().add("item2");
        row2.getCells().add("item3");

// Guardar el PDF
        doc.save("create-table-margin-border.pdf")

    }

}*/
