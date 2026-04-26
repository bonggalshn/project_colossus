<!--
Sync Impact Report:
- Version change: N/A → 1.0.0 (Initial version)
- Added sections: Core Principles, Development Workflow, Governance
- Templates requiring updates: ✅ plan-template.md, ✅ spec-template.md, ✅ tasks-template.md, ✅ README.md
- Follow-up TODOs: None
-->

# Colossus Engine Constitution

## Core Principles

### I. Clean Code and Documentation
The code must be clean and have Javadoc to explain each method's purpose. This ensures maintainability and clarity for all developers working on the project.

### II. Separation of Responsibilities
The frontend must always communicate with the backend using REST API. This ensures a clear separation of responsibilities between the frontend and backend layers.

### III. Branch Management
Never push to the submodule's main or master branch. Always push to a feature branch. Merging to the main or master branch is done manually by the user via pull request.

### IV. Technology Stack
The project uses Java 25 with Spring Boot for the backend and Thymeleaf for the frontend. PostgreSQL is used as the database.

### V. Backend Structure
The backend must follow a modular structure:
- **facade**: The main interface for external communication.
- **biz-service**: Business logic layer.
- **core-service**: Core business logic and services.
- **repository**: Database interaction layer.
- **integration**: Integration with third-party services/systems.
- **common-util**: Common utility functions and logic.
- **common-lang**: Enums, constants, and POJO classes commonly used across the project.

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

**Version**: 1.0.0 | **Ratified**: 2026-04-26 | **Last Amended**: 2026-04-26
