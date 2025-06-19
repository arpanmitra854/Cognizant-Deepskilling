public class FactoryMethodPatternExample {
    public static void main(String[] args) {
        DocumentFactory wordDoc = new WordDocumentFactory(); //creating an object of WordDocumentFactory, but referencing it using the abstract class type DocumentFactory.
        Document word = wordDoc.getDocument(); // As a WordDocumentFactory object wordDoc refers the word object to the WordDocument class 
        word.open(); // In the WordDocument class the open() function is called

        DocumentFactory excelDoc = new ExcelDocumentFactory();
        Document excel = excelDoc.getDocument();
        excel.open();

        DocumentFactory pdfDoc = new PdfDocumentFactory();
        Document pdf = pdfDoc.getDocument();
        pdf.open();
    }
}
