FROM enzor/alfresco-standalone

COPY assets/alfresco.war $ALF_HOME/tomcat/webapps

WORKDIR $ALF_HOME
RUN mkdir tomcat/webapps/alfresco
RUN unzip tomcat/webapps/alfresco.war -d tomcat/webapps/alfresco
RUN rm tomcat/webapps/share.war

COPY assets/cors-web.xml $ALF_HOME
COPY assets/splicewebxml.sh $ALF_HOME

RUN chmod +x ./splicewebxml.sh
RUN ./splicewebxml.sh cors-web.xml tomcat/webapps/alfresco

RUN rm $ALF_HOME/tomcat/webapps/alfresco/WEB-INF/lib/cors-filter-*.jar
COPY assets/cors-filter-2.5.jar $ALF_HOME/tomcat/webapps/alfresco/WEB-INF/lib/

RUN mkdir -p $ALF_HOME/tomcat/webapps/alfresco/WEB-INF/classes/alfresco/bootstrap/team-sample-sites/swsdp
RUN mkdir -p $ALF_HOME/tomcat/webapps/alfresco/WEB-INF/classes/alfresco/extension
COPY assets/swsdp/*.acp assets/swsdp/*.txt $ALF_HOME/tomcat/webapps/alfresco/WEB-INF/classes/alfresco/bootstrap/team-sample-sites/swsdp/
COPY assets/swsdp/swsdp-site-context.xml $ALF_HOME/tomcat/webapps/alfresco/WEB-INF/classes/alfresco/extension/
COPY assets/datalist-model/* $ALF_HOME/tomcat/webapps/alfresco/WEB-INF/classes/alfresco/extension/
