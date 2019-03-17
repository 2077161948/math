package cn.ym.util;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.StringReader;
import java.io.StringWriter;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.imageio.ImageIO;
import javax.swing.JLabel;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;
import org.apache.poi.xwpf.usermodel.XWPFPictureData;
import org.apache.poi.xwpf.usermodel.XWPFRun;
import org.apache.xmlbeans.XmlCursor;
import org.apache.xmlbeans.XmlException;
import org.apache.xmlbeans.XmlObject;
import org.apache.xmlbeans.XmlToken;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.openxmlformats.schemas.officeDocument.x2006.math.CTOMath;
import org.openxmlformats.schemas.officeDocument.x2006.math.CTOMathPara;
import org.openxmlformats.schemas.officeDocument.x2006.math.CTR;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.CTP;
import org.scilab.forge.jlatexmath.TeXConstants;
import org.scilab.forge.jlatexmath.TeXFormula;
import org.scilab.forge.jlatexmath.TeXIcon;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import com.github.pagehelper.util.StringUtil;
import com.lowagie.text.BadElementException;

import cn.ym.pojo.Aproblem;
import fmath.b.b.r;
import fmath.conversion.ConvertFromLatexToMathML;


@Component
public class ConvertOutHtml {
	//static String str="<p style='font-size=14px'>1．$f(x)=w+1$不等于( )</p>";

    @Value("${filepath}")
	String soopath="E:/Files/";
/*public static void main(String[] args) throws Exception{
		ConvertOutHtml html = new ConvertOutHtml();
	//html.start("C:\\Users\\user\\Desktop\\tt.docx");
	//html.upload(str,new XWPFDocument());
			XWPFDocument document = new XWPFDocument();
			html.latex2mathMl(document.createParagraph(),"$f(x) = 3x + 7$");
			FileOutputStream stream=new FileOutputStream(new File("C:\\Users\\user\\Desktop\\x.docx"));
				document.write(stream);
			//html.addimg("url=/file/image1.png;x=1449534;y=642691", null);

	try {
		try {
			//latex2mathMl(paragraph, "$f(x) = 3x + 7$");
		} catch (XmlException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (TransformerException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//latexImage(" $f(x) = 3x + 7$", "C:\\Users\\user\\Desktop\\1.png");
		
	
	} catch (BadElementException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
}*/
	
	private static String latexImage(String formulaStr,String path) throws IOException, BadElementException {
	    TeXFormula tf = new TeXFormula(formulaStr);
	    TeXIcon ti = tf.createTeXIcon(TeXConstants.STYLE_DISPLAY, 40);
	    BufferedImage bimg = new BufferedImage(ti.getIconWidth(), ti.getIconHeight(), BufferedImage.TYPE_4BYTE_ABGR);
	    Graphics2D g2d = bimg.createGraphics();
	    g2d.setColor(Color.white);
	    g2d.fillRect(0,0,ti.getIconWidth(),ti.getIconHeight());
	    JLabel jl = new JLabel();
	    jl.setForeground(new Color(0, 0, 0));
	    ti.paintIcon(jl, g2d, 0, 0);
	    File out = new File(path);
	    ImageIO.write(bimg, "png", out);
	    return path;
	}
	
    private  CTP latex2mathMl(XWPFParagraph paragraph,String latex){
    	try {
        String mathML = fmath.conversion.ConvertFromLatexToMathML.convertToMathML(latex);
        mathML = mathML.replaceFirst("<math ", "<math xmlns=\"http://www.w3.org/1998/Math/MathML\" ");
        CTOMath ctOMath = getOMML(mathML);
        CTP ctp = paragraph.getCTP();
        CTOMath ctoMath = ctp.addNewOMath();
        ctoMath.set(ctOMath);
        return ctp;
    	}catch (Exception e) {
			System.out.println(e.getMessage());
    		// TODO: handle exception
		}
		return null;


    }

    public List<Aproblem> start(String path,Integer id) {
		boolean g =true;
		int w=0;
    	List<Aproblem> list=new ArrayList<>();
    	try {
    	File in=new File(path);
			XWPFDocument docxDocument = new XWPFDocument(new FileInputStream(in));
			StringBuffer str=new StringBuffer();

			List<XWPFParagraph> paragraphs = docxDocument.getParagraphs();
				for (XWPFParagraph x : paragraphs) {
					String html = paragraphToHtml(x,docxDocument,path);
					if (html.contains("参考答案")) {
						boolean t=false;
						g=t;
						Aproblem apr = new Aproblem();
						apr.setBody(str.toString());
						str.delete(0, str.length());
						list.add(apr);
						continue;
						
					}
					if (g&&Pattern.matches("^<p style='font-size=14px'>\\d{1,2}(\\.|．|。).*",html)) {
						if (StringUtil.isEmpty(str.toString())) {
							String first = html.replaceAll("\\d{1,2}(\\.|．|。)", "");
							str.append(first);
						}else {
							Aproblem a = new Aproblem();
							a.setBody(str.toString());
							str.delete(0, str.length());
							list.add(a);
						}
					}else if (!g&&Pattern.matches("^<p style='font-size=14px'>\\d{1,2}(\\.|．|。).*",html)) {
						if (StringUtil.isEmpty(str.toString())) {
							String first = html.replaceAll("[\\d{1,2}(\\.|．|。)]", "");
							str.append(first);
						}else {
							Aproblem aproblem = list.get(w);
							aproblem.setAnalysis(str.toString());
							int a=w;
							w=++a;
						}
						
					} else {
						str.append(html);
					}
				}
				
		
			if (!StringUtil.isEmpty(str.toString())) {
				list.get(w).setAnalysis(str.toString());
			}
    	}catch (Exception e) {
    		System.out.println(e.getMessage());
			// TODO: handle exception
    		return list;
		}
    	list.forEach(x->{x.setFiledocId(id);});
		return list;
    	
	}

    
	public String paragraphToHtml(XWPFParagraph paragraph,XWPFDocument document,String path) {
    	File f = new File(path);
		StringBuffer buffer=new StringBuffer();
    	buffer.append("<p style='font-size=14px'>");
    	paragraph.getRuns().forEach(w->{
    		String str = w.getCTR().toString();
    		Pattern r = Pattern.compile("r:embed=\"(.*)\"");
    		Matcher matcher = r.matcher(str);
    		if (matcher.find( )) {
    			String x=matcher.group(1);
    			XWPFPictureData data = document.getPictureDataByID(x);
    			try {
    				File file = new File(f.getParent(),data.getFileName());
    			if(!file.exists())file.createNewFile();
				FileOutputStream stream = new FileOutputStream(file);
				stream.write(data.getData());
				stream.flush();
				stream.close();
				Pattern t = Pattern.compile("wp:extent cx=\"([0-9]*)\"\\scy=\"([0-9]*)");
				Matcher a = t.matcher(str);
				a.find();
				System.out.println(a.group(1));
				String img="$url="+file.getAbsolutePath()+";x="+a.group(1)+";y="+a.group(2)+"$";
				String wh=img.replaceAll("\\\\", "/");
				String replace = wh.replace(soopath, "/file/");
				buffer.append(replace);
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}
    		}else {
    					if (w.getText(0)!=null) {
							buffer.append(w.getText(0));
						}
  
    		}
    	});
    	buffer.append("</p>");
		return buffer.toString();
    	
    }
public void upload(String str,XWPFDocument document,int tw) { 	
StringBuffer buffer=new StringBuffer();
Elements tag = Jsoup.parse(str).getElementsByTag("P");
boolean g=true;
for (Element element : tag) {
	XWPFParagraph paragraph = document.createParagraph();
	if (g) {
		paragraph.createRun().setText(tw+".");
	}
	char[] text = element.text().toCharArray();
	int w=0;
	for (char c : text) {
		if (c=='$') {
			w=w+1;
			if (w==2) {
				String t = buffer.toString();
			buffer.delete(0, buffer.length());
			w=0;
			if (t.startsWith("url=")) {
				addimg(t,paragraph.createRun());
			}else {
				latex2mathMl(paragraph, "$"+t+"$");
			
			}
				}else if (w==1) {
					String s = buffer.toString();
					paragraph.createRun().setText(s);
					buffer.delete(0, buffer.length());
					 continue;
				}
		}else {
			buffer.append(c);
		}
		
	}
	paragraph.createRun().setText(buffer.toString());
}		
		
	}
public void	 addimg(String str,XWPFRun run){
	  String imgFile = str.split(";")[0].split("=")[1].replace("/file/", soopath);
	  System.out.println(imgFile);
	  int x = Integer.valueOf(str.split(";")[1].split("=")[1]);
	  int y = Integer.valueOf(str.split(";")[2].split("=")[1]);
        int format=0;

        if(imgFile.endsWith(".emf")) format = XWPFDocument.PICTURE_TYPE_EMF;
        else if(imgFile.endsWith(".wmf")) format = XWPFDocument.PICTURE_TYPE_WMF;
        else if(imgFile.endsWith(".pict")) format = XWPFDocument.PICTURE_TYPE_PICT;
        else if(imgFile.endsWith(".jpeg") || imgFile.endsWith(".jpg")) format = XWPFDocument.PICTURE_TYPE_JPEG;
        else if(imgFile.endsWith(".png")) format = XWPFDocument.PICTURE_TYPE_PNG;
        else if(imgFile.endsWith(".dib")) format = XWPFDocument.PICTURE_TYPE_DIB;
        else if(imgFile.endsWith(".gif")) format = XWPFDocument.PICTURE_TYPE_GIF;
        else if(imgFile.endsWith(".tiff")) format = XWPFDocument.PICTURE_TYPE_TIFF;
        else if(imgFile.endsWith(".eps")) format = XWPFDocument.PICTURE_TYPE_EPS;
        else if(imgFile.endsWith(".bmp")) format = XWPFDocument.PICTURE_TYPE_BMP;
        else if(imgFile.endsWith(".wpg")) format = XWPFDocument.PICTURE_TYPE_WPG;
        else {
            System.err.println("Unsupported picture: " + imgFile +
                    ". Expected emf|wmf|pict|jpeg|png|dib|gif|tiff|eps|bmp|wpg");
        }
        try {
			run.addPicture(new FileInputStream(imgFile), format, imgFile,x, y);
		} catch (InvalidFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} // 200x200 pixels

    }
 CTOMath getOMML(String mathML) throws TransformerException, IOException, XmlException {
	 URL url = this.getClass().getClassLoader().getResource("MML2OMML.XSL");	
	 File stylesheet = new File(url.getPath());
    TransformerFactory tFactory = TransformerFactory.newInstance();
    StreamSource stylesource = new StreamSource(stylesheet);
    Transformer transformer = tFactory.newTransformer(stylesource);

    StringReader stringreader = new StringReader(mathML);
    StreamSource source = new StreamSource(stringreader);

    StringWriter stringwriter = new StringWriter();
    StreamResult result = new StreamResult(stringwriter);

    transformer.transform(source, result);

    String ooML = stringwriter.toString();
    stringwriter.close();

    CTOMathPara ctOMathPara = CTOMathPara.Factory.parse(ooML);

    CTOMath ctOMath = ctOMathPara.getOMathArray(0);

    //for making this to work with Office 2007 Word also, special font settings are necessary
    XmlCursor xmlcursor = ctOMath.newCursor();
    while (xmlcursor.hasNextToken()) {
        XmlCursor.TokenType tokentype = xmlcursor.toNextToken();
        if (tokentype.isStart()) {
            if (xmlcursor.getObject() instanceof CTR) {
                CTR cTR = (CTR) xmlcursor.getObject();
                cTR.addNewRPr2().addNewRFonts().setAscii("Cambria Math");
                cTR.getRPr2().getRFonts().setHAnsi("Cambria Math");
            }
        }
    }

    return ctOMath;
}
}