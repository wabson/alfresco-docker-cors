FROM enzor/alfresco-standalone

WORKDIR $ALF_HOME
RUN mkdir tomcat/webapps/alfresco
RUN mkdir tomcat/webapps/share
RUN unzip tomcat/webapps/alfresco.war -d tomcat/webapps/alfresco
RUN unzip tomcat/webapps/share.war -d tomcat/webapps/share

COPY assets/cors-web.xml $ALF_HOME
COPY assets/splicewebxml.sh $ALF_HOME

RUN chmod +x ./splicewebxml.sh
RUN ./splicewebxml.sh cors-web.xml tomcat/webapps/alfresco
RUN ./splicewebxml.sh cors-web.xml tomcat/webapps/share

RUN rm $ALF_HOME/tomcat/webapps/alfresco/WEB-INF/lib/cors-filter-*.jar
COPY assets/cors-filter-2.5.jar $ALF_HOME/tomcat/webapps/alfresco/WEB-INF/lib
COPY assets/cors-filter-2.5.jar $ALF_HOME/tomcat/webapps/share/WEB-INF/lib
