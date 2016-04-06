FROM enzor/alfresco-standalone

WORKDIR $ALF_HOME
RUN mkdir tomcat/webapps/alfresco
RUN unzip tomcat/webapps/alfresco.war -d tomcat/webapps/alfresco

COPY assets/cors-web.xml $ALF_HOME
RUN sed '/<\/web-app>/d' tomcat/webapps/alfresco/WEB-INF/web.xml > modified-web.xml
RUN cat cors-web.xml >> modified-web.xml
RUN echo '</web-app>' >> modified-web.xml

RUN cat modified-web.xml

RUN mv tomcat/webapps/alfresco/WEB-INF/web.xml tomcat/webapps/alfresco/WEB-INF/web.xml.old
RUN mv modified-web.xml tomcat/webapps/alfresco/WEB-INF/web.xml