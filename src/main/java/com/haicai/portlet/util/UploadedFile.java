package com.haicai.portlet.util;

import java.io.Serializable;

/**
 * @author jason.xinli.xiang
 *
 */
public class UploadedFile implements Serializable{

	private static final long serialVersionUID = -6070874202962046084L;

	public int length;
	
	public byte[] bytes;
	
	public String name;
	
	public String type;

	public int getLength() {
		return length;
	}

	public void setLength(int length) {
		this.length = length;
	}

	public byte[] getBytes() {
		return bytes;
	}

	public void setBytes(byte[] bytes) {
		this.bytes = bytes;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
}
