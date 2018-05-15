package com.fh.plugin;

import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
*/

public class OSSConfig{
    private  String endpoint;       //连接区域地址
    private  String accessKeyId;    //连接keyId
    private  String accessKeySecret;    //连接秘钥
    private  String bucketName;     //需要存储的bucketName

    public OSSConfig() throws IOException {
        this.endpoint = "http://oss-cn-beijing.aliyuncs.com";
		this.bucketName = "thbszz";
		this.accessKeyId = "LTAIDv31U5ON6fOv";
		this.accessKeySecret = "43kgHXHNWE0QgeRSeMRKMjA1uuKRnH";
    }

    public String getEndpoint() {
        return endpoint;
    }
    public void setEndpoint(String endpoint) {
        this.endpoint = endpoint;
    }
    public String getAccessKeyId() {
        return accessKeyId;
    }
    public void setAccessKeyId(String accessKeyId) {
        this.accessKeyId = accessKeyId;
    }
    public String getAccessKeySecret() {
        return accessKeySecret;
    }
    public void setAccessKeySecret(String accessKeySecret) {
        this.accessKeySecret = accessKeySecret;
    }
    public String getBucketName() {
        return bucketName;
    }
    public void setBucketName(String bucketName) {
        this.bucketName = bucketName;
    }
}