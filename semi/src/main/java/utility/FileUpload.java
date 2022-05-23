package utility;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public class FileUpload {

	public String fileUploadName(String originalName) {
		int dot=originalName.lastIndexOf(".");
		String extension=originalName.substring(dot, originalName.length());
		
		Calendar now=Calendar.getInstance();
		int y=now.get(Calendar.YEAR);
		int m=now.get(Calendar.MONTH)+1;
		int d=now.get(Calendar.DATE);
		int h=now.get(Calendar.HOUR_OF_DAY);
		int n=now.get(Calendar.MINUTE);
		int s=now.get(Calendar.SECOND);
		int l=now.get(Calendar.MILLISECOND);
		
		String name=y+"_"+(m<10?"0"+m:m)+(d<10?"0"+d:d)+"_"
					+(h<10?"0"+h:h)+(n<10?"0"+n:n)+(s<10?"0"+s:s)+"_"
					+(l>=100?l:l>=10?"0"+l:"00"+l)+extension;
		
		return name;
	}
	
	public String fileUploadEvent(ArrayList<MultipartFile> upload, HttpServletRequest request) {
		if (upload.size()==0) {
			return "no image";
		}
		
		String imgList="";
		String path=request.getServletContext().getRealPath("/upload");
		
		for (int i = 0; i < upload.size(); i++) {
			if (upload.get(i).getOriginalFilename()=="") {
				imgList+="no image,";
			} else {
				String name=fileUploadName(upload.get(i).getOriginalFilename());
				imgList+=name+",";
				File file=new File(path+"\\"+name);
				try {
					upload.get(i).transferTo(file);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			}
		}
		
		imgList=imgList.substring(0, imgList.length()-1);
		return imgList;
	}
	
}
