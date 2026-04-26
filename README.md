# Colossus Engine

Hello World REST API implementation.

## Prerequisites

- Java 25
- Maven 3.9+

## Build

```bash
cd colossus
mvn clean install
```

## Run

```bash
mvn spring-boot:run
```

Or use the batch script:
```bash
colossus-start.bat
```

## API Endpoints

| Endpoint | Description |
|----------|-------------|
| `GET /api/hello` | Returns "Hello World" |
| `GET /api/hello?name=Name` | Returns personalized greeting |
| `GET /api/health` | Returns health status |

## Swagger UI

Access at: http://localhost:8080/swagger-ui.html

## Testing

```bash
mvn test
```

## Stop

```bash
colossus-stop.bat
```