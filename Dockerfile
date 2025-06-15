# Используем официальный образ Java 17
FROM eclipse-temurin:17

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем всё из текущего репозитория в контейнер
COPY . .

# Собираем .jar-файл через Maven Wrapper
RUN ./mvnw package -DskipTests

# Запускаем приложение
CMD ["java", "-jar", "target/petclinic-*.jar"]
