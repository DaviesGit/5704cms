package com.f5704.util;

public class JsonResponse {
	public int status;
	public Object data;
	public String error;
	public JsonResponse(int status,Object data,String error) {
		this.status=status;
		this.data=data;
		this.error=error;
	}
	public static JsonResponse error(int status,String error) {
		return new JsonResponse(status,null,error);
	}
	public static JsonResponse error(String error) {
		return new JsonResponse(1,null,error);
	}
	public static JsonResponse success(int status,Object data) {
		return new JsonResponse(status,data,null);
	}
	public static JsonResponse success(Object data) {
		return new JsonResponse(0,data,null);
	}
}
