package si.feri.NepremicninskaAgencija.Email;

import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.PDPageContentStream;
import org.apache.pdfbox.pdmodel.font.PDType1Font;

import java.io.File;
import java.io.IOException;

public class PdfGenerator {
    PdfGenerator() {
        test();

    }

//testni primer- na njem probaj izvesti watchService
    public void test() {
        try {
            PDDocument doc = new PDDocument();
            PDPage page = new PDPage();
            doc.addPage(page);
            PDPageContentStream content = new PDPageContentStream(doc, page);
            content.beginText();
            content.setFont(PDType1Font.HELVETICA, 12);
            content.newLineAtOffset(100, 700);
            content.showText("Apache PDFBox Create PDF Document");
            content.endText();
            content.close();
            // FileSystemResource file = new FileSystemResource("src//main//resources//PDFDokumenti//simple.pdf");
             doc.save(new File("src/main/resources/PDFDokumenti/simple.pdf"));
            //doc.save(new FileSystemResource("src//main//resources//PDFDokumenti//simple.pdf").getFile());
            doc.close();
        } catch (IOException e) {
        }
    }



}
