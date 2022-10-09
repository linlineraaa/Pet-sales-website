<%@ page contentType="image/jpeg"
	import="java.awt.*,
java.awt.image.*,java.util.*,javax.imageio.*" pageEncoding="utf-8"%>

<%!//这是一个生成验证码的页面
Color getRandColor(int fc,int bc)
{
Random random = new Random();//生产随机数的对象
if(fc>255) fc=255;
if(bc>255) bc=255;
int r=fc+random.nextInt(bc-fc);//随机数的范围是bc到fc+fc
int g=fc+random.nextInt(bc-fc);
int b=fc+random.nextInt(bc-fc);
return new Color(r,g,b);
}
%>
<%
out.clear();//这句针对resin服务器，如果是tomacat可以不要这句
response.setHeader("Pragma","No-cache");//没有缓存
response.setHeader("Cache-Control","no-cache");//没有缓存
response.setDateHeader("Expires", 0);//在代理服务器端防止缓冲
int width=60, height=20;
BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
Graphics g = image.getGraphics();
Random random = new Random();
g.setColor(getRandColor(200,250));
g.fillRect(0, 0, width, height);//填充矩形：起始X坐标，起始Y坐标，宽度，高度。
g.setFont(new Font("Times New Roman",Font.PLAIN,18));
g.setColor(getRandColor(160,200));//分别代表字体样式    字体格式  和  字体大小。
for (int i=0;i<155;i++)
{
int x = random.nextInt(width);
int y = random.nextInt(height);
int xl = random.nextInt(12);
int yl = random.nextInt(12);
g.drawLine(x,y,x+xl,y+yl);
}
String sRand="";
for (int i=0;i<4;i++){
String rand=String.valueOf(random.nextInt(10));
sRand+=rand;
g.setColor(new Color(20+random.nextInt(110),20+random.nextInt(110),20+random.nextInt(110)));
g.drawString(rand,13*i+6,16);
}
// 将认证码存入SESSION
session.setAttribute("sRand",sRand);
g.dispose();
ImageIO.write(image, "JPEG", response.getOutputStream());
%>