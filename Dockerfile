###################################################
# Alpine Linux with OpenJDK JRE Spring boot
###################################################
FROM azul/zulu-openjdk-alpine:11-jre

# curl (헬스체크용) tzdata (시간대 맞추기용) 설치
RUN apk add --update curl tzdata bash

# 시간대 맞춰주기
RUN cp /usr/share/zoneinfo/Asia/Seoul /etc/localtime
RUN echo "Asia/Seoul" > /etc/timezone

# 빌드 스테이지에서 있던 jar 파일을 복사 한다.
COPY ./build/libs/*.jar /app.jar

# 헬스 체크 설정
HEALTHCHECK \
 --interval=10s \
 --timeout=10s \
 --start-period=5s \
 --retries=10 \
 CMD curl --fail --silent --url http://localhost:8080/health | grep true || exit 1

# 노출 포트 설정
EXPOSE 8080

ENTRYPOINT ["java","-jar","/app.jar"]

