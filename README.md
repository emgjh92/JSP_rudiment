# JSP_rudiment
JSP_rudiment

server : Tomcat 8 



=================MEMO=================

2020-04-01 (소스 배포 과정 실습)
Server : 라즈베리파이 (Ubuntu 기반)

Eclispe 에서 Export => WAR파일로 저장 => FileZilla 통해서 SFTP 통신으로 war  파일 옮긴 후 리눅스에서 밑의 작업 

```lua
ja05@lea-pi:/home/ja06/CJH $ cp choijaehyun.war /var/lib/tomcat8/webapps
ja05@lea-pi:/var/lib/tomcat8/webapps $ cd
ja05@lea-pi:~ $ cd /var/lib/tomcat8/webapps/
ja05@lea-pi:/var/lib/tomcat8/webapps $ ls
2_3      choijaehyun      FreeBoardJSP.war  LCY                   LGR                   LMK      ODK      SWJ.war
2_3.war  choijaehyun.war  free.war          LCY.war               LGR.war               LMK.war  ODK.war  test01
BSH      free             JSJ               LDJFreeBoardJSPP      LJO_FreeBoardJSP      LYH      ROOT     tt
BSH.war  FreeBoardJSP     JSJ.war           LDJFreeBoardJSPP.war  LJO_FreeBoardJSP.war  LYH.war  SWJ      tt.war
ja05@lea-pi:/var/lib/tomcat8/webapps $
```

(war 파일은 옮기면 자동으로 압축이 해재된다)

===========================================================


=================MEMO=================

2020-04-06
Book & Source Code : 
https://github.com/madvirus/jsp23

===========================================================

=================MEMO==================

서버 마지막 설정
2020-04-23

프로젝트의 web.xml 에서
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://xmlns.jcp.org/xml/ns/javaee" xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_3_1.xsd" id="WebApp_ID" version="3.1">
  <display-name>JSPMVC_0420</display-name>
  <welcome-file-list>
    <welcome-file>main_page.do</welcome-file>
  </welcome-file-list>
  
  웰컴 페이지 설정
  
  
  
156        <Context docBase="JSPMVC_0420" path="/" reloadable="true" source="org.eclipse.jst.jee.server:JSPMVC_0420"/></Host>
==> path를 위와 같이 수정해 준다.
  서버의 server.xml 설정
  
  
  서버 설정에서 HTTP 1.1 의 Portnumber를 80으로 설정
  
  ===========================================================

