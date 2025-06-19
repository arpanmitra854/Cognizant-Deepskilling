public class PdfDocumentFactory extends DocumentFactory{
    public Document getDocument(){
        return new PdfDocument();
    }
}
