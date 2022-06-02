package utility;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public class FileUpload {

	//파일명 설정 : 년_월일_시분초_밀리초.확장자
	public String fileUploadName(String originalName) {
		int dot=originalName.lastIndexOf(".");
		System.out.println("dot"+dot);
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
	
	//파일 업로드 후 업로드된 파일명 반환, 업로드하지 않으면 no image
	public String fileUploadEvent(ArrayList<MultipartFile> upload, HttpServletRequest request) {
		if (upload.size()==0) {
			return "no image";
		}
		System.out.println(upload.get(0).getOriginalFilename());//
		
		String imgList="";
		String path=request.getServletContext().getRealPath("/upload");
		
		for (int i = 0; i < upload.size(); i++) {
			if (upload.get(i).getOriginalFilename().equals("")) {
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
	
	//파일 업데이트 : 업로드 안할 시 기존 파일 유지
	public String fileUpdateEvent(String existingFile, MultipartFile upload,
			HttpServletRequest request) {
		String img=existingFile;
		String path=request.getServletContext().getRealPath("/upload");
		
		if (!upload.getOriginalFilename().equals("")) {
			deleteFile(existingFile, request);
			String name=fileUploadName(upload.getOriginalFilename());
			img=name;
			File file=new File(path+"\\"+name);
			try {
				upload.transferTo(file);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		
		return img;
	}
	
	//파일 삭제
	public void deleteFile(String existingFile, HttpServletRequest request) {
		String path=request.getServletContext().getRealPath("/upload");
		File file=new File(path+"\\"+existingFile);
		if (file.exists()) {
			file.delete();
			System.out.println(existingFile+"파일 삭제 성공");
		} else {
			System.out.println("파일이 없음");
		}
	}
	
}
