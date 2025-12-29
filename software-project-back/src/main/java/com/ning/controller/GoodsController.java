package com.ning.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.ning.entity.CurrentUser;
import com.ning.entity.Goods;
import com.ning.entity.User;
import com.ning.service.CurrentUserService;
import com.ning.service.GoodsService;
import com.ning.utils.Message;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.apache.logging.log4j.spi.ObjectThreadContextMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;


import javax.management.ObjectName;
import java.io.File;
import java.util.List;
import java.util.Map;

/**
 * ClassName: GoodsController <br/>
 *
 * @author Ning <br/>
 * @date 2023/6/6 0006
 * @since JDK 11
 */
@RestController
@RequestMapping(value = "/goods",produces = "application/json")
@Api(value = "商品管理",tags = "商品管理接口")
public class GoodsController {

    private final GoodsService goodsService;

    private final CurrentUserService currentUserService;

    public GoodsController(GoodsService goodsService, CurrentUserService currentUserService) {
        this.goodsService = goodsService;
        this.currentUserService = currentUserService;
    }


    @ApiOperation(value = "查询所有商品",notes = "查询所有商品信息")
    @GetMapping("/all")
    @CrossOrigin
    public Map<String,Object> queryAll()
    {
        try{
            List<Goods> goods = goodsService.queryGoods();
            return Message.queryMessage(goods,goods.size());
        }catch (Exception e){
            e.printStackTrace();
            return Message.getMessage("服务器处理异常");
        }
    }

    @ApiOperation(value = "商品查询",notes = "依据prompt对商品进行商品名的模糊查询")
    @GetMapping("/search/{prompt}")
    @ApiImplicitParam(name = "prompt",value = "依据商品名进行模糊搜索的关键字")
    @CrossOrigin
    public Map<String,Object> queryAll(
            @PathVariable String prompt)
    {
        try{
            List<Goods> search = goodsService.search(prompt);
            return Message.queryMessage(search,search.size());
        }catch (Exception e){
            e.printStackTrace();
            return Message.getMessage("服务器处理异常");
        }
    }

    @ApiOperation(value = "搜索商品",notes = "带分页进行商品模糊搜索")
    @CrossOrigin
    @ApiImplicitParams({
            @ApiImplicitParam(name = "goods",value = "依据goods里的属性进行商品的模糊查询",dataType = "Goods(Object)"),
            @ApiImplicitParam(name = "page",value = "分页查询中要查看第几页",defaultValue = "1"),
            @ApiImplicitParam(name = "limit",value = "分页查询中每页显示的数量",defaultValue = "10" )
    })
    @GetMapping("/search")
    public Map<String,Object> queryAll(
            @ModelAttribute Goods goods,
            @RequestParam(value = "page",defaultValue = "1") int page,
            @RequestParam(value = "limit",defaultValue = "10") int limit)
    {
        try{
            IPage<Goods> search = goodsService.search(goods, page, limit);
            return Message.queryMessage(search);
        }catch (Exception e){
            e.printStackTrace();
            return Message.getMessage("服务器处理异常");
        }
    }

    @CrossOrigin
    @ApiOperation(value = "修改商品（支持图片修改）", notes = "修改商品信息，可选上传新图片")
    @PostMapping("/update")
    public Map<String, Object> updateGoods(
            @RequestParam("token") String token,
            @RequestParam(value = "gImageFile", required = false) MultipartFile gImageFile,
            @ModelAttribute Goods goods
    ) {
        try {
            // 1️⃣ 校验身份
            if (!currentUserService.verityToken(token)) {
                return Message.getMessage("身份校验失败");
            }

            // 2️⃣ 如果有新图片 → 保存图片
            if (gImageFile != null && !gImageFile.isEmpty()) {

                String originalFilename = gImageFile.getOriginalFilename();
                String suffix = originalFilename != null && originalFilename.contains(".")
                        ? originalFilename.substring(originalFilename.lastIndexOf("."))
                        : "";

                String fileName = System.currentTimeMillis() + "_" + (int)(Math.random() * 10000) + suffix;

                String uploadDir = System.getProperty("user.dir") + "/upload/";
                File dir = new File(uploadDir);
                if (!dir.exists()) {
                    dir.mkdirs();
                }

                File dest = new File(uploadDir + fileName);
                gImageFile.transferTo(dest);

                // ⚠️ 关键：设置新图片路径
                goods.setGImage("/upload/" + fileName);
            }

            // 3️⃣ 执行更新
            int rows = goodsService.update(goods);
            if (rows > 0) {
                return Message.getMessage("修改成功");
            } else {
                return Message.getMessage("修改失败");
            }

        } catch (Exception e) {
            e.printStackTrace();
            return Message.getMessage("服务器处理异常");
        }
    }


    @ApiOperation(value = "添加商品（支持图片上传）", notes = "用户发布二手书，支持上传商品图片")
    @PostMapping("/add")
    @CrossOrigin
    public Map<String, Object> addGoods(
            @RequestParam String token,
            @RequestParam String gName,
            @RequestParam Integer gCount,
            @RequestParam String gContent,
            @RequestParam Double gPrice,
            @RequestParam Integer gLevel,
            @RequestParam String gContact,
            @RequestParam String college,
            @RequestParam String subject,
            @RequestParam String type,
            @RequestParam String campus,

            @RequestParam(value = "gImageFile", required = false) MultipartFile gImageFile) {

        try {
            // 1. 验证 token 是否有效
            if (!currentUserService.verityToken(token)) {
                return Message.getMessage("身份校验失败");
            }

            // 2. 获取当前登录用户
            User currentUser = currentUserService.getUserByToken(token);
            if (currentUser == null) {
                return Message.getMessage("无法获取用户信息");
            }
            Integer uId = currentUser.getUId();  // 直接拿到用户ID

            // 3. 处理图片上传（如果有）
            String imageUrl = null;
            if (gImageFile != null && !gImageFile.isEmpty()) {
                // 生成唯一文件名
                String originalFilename = gImageFile.getOriginalFilename();
                String fileExtension = originalFilename != null && originalFilename.contains(".")
                        ? originalFilename.substring(originalFilename.lastIndexOf("."))
                        : "";
                String fileName = System.currentTimeMillis() + "_" + (int)(Math.random() * 10000) + fileExtension;

                // 保存路径：项目根目录下的 upload 文件夹
                String uploadDir = System.getProperty("user.dir") + "/upload/";
                System.out.println("【调试】准备保存图片到目录: " + uploadDir);
                java.io.File dir = new java.io.File(uploadDir);
                if (!dir.exists()) {
                    dir.mkdirs();
                    System.out.println("【调试】upload 文件夹不存在，已自动创建: " + uploadDir);
                }

                java.io.File destFile = new java.io.File(uploadDir + fileName);
                try {
                    gImageFile.transferTo(destFile);
                    System.out.println("【调试】图片上传成功！实际保存路径: " + destFile.getAbsolutePath());  // <--- 加在这行（最重要！）
                } catch (Exception e) {
                    System.out.println("【调试】图片保存失败！错误: " + e.getMessage());
                    e.printStackTrace();
                }

                // 前端访问的 URL 路径
                imageUrl = "/upload/" + fileName;
            }

            // 4. 构造商品对象
            Goods goods = new Goods();
            goods.setGName(gName);
            goods.setGCount(gCount);
            goods.setGContent(gContent);
            goods.setGPrice(gPrice);
            goods.setGLevel(gLevel);
            goods.setUId(uId);
            goods.setGContact(gContact);
            goods.setCollege(college);
            goods.setSubject(subject);
            goods.setType(type);
            goods.setCampus(campus);

            goods.setGImage(imageUrl != null ? imageUrl : "/upload/default-book.jpg"); // 可选：给个默认图片

            // 5. 保存到数据库
            int result = goodsService.addGoods(goods);
            if (result > 0) {
                return Message.getMessage("商品发布成功");
            } else {
                return Message.getMessage("商品发布失败");
            }

        } catch (Exception e) {
            e.printStackTrace();
            return Message.getMessage("服务器处理异常：" + e.getMessage());
        }
    }

    @ApiOperation(value = "删除商品",notes = "删除一条商品记录")
    @PostMapping("/delete")
    @CrossOrigin
    public Map<String, Object> deleteGoods(
            @RequestParam(value = "token",defaultValue = "null") String token,
            @ModelAttribute Goods goods)
    {
        try {
            if(currentUserService.verityToken(token)){
                if(goodsService.delete(goods) > 0){
                    return Message.getMessage("删除成功");
                }else{
                    return Message.getMessage("删除失败");
                }
            }else{
                return Message.getMessage("身份校验失败");
            }
        }catch (Exception e){
            e.printStackTrace();
            return Message.getMessage("服务器处理异常");
        }
    }

    @PostMapping("/deleteById")
    @CrossOrigin
    public Map<String,Object> deleteGoods(
            @RequestParam(defaultValue = "null") String token,
            @RequestParam(value = "listId") List<Integer> ids
    ){
        try{
            if(currentUserService.verityToken(token)){
                int delete = goodsService.delete(ids);
                return Message.getMessage("成功删除"+delete+"条商品");
            }else{
                return Message.getMessage("身份校验失败");
            }
        }catch (Exception e){
            e.printStackTrace();
            return Message.getMessage("服务器处理异常");
        }
    }

}
