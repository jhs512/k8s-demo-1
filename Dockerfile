FROM gradle:jdk21 as builder

WORKDIR /app

COPY gradlew .
COPY gradle gradle
COPY build.gradle .
COPY settings.gradle .

RUN ./gradlew dependencies --no-daemon || ture

COPY src src

RUN ./gradlew build -x test --no-daemon

FROM openjdk:21-slim

WORKDIR /app

COPY --from=builder /app/build/libs/*.jar app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]


