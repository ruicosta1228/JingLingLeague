package cn.edu.jlxy.jinglingleague.controller;

import cn.edu.jlxy.jinglingleague.entity.Society;
import cn.edu.jlxy.jinglingleague.service.ISocietyService;
import cn.edu.jlxy.jinglingleague.util.JsonUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by neo on 2017/6/10.
 */
@Controller
@RequestMapping("/society")
public class SocietyController {

    @Resource
    ISocietyService societyService;

    @RequestMapping("/insertNews")
    public void insertNews(@RequestParam String timeLabel, @RequestParam String composerImage, @RequestParam String userImage, @RequestParam String nameLabel, @RequestParam String titleLabel, @RequestParam String statusLabel, HttpServletResponse response) throws IOException {
        PrintWriter out = response.getWriter();

        Society news = new Society();
        news.setTimeLabel(timeLabel);
        news.setComposeImage(composerImage);
        news.setUserImage(userImage);
        news.setNameLabel(nameLabel);
        news.setTitleLabel(titleLabel);
        news.setStatusLabel(statusLabel);

        if(societyService.createNews(news)){
            out.print("{\"insertNews\":" + "\"success\"}");
        } else {
            out.print("{\"insertNews\":" + "\"failure\"}");
        }
    }

    @RequestMapping("/societyUpload")
    public void oneUpload(@RequestParam("composeImage") MultipartFile imageFile, HttpServletRequest request, HttpServletResponse response){

        String uploadUrl = request.getSession().getServletContext().getRealPath("/") + "images/society";
        Format format = new SimpleDateFormat("yyyyMMdd");
        String time_stamp = format.format(new Date());
        String filename = time_stamp + imageFile.getOriginalFilename();

        File dir = new File(uploadUrl);
        if (!dir.exists()) {
            dir.mkdirs();
        }

        System.out.println("文件上传到: " + uploadUrl + filename);

        File targetFile = new File(uploadUrl + filename);
        if (!targetFile.exists()) {
            try {
                targetFile.createNewFile();
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }

        try {
            imageFile.transferTo(targetFile);
        } catch (IllegalStateException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }

    @RequestMapping("/getnews")
    public void getnews(@RequestParam String sId, @RequestParam String isNew, @RequestParam String count, HttpServletResponse response) throws IOException {
        PrintWriter out = response.getWriter();
        if (isNew.equals("new")){
            out.print(JsonUtils.objectToJson(societyService.getNews(Integer.parseInt(sId),true,Integer.parseInt(count))));
        } else {
            out.print(JsonUtils.objectToJson(societyService.getNews(Integer.parseInt(sId),false,Integer.parseInt(count))));
        }
    }
}
