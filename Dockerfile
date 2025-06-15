# Используем официальный образ Maven для сборки
FROM maven:3.9.7-eclipse-temurin-17 AS build
WORKDIR /app

# Копируем исходный код
COPY . .

# Собираем проект с помощью Maven
RUN ./mvnw package -DskipTests

# Используем минимальный JDK-образ для запуска
FROM eclipse-temurin:17
WORKDIR /app

# Копируем скомпилированный jar из предыдущего слоя
COPY --from=build /app/target/*.jar app.jar

# Запускаем приложение
ENTRYPOINT ["java", "-jar", "app.jar"]
