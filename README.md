# project_colossus
Project to manage colossus engine.

## Constitution
The project follows the constitution defined in `.specify/memory/constitution.md`.

### Core Principles
1. **Clean Code and Documentation**: All code must be clean and have Javadoc to explain each method's purpose.
2. **Separation of Responsibilities**: The frontend must always communicate with the backend using REST API.
3. **Branch Management**: Never push to the submodule's main or master branch. Always push to a feature branch.
4. **Technology Stack**: The project uses Java 25 with Spring Boot for the backend and Thymeleaf for the frontend. PostgreSQL is used as the database.
5. **Backend Structure**: The backend must follow a modular structure:
   - **facade**: The main interface for external communication.
   - **biz-service**: Business logic layer.
   - **core-service**: Core business logic and services.
   - **repository**: Database interaction layer.
   - **integration**: Integration with third-party services/systems.
   - **common-util**: Common utility functions and logic.
   - **common-lang**: Enums, constants, and POJO classes commonly used across the project.

### Development Workflow
- **Branch Strategy**: Feature branches must be used for all new developments. Pull requests are required for merging into the main or master branch. Code reviews are mandatory before merging.
- **Code Quality**: All code must adhere to clean code principles. Javadoc comments are mandatory for all methods. Code must be reviewed and approved by at least one other developer.

### Governance
The constitution supersedes all other practices. Amendments require documentation, approval, and a migration plan. All PRs and reviews must verify compliance with the constitution. Complexity must be justified and documented.
