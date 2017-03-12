package com.allen.action;

/**
 * Created by Allen on 2017/3/12.
 */

import com.allen.interceptor.Token;
import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(value = "download")
public class DownloadAction {
    @RequestMapping("/showDownloadFile")
    @Token(save=true)
    public String showDownloadFile(HttpSession session,Model model) {
        String directory = session.getServletContext().getRealPath("/")+"download";
        File root = new File(directory);
        File[] fs = root.listFiles();
        List<String> list = new ArrayList<>();
        for(int i=0; i<fs.length; i++){
//			   System.out.println(fs[i].getAbsolutePath());
//			   System.out.println(fs[i].getName());
            list.add(fs[i].getName());
        }
        model.addAttribute("downList", list);
        return "/public/showDownloadFile.jsp";
    }

    @RequestMapping("/download_file")
    @Token(remove=true)
    public ResponseEntity<byte[]> download(String fileName, HttpSession session) throws IOException {
        String directory = session.getServletContext().getRealPath("/")+"download";
        String dfileName = new String(fileName.getBytes("utf-8"), "utf-8");
        System.out.println(dfileName);
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        headers.setContentDispositionFormData("attachment", dfileName);
        File file = new File(directory+"/"+dfileName);
        return new ResponseEntity<>(FileUtils.readFileToByteArray(file), headers, HttpStatus.CREATED);
    }
}
