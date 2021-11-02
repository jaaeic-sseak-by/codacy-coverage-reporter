FROM openjdk:8
COPY target/pulse-analytics-middleware-0.0.1.jar /app.jar
RUN mkdir /home/middleware
COPY ./src/main/resources/credentials/* /home/middleware/credentials/
COPY ./src/main/resources/request/es/* /home/middleware/request/es/
COPY ./src/main/resources/request/* /home/middleware/request/
COPY ./src/main/resources/response/* /home/middleware/response/
COPY ./src/main/resources/ui/* /home/middleware/ui/
COPY ./src/main/resources/config/* /home/middleware/config/
RUN chmod +x /home/middleware/credentials/
RUN chmod +x /home/middleware/request/
RUN chmod +x /home/middleware/response/
RUN chmod +x /home/middleware/ui/
RUN chmod +x /home/middleware/config/
EXPOSE 8080/tcp
ENTRYPOINT ["java", "-jar", "/app.jar"] 