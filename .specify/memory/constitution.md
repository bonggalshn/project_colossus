<!--
Sync Impact Report:
- Version change: 1.9.1 → 1.9.2 (Patch - Added database name constraint in Technology Stack)
- Modified sections: Enhanced "VI. Technology Stack" - specify single database name
- Templates requiring updates: ✅ No template changes required
- Follow-up TODOs: None
-->

# Colossus Engine Constitution

**System**: Colossus Engine is the main system containing both backend and frontend components.

- **Backend**: Java 25 with Spring Boot, located in `colossus/src/main/java/id/colossus/`
- **Frontend**: Thymeleaf templates, located in `colossus/src/main/resources/templates/`
- **Submodule**: The `colossus` directory is a git submodule (path: colossus, repository: git@github.com:bonggalshn/colossus.git)
- All feature changes must be implemented in the submodule repository first, then synced to the main repository.

## Core Principles

### I. Module Organization
The project follows a strict two-repository structure:

**Parent Repository** (`project_colossus`):
- Contains only markdown documentation
- Stores specs, requirements, tasks, plans, and design documents
- Location: `specs/` directory
- **DO NOT** place any code files here

**Submodule Repository** (`colossus`):
- Contains all code implementation
- Java source code: `colossus/src/main/java/id/colossus/`
- Thymeleaf templates: `colossus/src/main/resources/templates/`
- Static resources: `colossus/src/main/resources/static/`
- Database migrations: `colossus/src/main/resources/db/`
- All implementation artifacts must be in the submodule

### II. Clean Code and Documentation
The code must be clean and have Javadoc to explain each method's purpose. This ensures maintainability and clarity for all developers working on the project.

### III. Separation of Responsibilities
The frontend must always communicate with the backend using REST API. This ensures a clear separation of responsibilities between the frontend and backend layers.

### IV. Branch Management
Never push to the submodule's main or master branch. Always push to a feature branch. Merging to the main or master branch is done manually by the user via pull request.

**Specification Workflow**:
- When `/speckit.specify` is invoked and the feature name is determined, a feature branch MUST be created on the parent module.
- Immediately after creating the feature branch, the parent module MUST be checked out to that feature branch.
- All subsequent specification work (planning, tasks) MUST happen on this feature branch.
- This ensures feature documentation is properly tracked alongside the feature branch.

### V. Submodule Branch Management
All submodule edits must follow strict branch alignment rules:

- **Branch Name Match**: Any edit on the submodule MUST be done under a feature branch with the same name as the parent module branch.
- **Branch Checkout**: If the submodule is currently on a different branch than the parent module, you MUST checkout to the correct branch that has the same name as the parent module branch before making any edits.
- **Branch Creation**: If the required branch does not exist in the submodule repository, you MUST create it from the master branch before making any edits.
- **Verification**: Always verify the submodule branch matches the parent branch before committing any changes.

This ensures that all code changes in the submodule are properly tracked and associated with their corresponding feature branches in the parent repository.

### VI. Technology Stack
The project uses Java 25 with Spring Boot for the backend and Thymeleaf for the frontend. PostgreSQL is used as the database with a single database named `colossus_database`. All tables are created within this database as master data. The main dependencies are:
- spring-boot-starter-webmvc (REST API)
- spring-boot-starter-thymeleaf (Frontend template engine)

### VII. Backend Structure
The backend must follow a modular structure:
- **facade**: The main interface for external communication.
- **biz-service**: Business logic layer.
- **core-service**: Core business logic and services.
- **repository**: Database interaction layer.
- **integration**: Integration with third-party services/systems.
- **common-util**: Common utility functions and logic.
- **common-lang**: Enums, constants, and POJO classes commonly used across the project.

### VIII. Frontend Code Standards (Thymeleaf + JavaScript)
All Thymeleaf templates and JavaScript must follow these rules:

**Thymeleaf Best Practices:**
- Use fragments for reusable components (header, footer, navigation)
- Use Layout Dialect (`th:fragment`, `th:replace`) for consistent page structure
- Keep templates in `src/main/resources/templates/` following naming conventions
- Use `th:text` and `th:utext` for text content (utext for unescaped HTML)
- Use `@{/path}` syntax for URL generation (never hardcode URLs)
- Include CSRF tokens in all forms using `th:csrf`
- Externalize user-facing text to `messages.properties` for i18n support
- Keep business logic in controllers, NOT in templates

**JavaScript Best Practices:**
- Place JavaScript in `src/main/resources/static/js/`
- Use ES6+ syntax with const/let (avoid var)
- Keep functions small and single-purpose
- Use meaningful variable and function names
- Add JSDoc comments for functions
- Handle errors with try-catch blocks
- Use async/await for asynchronous operations
- Avoid inline scripts; use external files with th:src="@{/js/file.js}"

### IX. REST API Standards
All REST controllers must follow these rules:

**Controller Best Practices:**
- Use `@RestController` (not `@Controller`)
- Use constructor injection for dependencies
- Use proper HTTP methods: GET (read), POST (create), PUT (replace), PATCH (update), DELETE (remove)
- Use plural nouns for resource names (e.g., `/users`, `/orders`)
- Return correct HTTP status codes: 200 (OK), 201 (Created), 204 (No Content), 400 (Bad Request), 404 (Not Found), 500 (Server Error)
- Use DTOs for request/response (not entities)
- Apply Jakarta Bean Validation (`@Valid`) for request bodies
- Keep controllers thin; delegate business logic to services
- Use `@RequestMapping` for versioned APIs (e.g., `/api/v1/`)
- Return `ResponseEntity<T>` with specific types (not raw generics)

**Exception Handling:**
- Use `@RestControllerAdvice` for global exception handling
- Create custom exceptions (e.g., `ResourceNotFoundException`, `BadRequestException`)
- Return consistent error response structure

### X. Database Access Standards
All JPA repositories and database operations must follow these rules:

**Repository Best Practices:**
- Extend `JpaRepository` for standard CRUD operations
- Use derived query methods for simple lookups
- Use `@Query` (JPQL) for complex queries
- Use projections for read-only operations (not full entities)
- Enable JDBC batching: `spring.jpa.properties.hibernate.jdbc.batch_size=50`
- Avoid `GenerationType.IDENTITY` for batch inserts
- Use `@NoRepositoryBean` for reusable base interfaces

**Entity Design:**
- Use soft deletes (mark as deleted, don't physically remove)
- Define fetch type as `LAZY` for collections
- Use `@Transactional` on service methods, not controllers
- Set `readOnly = true` for read operations
- Keep transactions short; avoid network calls inside transactions

**Performance:**
- Treat N+1 queries as bugs; use `JOIN FETCH` or `@EntityGraph`
- Use pagination with `Pageable` for large datasets
- Cap page sizes in public APIs
- Enable query logging for development; disable in production

### XI. Database Schema Management
All database schema changes must follow these rules:

**DDL (Data Definition Language):**
DDL defines or modifies database structure (CREATE, ALTER, DROP).
- Store all DDL scripts in `resources/db/ddl/` directory
- Use separate files: one file per table or index change
- Use naming convention: `V<version>__<description>.sql` (Flyway style)
- Always include comments explaining the purpose
- Never modify existing DDL files; create new migration files

**DML (Data Manipulation Language):**
DML manipulates data within tables (INSERT, UPDATE, DELETE).
- Store all DML scripts in `resources/db/dml/` directory
- Use for seed data, reference tables, lookups
- Include rollback scripts when possible

**Single Source of Truth:**
- All SQL must be stored in the submodule repository (`colossus/resources/db/`)
- All schema changes must have corresponding SQL migration files
- Use Flyway or Liquibase for database versioning
- Never create tables or modify schema via JPA annotations alone

## Development Workflow

### Branch Strategy
- Feature branches must be used for all new developments.
- Pull requests are required for merging into the main or master branch.
- Code reviews are mandatory before merging.

### Code Quality
- All code must adhere to clean code principles.
- Javadoc comments are mandatory for all methods.
- Code must be reviewed and approved by at least one other developer.

## Governance

The constitution supersedes all other practices. Amendments require documentation, approval, and a migration plan. All PRs and reviews must verify compliance with the constitution. Complexity must be justified and documented.

**Version**: 1.9.2 | **Ratified**: 2026-04-26 | **Last Amended**: 2026-04-27