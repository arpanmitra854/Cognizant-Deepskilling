public class ExcelDocumentFactory extends DocumentFactory{
    public Document getDocument(){
        return new ExcelDocument();
    }
}
