package com.nilaoda.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@ResponseBody
public class FileUploadController
{
	// 文件上传
	@RequestMapping(value = "/fileUpload.action", produces = "text/plain;charset=utf-8")
	public String handleUpload(@RequestParam("myfile") List<MultipartFile> uploadfile, HttpServletRequest request)
	{
		if (!uploadfile.isEmpty() && uploadfile.size() > 0)
		{
			for (MultipartFile file : uploadfile)
			{
				// 获取原始名称
				String originalFilename = file.getOriginalFilename();
				// 设置保存地址
				String dirPath = request.getServletContext().getRealPath("/upload/");
				File filePath = new File(dirPath);
				// 如果不存在则新建文件夹
				if (!filePath.exists())
				{
					filePath.mkdirs();
				}
				// 使用UUID命名文件名
				String newFilename = UUID.randomUUID() + "_" + originalFilename;
				try
				{
					// 使用MultipartFile接口的方法完成文件上传
					file.transferTo(new File(dirPath + newFilename));
				}
				catch (Exception e)
				{
					// 上传失败
					return "{\"status\":\"NOT OK\"}";
				}

				return "{\"status\":\"OK\",\"img\":\"" + newFilename + "\"}";
			}
		}
		// 上传失败
		return "{\"status\":\"NOT OK\"}";
	}
}
