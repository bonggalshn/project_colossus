# Quickstart Guide: Hello World REST API

**Version**: 1.0.0
**Last Updated**: 2026-04-26

## Prerequisites

### Software Requirements
- Java 25 JDK
- Maven 3.9+
- Git
- Your favorite IDE (IntelliJ IDEA, Eclipse, VS Code)

### Hardware Requirements
- Minimum 2GB RAM
- 500MB free disk space
- Internet connection for dependency download

## Setup Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/your-org/colossus-engine.git
cd colossus-engine
git checkout 002-hello-world-api
```

### 2. Build the Project

```bash
mvn clean install
```

This will:
- Download all dependencies
- Compile the source code
- Run unit tests
- Package the application

### 3. Run the Application

```bash
mvn spring-boot:run
```

The application will start on port 8080 by default.

## Testing the API

### 1. Basic Hello World

**Request**:
```bash
curl -X GET http://localhost:8080/api/hello
```

**Expected Response**:
```json
{
  "message": "Hello World",
  "status": "success",
  "timestamp": "2026-04-26T14:00:00.000Z",
  "version": "1.0.0"
}
```

### 2. Personalized Greeting

**Request**:
```bash
curl -X GET "http://localhost:8080/api/hello?name=John"
```

**Expected Response**:
```json
{
  "message": "Hello John",
  "status": "success",
  "timestamp": "2026-04-26T14:00:00.000Z",
  "version": "1.0.0"
}
```

### 3. Health Check

**Request**:
```bash
curl -X GET http://localhost:8080/api/health
```

**Expected Response**:
```json
{
  "message": "API is healthy",
  "status": "healthy",
  "serviceStatus": "healthy",
  "version": "1.0.0",
  "timestamp": "2026-04-26T14:00:00.000Z",
  "dependencies": {
    "database": "not_applicable",
    "externalServices": "not_applicable"
  },
  "uptime": "PT0H0M5S"
}
```

## Common Issues and Solutions

### Issue: Port 8080 already in use

**Solution**: Change the server port in `application.properties`:
```properties
server.port=8081
```

### Issue: Java version mismatch

**Solution**: Ensure you have Java 25 installed:
```bash
java -version
# Should show: openjdk version "25"
```

### Issue: Dependency download failures

**Solution**: Try cleaning Maven cache and retrying:
```bash
mvn dependency:purge-local-repository
mvn clean install
```

## Development Workflow

### Running Tests

```bash
# Run all tests
mvn test

# Run specific test class
mvn test -Dtest=HelloWorldControllerTest

# Run tests with coverage
mvn jacoco:prepare-agent test jacoco:report
```

### Code Formatting

Use the provided code formatting configuration in your IDE:
- IntelliJ: Import `code-style.xml` from project root
- Eclipse: Import formatter settings

### Generating Documentation

```bash
# Generate OpenAPI documentation
mvn springdoc:generate

# Access Swagger UI
http://localhost:8080/swagger-ui.html
```

## Deployment

### Local Deployment

```bash
mvn package
java -jar target/hello-world-api-1.0.0.jar
```

### Docker Deployment (Future)

```bash
# Build Docker image
docker build -t hello-world-api:1.0.0 .

# Run container
docker run -p 8080:8080 hello-world-api:1.0.0
```

## API Documentation

### Swagger UI
Access the interactive API documentation at:
http://localhost:8080/swagger-ui.html

### OpenAPI Specification
Access the raw OpenAPI specification at:
http://localhost:8080/v3/api-docs

## Project Structure

```
backend/
├── src/
│   ├── main/
│   │   ├── java/com/colossus/helloworld/
│   │   │   ├── controller/          # REST controllers
│   │   │   ├── facade/             # Facade layer
│   │   │   ├── bizservice/         # Business service layer
│   │   │   ├── coreservice/        # Core service layer
│   │   │   ├── commonutil/         # Utility classes
│   │   │   └── commonlang/        # Common classes
│   │   └── resources/             # Configuration
│   └── test/                      # Test classes
└── pom.xml                         # Maven configuration
```

## Extending the API

### Adding New Endpoints

1. Create a new controller method in the appropriate controller
2. Implement the service layers (facade → biz-service → core-service)
3. Add test cases
4. Update OpenAPI documentation

### Adding Database Support

1. Add JPA dependencies to pom.xml
2. Create entity classes
3. Implement repository interfaces
4. Add database configuration to application.properties
5. Implement service methods for database operations

## Monitoring and Logging

### Accessing Logs

```bash
# View application logs
tail -f logs/application.log

# Change log level
echo "logging.level.com.colossus=DEBUG" >> application.properties
```

### Health Monitoring

```bash
# Health endpoint
curl http://localhost:8080/actuator/health

# Metrics endpoint
curl http://localhost:8080/actuator/metrics
```

## Support

For issues and questions:
- Check the project documentation
- Review the specification and contracts
- Consult the constitution for architectural decisions
- Open an issue in the GitHub repository

## Next Steps

1. ✅ Complete specification
2. ✅ Complete implementation plan
3. ⏳ Implement the API (next phase)
4. ⏳ Write comprehensive tests
5. ⏳ Deploy to development environment
6. ⏳ Gather feedback and iterate