package com.java.config;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {
	
//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id = "2016092600600430";	
	
	// 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCLuePCSEC7L0II693S2OOQoHcmnjbZxh7vBjo46Fq44ztxdPSxT/RyWyETDHL4Fg9l20FHZQDdOlliB2zIh2nqqBFhdwgGYDx2VNxagVG079Y4iz9lUD60SKRv/TBe9ty21h2Y5UwemQIYieO1UALfbPWv1kcJ556rHpxBAsdczREqQbhA8CGzFunm0Jet0v7XcpO2wcJdMPTLCTe+un/JdH8jfADfLKc7nSkfUFc6+dvnqo+XLIDayHdfgwqTsW2IgefhkFCVO2+PTCSW/3qIjxXgh1g7i48NRmD0pU2TdUT6RLamqg+jQviKqZNG3OgE+XUjBetfW3s7KXY1V/YBAgMBAAECggEAXZDXccxMfIyC3dKEsqLGkJzD7TpZZK+FG27CIkWGKvUPY0R8bxgpi0J2/XiCrJqpKP4P0q1STNK79Ccgs4/qX1a4fNnmp85d7qeY/4pFmrJYc3jbtQ5tTvCuHMghUhZhapYrL62ssXiorKH5t/qiUdd3Fo6Y94sA93oCDI69zegOY8XhaCcfKAXhikUarnC8XIjwuqjkXUW+Ik5b9vCcVW82goIjOo//DjoHkpKY1qk1wYTxBf/GlGuadqYKx5mkZ38+MsDaLfbEReImhH+lp3H3HsDDCrqWgcd6gHM8O8KQdpBqM2pgpVE94z+5+V846Dsv/xRDjsLr5MB4rlUggQKBgQDOjhy1ImSF64/H1KXZTd0HVeyIcF0T5ioFJPEP+0ukAVhxvXEUQx2oeLs3giF16RYxCspva3pSq6EOVX1rrMJEY8zRlsKxn9UAYfaVyRphlzXkO5+bhLMImf7PVo+FvdmhP1Y1YsvIRUc+l9WctilTU0SqaadDKAxjKumQhlIXCQKBgQCtLG92I9m+YzNnjmmTCT8WnQOgpQjt8SEGranAt2y9S+7bNecND92c2psp7NR3rugiIEfujBSqmHeZ7q8mugPwWv57vrFn2j8X2U8XmlnYF+6aynvncLVa2aFyVAD2oozhSciwZi0lAsNMuRqb39oyFGSzDRB5vfZCwOEw7bJtOQKBgQC9lhDhbLzpcqoY16SWTPJ3vjUJkmDMV/DvodWlPplR4m5Ej4YP+/5n2NC2BTojGJrmzqm6FONEqAV+u5cP0pTI4vVm1kLDeBmwbTpAh0IwmvK7FsLLosQVPAt2UVQQhI4Rg6nj/Fdg7b2TxRcq7MQHmCEpbSo56LNd/lA8+By2yQKBgF/Or7PqzbLZaz0lux8QBIlcQP+FjtUljKIHPl1SnaR0+CbrQXMmjfMTtriRQFMev2rx9RnzAhQH2lOdi+WfEELP9O89ZyUPx8xH+8wRJxe41ddpovc+kfc7ZGi+NPI+qDaT/aYqQVuylZ5C4ofOZwdB5RxyY+UWxcHUuEG7n/VxAoGBAMvWhHWwZMbMPXlpkkecaH8i0R+mPFbIOakolCeDevg3qnYfoIhFVNxTqBVMejYFIO54h2l0i5v35OxcTC5G8d/sEFm78zCJN0JLNkAZ1UZClCjvCqh+yueLH8b5MF+EYU5xFYD0HxDIoTErLjvaNk3hTH9OaB2SX87gDFriCTpR";
	
	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAp/QXmkJ3dwXY/iYeJslr28z10/OSBesCuMcDNaa+fgIgUS2Uo+Jk2D+itLYO6LSbwulL785aTpQJRGJEeizr34AA1QmyPbtp8/FQkiArM/TnFeaNyqSHY1yWSP35ORydvhQseUOSZH16W1EfbVDmbBhkRsrGbFsgseouHr5r+MKkAodMXbHQnlDg1bWVSzZQkZRduGKXIPaTIM7qiQCXbcN6dbq4gkZi3NwSI88Hu9XxOPJtQ0vLp6tOaaRgvGeCx12tk6apwUU6QigzJ17nJLJCzBtIEMDezAFk24b2CgikBQakHjX2gUPynpIUpaUgF3aLIyaPZ81N02pyK1YA+QIDAQAB";

	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "http://localhost:8080/money.jsp";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String return_url = "http://localhost:8080/chy_jsp/index.jsp";
	// 签名方式
	public static String sign_type = "RSA2";
	
	// 字符编码格式
	public static String charset = "utf-8";
	
	// 支付宝网关
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
	
	// 支付宝网关
	public static String log_path = "C:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /** 
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

