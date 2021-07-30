package com.dpj.mvc.json.controller;


import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

@Controller
public class TestDownAndUploadController {

    @RequestMapping("/down")
    public ResponseEntity<byte[]> down(HttpSession session) throws IOException {

        //获取下载文件的路径
        String realPath = session.getServletContext().getRealPath("img");
        String finalPath = realPath + File.separator + "a.png";
        InputStream is = new FileInputStream(finalPath);
        //available():获取输入流所读取的文件的最大字节数
        byte[] b = new byte[is.available()];
        is.read(b);
        //设置请求头
        HttpHeaders headers = new  HttpHeaders();
        headers.add("Content-Disposition", "attachment;filename=zzz.png");
        //设置响应状态
        HttpStatus statusCode = HttpStatus.OK;
        ResponseEntity<byte[]> entity = new ResponseEntity<byte[]>(b, headers, statusCode);
        return entity;
    }

    @RequestMapping(value = "/upload",method = RequestMethod.POST)
    public String upload(String desc, MultipartFile uploadFile,HttpSession session) throws IOException {
        String filename = uploadFile.getOriginalFilename();
        String finalFilename = UUID.randomUUID() + filename.substring(filename.lastIndexOf("."));
        String path = session.getServletContext().getRealPath("photo") + File.separator + finalFilename;
        uploadFile.transferTo(new File(path));
        System.out.println("上传成功");
        return "success";
    }
}
