# Implementation Tasks: Hello World REST API

**Branch**: `002-hello-world-api` | **Date**: 2026-04-26 | **Plan**: [plan.md](plan.md)

## Task Summary

- **Total Tasks**: 29
- **Parallelizable**: 11 tasks
- **User Stories**: 3 (US1, US2, US3)

## MVP Scope

**User Story 1 (P1)** - Basic Hello World Endpoint: Tasks T001-T005, T014-T015
This is the MVP. Implementing just these tasks will provide a working API that can be tested and verified.

## Phase 1: Setup

- [X] T001 Create package structure in colossus/src/main/java/id/colossus/helloworld/ based on backend architecture (facade, bizservice, coreservice, repository, integration, commonutil, commonlang)

- [X] T002 Create application configuration in colossus/src/main/resources/application.properties

- [X] T003 Configure Jackson for JSON processing in application.properties (date format, serialization)

- [X] T004 Add CORS configuration for development environment per API contract

## Phase 2: Foundational

- [X] T005 [P] Create ApiResponse POJO in colossus/src/main/java/id/colossus/helloworld/commonlang/ApiResponse.java

- [X] T006 [P] Create HealthResponse POJO in colossus/src/main/java/id/colossus/helloworld/commonlang/HealthResponse.java

- [X] T007 Create Constants class in colossus/src/main/java/id/colossus/helloworld/commonutil/Constants.java

- [X] T008 [P] Implement global exception handler with @RestControllerAdvice in colossus/src/main/java/id/colossus/helloworld/controller/GlobalExceptionHandler.java

- [X] T009 [P] Implement custom exceptions (ResourceNotFoundException, BadRequestException) in colossus/src/main/java/id/colossus/helloworld/exception/

## Phase 3: User Story 1 - Basic Hello World Endpoint (P1)

**Goal**: Implement `/api/hello` endpoint returning `{"message": "Hello World"}`
**Independent Test**: GET /api/hello returns 200 with JSON body containing "Hello World"

### Tests

- [X] T010 [P] [US1] Create HelloWorldControllerTest in colossus/src/test/java/id/colossus/helloworld/controller/

### Implementation

- [X] T011 [US1] Implement HelloWorldController with GET /api/hello endpoint in colossus/src/main/java/id/colossus/helloworld/controller/HelloWorldController.java

- [X] T012 [US1] Implement HelloWorldFacade in colossus/src/main/java/id/colossus/helloworld/facade/HelloWorldFacade.java

- [X] T013 [US1] Implement HelloWorldBizService in colossus/src/main/java/id/colossus/helloworld/bizservice/HelloWorldBizService.java

- [X] T014 [US1] Implement HelloWorldCoreService in colossus/src/main/java/id/colossus/helloworld/coreservice/HelloWorldCoreService.java

- [X] T015 [US1] Verify endpoint returns correct JSON response per API contract

## Phase 4: User Story 2 - Custom Greeting Endpoint (P2)

**Goal**: Implement `/api/hello?name=John` endpoint returning personalized greeting
**Independent Test**: GET /api?name=John returns `{"message": "Hello John"}`

### Implementation

- [X] T016 [US2] Extend HelloWorldController to accept optional query parameter `name`

- [X] T017 [US2] Update HelloWorldCoreService to handle parameterized greeting

- [X] T018 [US2] Add validation for name parameter (max 100 chars per API contract)

- [X] T019 [US2] Add edge case handling for invalid/missing parameters

## Phase 5: User Story 3 - Health Check Endpoint (P3)

**Goal**: Implement `/api/health` endpoint returning status and version
**Independent Test**: GET /api/health returns 200 with JSON body containing status and version

### Implementation

- [X] T020 [US3] Implement HealthCheckController with GET /api/health endpoint in colossus/src/main/java/id/colossus/helloworld/controller/HealthCheckController.java

- [X] T021 [US3] Implement HealthCheckFacade in colossus/src/main/java/id/colossus/helloworld/facade/HealthCheckFacade.java

- [X] T022 [US3] Implement HealthCheckCoreService for health status logic in colossus/src/main/java/id/colossus/helloworld/coreservice/HealthCheckCoreService.java

- [X] T023 [US3] Add uptime tracking per API contract

## Phase 6: Polish & Cross-Cutting Concerns

- [X] T024 Add Javadoc comments to all public methods per Constitution I

- [X] T025 Verify proper HTTP status codes: 200, 400, 405, 500 per API contract

- [X] T026 Ensure Content-Type: application/json in all responses

- [X] T027 Run all acceptance scenarios from spec.md and verify pass

- [X] T028 Generate OpenAPI/Swagger documentation for all endpoints per FR-007

- [X] T029 Create integration test covering all three endpoints

## Implementation Strategy

**MVP First**: Complete Phase 1, Phase 2, Phase 3 (US1) to get a working API.
**Incremental Delivery**: Add US2, then US3, then Polish phase.

### Independent Test Criteria

- **US1**: GET /api/hello returns 200 with `{"message": "Hello World", "status": "success"}`
- **US2**: GET /api/hello?name=John returns 200 with `{"message": "Hello John"}`; GET /api/hello returns default greeting
- **US3**: GET /api/health returns 200 with status "healthy" and version "1.0.0"

### Dependency Graph

```
Phase 1 (Setup)
    ↓
Phase 2 (Foundational)
    ↓
Phase 3 (US1) ← MVP
    ↓
Phase 4 (US2)     Phase 5 (US3)
    ↓                ↓
    └────────┬───────┘
             ↓
     Phase 6 (Polish)
```

### Parallel Opportunities

Tasks marked [P] can be executed in parallel when files don't have dependencies:
- T002, T003, T004 (application setup tasks)
- T005, T006, T007 (POJO tasks)
- T008, T009 (exception handling)
- T010 (test - US1)
- T016, T020 (controller extensions - can implement in parallel)