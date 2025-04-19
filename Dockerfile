# ---------- Build Stage ----------
FROM maven:latest AS build

WORKDIR /app

COPY . .

RUN mvn clean package -DskipTests

# ---------- Run Stage ----------
FROM openjdk:17

WORKDIR /app

COPY --from=build /app/target/*.jar app.jar

CMD ["java", "-jar", "app.jar"]
