# Quick Start: Budget Account Management

## Prerequisites

- Java 25
- PostgreSQL 15+
- Maven 3.9+

## Database Setup

1. Create the single PostgreSQL database (as per constitution):
   ```sql
   CREATE DATABASE colossus_database;
   ```

2. Update `application.properties` with your database credentials:
   ```properties
   spring.datasource.url=jdbc:postgresql://localhost:5432/colossus_database
   spring.datasource.username=your_username
   spring.datasource.password=your_password
   ```

## Build & Run

1. Navigate to the colossus submodule:
   ```bash
   cd colossus
   ```

2. Build the project:
   ```bash
   mvn clean install
   ```

3. Run the application:
   ```bash
   mvn spring-boot:run
   ```

4. Access the application at: `http://localhost:8080`

## API Endpoints

### Authentication

| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | /api/v1/auth/register | Register new user |
| POST | /api/v1/auth/login | Login user |

### Budget Accounts

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | /api/v1/accounts | List user's accounts |
| POST | /api/v1/accounts | Create new account |
| GET | /api/v1/accounts/{id} | Get account details |
| PUT | /api/v1/accounts/{id} | Update account |
| DELETE | /api/v1/accounts/{id} | Delete account |

## Frontend Pages

| Page | URL | Description |
|------|-----|-------------|
| Register | /register | User registration |
| Login | /login | User login |
| Account List | /accounts | View all accounts |
| Create Account | /accounts/new | Create new account |
| Edit Account | /accounts/{id}/edit | Edit account |

## Running Tests

```bash
mvn test
```

## Key Files

- Backend: `colossus/src/main/java/id/colossus/budget/account/`
- Frontend: `colossus/src/main/resources/templates/account/`
- Database: `colossus/src/main/resources/db/ddl/`