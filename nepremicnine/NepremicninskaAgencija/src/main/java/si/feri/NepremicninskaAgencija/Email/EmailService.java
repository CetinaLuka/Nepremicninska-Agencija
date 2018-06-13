package si.feri.NepremicninskaAgencija.Email;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;
import si.feri.NepremicninskaAgencija.models.Nepremicnina;
import si.feri.NepremicninskaAgencija.models.Slika;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.List;

@Service
public class EmailService {

    @Autowired
    private JavaMailSender emailSender;

    @Qualifier("freeMarkerConfiguration")
    @Autowired
    private Configuration freemarkerConfig;

    public void sendSimpleMessage(Mail mail,Nepremicnina nepremicnina, List<Slika> slike) throws MessagingException, IOException, TemplateException {
    /*
        WatchService watchService = FileSystems.getDefault().newWatchService();
        Path directory = Paths.get("/src/main/resources/PDFDokumenti/");
        WatchKey watchKey = directory.register(watchService,StandardWatchEventKinds.ENTRY_CREATE,
                StandardWatchEventKinds.ENTRY_DELETE,StandardWatchEventKinds.ENTRY_MODIFY,
                StandardWatchEventKinds.OVERFLOW);
    */

            /*
            PDDocument doc = new PDDocument();
            PDPage page = new PDPage();
            doc.addPage(page);
            PDPageContentStream content = new PDPageContentStream(doc, page);
            content.beginText();
            content.setFont(PDType1Font.HELVETICA, 12);
            content.newLineAtOffset(100, 700);
            content.showText("Apache PDFBox Create PDF Documentaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" +
                    "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
            content.endText();
            content.close();
            // FileSystemResource file = new FileSystemResource("src//main//resources//PDFDokumenti//simplee.pdf");
            //  doc.save(new File("src/main/resources/PDFDokumenti/simplee.pdf"));
            doc.save(new FileSystemResource("src//main//resources//PDFDokumenti//simple.pdf").getFile());
            doc.close();
            */

            //test
                    /*
                            WatchService service = FileSystems.getDefault().newWatchService();
                            Map<WatchKey,Path> keyMap= new HashMap<>();
                            Path path = Paths.get("PDFDokumenti");
                            keyMap.put(path.register(service,
                                    StandardWatchEventKinds.ENTRY_CREATE,
                                    StandardWatchEventKinds.ENTRY_DELETE,
                                    StandardWatchEventKinds.ENTRY_MODIFY),
                                    path);
                            WatchKey watchKey;
                            do {
                                watchKey=service.take();
                                Path eventDir = keyMap.get(watchKey);
                                for(WatchEvent<?> event : watchKey.pollEvents()) {
                                    WatchEvent.Kind<?> kind = event.kind();
                                    Path eventPath = (Path)event.context();
                                    System.out.println(eventDir+" :" +kind+" :"+eventPath);
                                }
                            }while(watchKey.reset());
                    */
            /*
            WatchService watcher = FileSystems.getDefault().newWatchService();
            Path dir =Paths.get("/src/main/resources/PDFDokumenti/");
            try {
                WatchKey key = dir.register(watcher,
                        ENTRY_CREATE, ENTRY_DELETE, ENTRY_MODIFY);


                } catch (IOException x) {
                System.err.println(x);
            }
            */
            MimeMessage message = emailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message,
                    MimeMessageHelper.MULTIPART_MODE_MIXED_RELATED,
                    StandardCharsets.UTF_8.name());
            //helper.addAttachment("logo.png", new ClassPathResource("/PDFDokumenti/logo.png"));
            //InputStreamSource iss = ustvariNovPdf.slika();
            //helper.addAttachment("odebeljen.pdf", iss);
            //iss.getInputStream().close();
            Template t = freemarkerConfig.getTemplate("email-template.ftl");
            String html = FreeMarkerTemplateUtils.processTemplateIntoString(t, mail.getModel());
            helper.setTo(mail.getTo());
            helper.setText(html, true);
            helper.setSubject(mail.getSubject());
            //helper.setFrom(mail.getFrom());
            //helper.addAttachment("odebeljen.pdf", new ClassPathResource("C:\\Users\\zanko\\Desktop\\PDF\\odebeljen.pdf"));
            //Path a = Paths.get(System.getProperty("/PDFDokumenti/simplee.pdf"));
            //FileSystemResource a =  new FileSystemResource("src//main//resources//PDFDokumenti//simple.pdf");
            //PdfGenerator ustvariNovPdf = new PdfGenerator(mail.getNepremicnina(),mail.getSlike());
            PdfGenerator ustvariNovPdf = new PdfGenerator(nepremicnina,slike);
            helper.addAttachment("Nepremicnina.pdf", ustvariNovPdf.pdfNepremicnina());
            emailSender.send(message);
    }


    public void sendSimpleMessage(Mail mail){
        try {

            MimeMessage message = emailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message,
                    MimeMessageHelper.MULTIPART_MODE_MIXED_RELATED,
                    StandardCharsets.UTF_8.name());

            Template t = freemarkerConfig.getTemplate("email-template-pozabilGeslo.ftl");
            String html = FreeMarkerTemplateUtils.processTemplateIntoString(t, mail.getModel());
            helper.setTo(mail.getTo());
            helper.setText(html, true);
            helper.setSubject(mail.getSubject());
            emailSender.send(message);
        }catch (Exception e){
            e.printStackTrace();
        }

    }


}


