# JSP_rudiment
JSP_rudiment

server : Tomcat 8 



=================MEMO=================
2020-04-01 (소스 배포 과정 실습)
Server : 라즈베리파이 (Ubuntu 기반)

Eclispe 에서 Export => WAR파일로 저장 => FileZilla 통해서 SFTP 통신으로 war  파일 옮긴 후 리눅스에서 밑의 작업 


ja05@lea-pi:/home/ja06/CJH $ cp choijaehyun.war /var/lib/tomcat8/webapps
ja05@lea-pi:/var/lib/tomcat8/webapps $ cd
ja05@lea-pi:~ $ cd /var/lib/tomcat8/webapps/
ja05@lea-pi:/var/lib/tomcat8/webapps $ ls
2_3      choijaehyun      FreeBoardJSP.war  LCY                   LGR                   LMK      ODK      SWJ.war
2_3.war  choijaehyun.war  free.war          LCY.war               LGR.war               LMK.war  ODK.war  test01
BSH      free             JSJ               LDJFreeBoardJSPP      LJO_FreeBoardJSP      LYH      ROOT     tt
BSH.war  FreeBoardJSP     JSJ.war           LDJFreeBoardJSPP.war  LJO_FreeBoardJSP.war  LYH.war  SWJ      tt.war
ja05@lea-pi:/var/lib/tomcat8/webapps $


(war 파일은 옮기면 자동으로 압축이 해재된다)


