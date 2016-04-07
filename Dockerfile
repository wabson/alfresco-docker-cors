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
