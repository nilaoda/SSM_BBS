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
	// �ļ��ϴ�
	@RequestMapping(value = "/fileUpload.action", produces = "text/plain;charset=utf-8")
	public String handleUpload(@RequestParam("myfile") List<MultipartFile> uploadfile, HttpServletRequest request)
	{
		if (!uploadfile.isEmpty() && uploadfile.size() > 0)
		{
			for (MultipartFile file : uploadfile)
			{
				// ��ȡԭʼ����
				String originalFilename = file.getOriginalFilename();
				// ���ñ����ַ
				String dirPath = request.getServletContext().getRealPath("/upload/");
				File filePath = new File(dirPath);
				// ������������½��ļ���
				if (!filePath.exists())
				{
					filePath.mkdirs();
				}
				// ʹ��UUID�����ļ���
				String newFilename = UUID.randomUUID() + "_" + originalFilename;
				try
				{
					// ʹ��MultipartFile�ӿڵķ�������ļ��ϴ�
					file.transferTo(new File(dirPath + newFilename));
				}
				catch (Exception e)
				{
					// �ϴ�ʧ��
					return "{\"status\":\"NOT OK\"}";
				}

				return "{\"status\":\"OK\",\"img\":\"" + newFilename + "\"}";
			}
		}
		// �ϴ�ʧ��
		return "{\"status\":\"NOT OK\"}";
	}
}
