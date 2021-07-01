package com.javalec.project_zagoga.controller;

import com.javalec.project_zagoga.dto.GhouseRoomImages;
import com.javalec.project_zagoga.dto.Room;
import com.javalec.project_zagoga.services.RoomService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/room")
public class RoomController {
    private final RoomService roomService;

    public RoomController(RoomService roomService){
        this.roomService = roomService;
    }
//    @GetMapping("/detail")
//    public String getDetail(Model model ,Room room){
//        Room r = roomService.getDetail(room);
//        List<Room> show = this.roomService.getDetail(room);
//        model.addAttribute("detail", show);
//        return "main";
//    }

//  ghousedetail에서 room리스트
//    @GetMapping("/list/{r_ghno}")
//    public String getGhouseRoom(@PathVariable("r_ghno") int r_ghno){
//        Room room = this.roomService.list(r_ghno);
//        return "/room/gHouse_detail";
//    }

    @GetMapping("/getDetail/{r_no}")
    public String getDetail(@PathVariable("r_no") int r_no, Model model){
        Room show = this.roomService.getDetail(r_no);
//        roomService.getDetail(r_no);
        System.out.println(show.toString());
        model.addAttribute("getDetail", show);
        System.out.println("getDetail");
        return "/room/room_detail";
    }
//    @GetMapping("/insert/{R_NAME},{R_PMIN},{R_PMAX},{R_FEE},{R_DETAIL},{R_GHNO}")
//    public String insert(@PathVariable("R_NAME")String R_NAME, @PathVariable("R_PMIN")int R_PMIN, @PathVariable("R_PMIN")int R_PMAX, @PathVariable("R_FEE")int R_FEE, @PathVariable("R_DEATIL")String R_DETAIL, @PathVariable("R_GHNO")int R_GHNO){
//        this.roomService.insert(R_NAME, R_PMIN, R_PMAX, R_FEE, R_DETAIL, R_GHNO);
//        return "main";
//    }
    @PostMapping("/insert")
    public String insert(Room room){
        roomService.insert(room);
        return "main";
    }

//    @RequestMapping(value = "/room_write")
//    public String room_write(MultipartHttpServletRequest mtfRequest, List<GhouseRoomImages> ghouseRoomImages) {
//        List<MultipartFile> fileList = mtfRequest.getFiles("i_name");
//        String src = mtfRequest.getParameter("src");
//        System.out.println("src value : " + src);
//        String path = "C:\\Users\\yeon\\IdeaProjects\\project_zagoga\\src\\main\\resources\\static\\rooms_image\\";
//        String Path = "/resources/rooms_image";
//
//        for (MultipartFile mf : fileList) {
//            String originFileName = mf.getOriginalFilename(); // 원본 파일 명
//            long fileSize = mf.getSize(); // 파일 사이즈
//
//            System.out.println("originFileName : " + originFileName);
//            System.out.println("fileSize : " + fileSize);
//            String filePath = "/" + originFileName;
////            String safeFile = path + System.currentTimeMillis() + originFileName;     // path + time + filename
//            String safeFile = path + filePath;
//            try {
//                mf.transferTo(new File(safeFile));
//            } catch (IllegalStateException e) {
//                e.printStackTrace();
//            } catch (IOException e) {
//                e.printStackTrace();
//            }
//        }
//        System.out.println(fileList.toString());
//        roomService.imagesInsert((GhouseRoomImages) ghouseRoomImages);
//
//        return "main";
//    }
    @GetMapping("/write")
    public String write(){
        return "/room/room_write";
    }

//    @RequestMapping(value = "/room_write")
//    public String room_write(MultipartHttpServletRequest mtfRequest, List<GhouseRoomImages> ghouseRoomImages) {
//        @RequestParam(value = "i_name", required = false) List<MultipartFile> i_name;
//        List<MultipartFile> fileList = mtfRequest.getFiles("i_name");
//        String src = mtfRequest.getParameter("src");
//        System.out.println("src value : " + src);
//        String path = "C:\\Users\\yeon\\IdeaProjects\\project_zagoga\\src\\main\\resources\\static\\rooms_image\\";
//        String Path = "/resources/rooms_image";
//        System.out.println(ghouseRoomImages.toString());
//        System.out.println(fileList.toString());
//
//        for (MultipartFile mf : fileList) {
//            String originFileName = mf.getOriginalFilename(); // 원본 파일 명
//            long fileSize = mf.getSize(); // 파일 사이즈
//
//            System.out.println("originFileName : " + originFileName);
//            System.out.println("fileSize : " + fileSize);
//            String filePath = "/" + originFileName;
////            String safeFile = path + System.currentTimeMillis() + originFileName;     // path + time + filename
//            String safeFile = path + filePath;
//            try {
//                mf.transferTo(new File(safeFile));
//            } catch (IllegalStateException e) {
//                e.printStackTrace();
//            } catch (IOException e) {
//                e.printStackTrace();
//            }
//        }
//        System.out.println(fileList.toString());
//        fileList.add(ghouseRoomImages);
//        return "main";
//    }

//    // 이미지 여러장 해결중
//    @PostMapping("/room_write")
//    public String room_write(GhouseRoomImages ghouseRoomImages, @RequestParam("files") List<MultipartFile> i_name) throws  IOException{
//        String path = "C:\\Users\\yeon\\IdeaProjects\\project_zagoga\\src\\main\\resources\\static\\rooms_image\\";
//        System.out.println(ghouseRoomImages.toString());
//        List<String> file = null;
//        int j = i_name.size();
//        System.out.println(j);
//        for (int i=0; i<=j; i++){
//            String originFileName = i_name.get(i).getOriginalFilename();
////            ghouseRoomImages.setI_name(i, System.currentTimeMillis() + i_name.get(i).getOriginalFilename());
//            file.add(i_name.get(i).getOriginalFilename());
//            Long fileSize = i_name.get(i).getSize();
//            System.out.println("originFileName : " + originFileName);
//            System.out.println("fileSize : " + fileSize);
////            ghouseRoomImages.setI_name(originFileName);
//            String safeFile = path + System.currentTimeMillis() + originFileName;
////            String safeDB = System.currentTimeMillis()+originFileName;
//            String viewPath = "/resources/rooms_image/";
//            try {
//                i_name.get(i).transferTo(new File(safeFile));
//
//            } catch (IllegalStateException e) {
//                e.printStackTrace();
//            } catch (IOException e) {
//                e.printStackTrace();
//            }
//        }
//        ghouseRoomImages.setI_name(file);
//        roomService.imageInsert(ghouseRoomImages);
////        ghouseRoomImages.setI_name();
//        System.out.println(ghouseRoomImages.toString());
//        String Path = "/resources/rooms_image/";
//        return "main";
//    }

    @PostMapping("/room_write")
    public String room_wrtie(@RequestParam("files") List<MultipartFile> files, GhouseRoomImages ghouseRoomImages){
        String path = "C:\\Users\\yeon\\IdeaProjects\\project_zagoga\\src\\main\\resources\\static\\rooms_image\\";
        List<String> safeDB = null;
        try {
            for (int i=0;i<files.size(); i++){


                String originFileName = files.get(i).getOriginalFilename();

                String safeFile = path + System.currentTimeMillis() + originFileName;
                safeDB.add(i, System.currentTimeMillis()+"_"+originFileName);
                String viewPath = "/resources/rooms_image/";
                System.out.println("files : " + files);
                System.out.println("safeDB: " + safeDB);
                files.get(i).transferTo(new File(safeFile));

            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        ghouseRoomImages.setI_name(safeDB);
//        roomService.imageInsert(ghouseRoomImages);
        System.out.println(ghouseRoomImages.toString());
        return "main";
    }




////    @GetMapping("/room_write")
//    @RequestMapping(value = "/room_write")
//    public String room_write(){
//        return "/room/room_write";
//    }

    @PostMapping("/update")
    public String update(Room room){
        roomService.update(room);
        return "main";
    }

    @PostMapping("/delete")
    public String delete(int r_no, int r_ghno){
        roomService.delete(r_no, r_ghno);
        return "main";
    }

    private class MultipartMultipartHttpServletRequest {
    }
}
