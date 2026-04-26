# Tasks: Budget Account Management

**Feature**: Budget Account Management
**Branch**: `004-budget-account`
**Generated**: April 27, 2026

## Implementation Strategy

**MVP Scope**: User Story 1 (Register and Login) - authentication is the foundation for all other features

**Incremental Delivery**: Each user story phase builds on the previous, creating a complete independently testable increment.

## Dependencies

```
User Story 1 (Register/Login) ──┬──> User Story 2 (Create Account)
                                 ├──> User Story 3 (View Accounts)
                                 ├──> User Story 4 (Update Account)
                                 └──> User Story 5 (Delete Account)
```

## Phases

### Phase 1: Setup (Project Initialization)

- [X] T001 Verify colossus submodule is on feature branch `004-budget-account`
- [X] T002 Create database migration: V001__create_users_table.sql in colossus/src/main/resources/db/ddl/
- [X] T003 Create database migration: V002__create_budget_accounts_table.sql in colossus/src/main/resources/db/ddl/
- [X] T004 Configure application.properties with PostgreSQL colossus_database connection in colossus/src/main/resources/
- [X] T005 Create module package structure: id.colossus.budget.account in colossus/src/main/java/id/colossus/
- [X] T006 Create backend packages: facade, biz-service, core-service, repository in colossus/src/main/java/id/colossus/budget/account/
- [X] T007 Create common packages: common-lang, common-util in colossus/src/main/java/id/colossus/

### Phase 2: Foundational (Blocking Prerequisites)

- [X] T008 [P] Create User entity in colossus/src/main/java/id/colossus/budget/account/repository/entity/User.java
- [X] T009 [P] Create BudgetAccount entity in colossus/src/main/java/id/colossus/budget/account/repository/entity/BudgetAccount.java
- [X] T010 [P] Create UserRepository interface in colossus/src/main/java/id/colossus/budget/account/repository/UserRepository.java
- [X] T011 [P] Create BudgetAccountRepository interface in colossus/src/main/java/id/colossus/budget/account/repository/BudgetAccountRepository.java
- [X] T012 Create AccountType enum in colossus/src/main/java/id/colossus/common/lang/AccountType.java
- [X] T013 [P] Create User DTOs (RegisterRequest, LoginRequest) in colossus/src/main/java/id/colossus/common/lang/dto/
- [X] T014 [P] Create AuthResponse DTO in colossus/src/main/java/id/colossus/common/lang/dto/
- [X] T015 Configure Spring Security with BCrypt password encoder in colossus/src/main/java/id/colossus/budget/account/config/
- [X] T016 Create custom exceptions: ResourceNotFoundException, BadRequestException in colossus/src/main/java/id/colossus/budget/account/facade/exception/

### Phase 3: User Story 1 - Register and Login (Priority: P0)

**Goal**: Users can register with username/password and login to access the system

**Independent Test**: Register a new user, logout, then login with same credentials - should succeed

- [X] T017 [US1] Create UserService interface in colossus/src/main/java/id/colossus/budget/account/core-service/UserService.java
- [X] T018 [US1] Implement UserService with register and login logic in colossus/src/main/java/id/colossus/budget/account/core-service/impl/UserServiceImpl.java
- [X] T019 [US1] Create AuthController with /api/v1/auth/register endpoint in colossus/src/main/java/id/colossus/budget/account/facade/
- [X] T020 [US1] Create AuthController with /api/v1/auth/login endpoint in colossus/src/main/java/id/colossus/budget/account/facade/
- [X] T021 [US1] Add Spring Security configuration for login endpoint in colossus/src/main/java/id/colossus/budget/account/config/
- [X] T022 [US1] Create registration Thymeleaf page in colossus/src/main/resources/templates/auth/register.html
- [X] T023 [US1] Create login Thymeleaf page in colossus/src/main/resources/templates/auth/login.html
- [ ] T024 [US1] Add authentication success handler to redirect to account list in colossus/src/main/java/id/colossus/budget/account/config/
- [X] T025 [US1] Add JS for form submission handling in colossus/src/main/resources/static/js/auth.js

### Phase 4: User Story 2 - Create Budget Account (Priority: P1)

**Goal**: Logged-in users can create new budget accounts with name, number, type, description, currency

**Independent Test**: Create account with all fields - verify it appears in account list

- [ ] T026 [P] [US2] Create AccountDTOs (CreateAccountRequest, AccountResponse) in colossus/src/main/java/id/colossus/common/lang/dto/
- [ ] T027 [US2] Create AccountService interface in colossus/src/main/java/id/colossus/budget/account/core-service/AccountService.java
- [ ] T028 [US2] Implement AccountService with create logic in colossus/src/main/java/id/colossus/budget/account/core-service/impl/AccountServiceImpl.java
- [ ] T029 [US2] Create AccountController with POST /api/v1/accounts endpoint in colossus/src/main/java/id/colossus/budget/account/facade/
- [ ] T030 [US2] Add account creation API security config in colossus/src/main/java/id/colossus/budget/account/config/
- [ ] T031 [US2] Create create account Thymeleaf page in colossus/src/main/resources/templates/account/create.html
- [ ] T032 [US2] Add create account JS with form handling in colossus/src/main/resources/static/js/account-create.js

### Phase 5: User Story 3 - View and List Budget Accounts (Priority: P1)

**Goal**: Logged-in users can view a list of all their budget accounts

**Independent Test**: View account list - should show all accounts belonging to logged-in user

- [ ] T033 [P] [US3] Add GET /api/v1/accounts endpoint to AccountController in colossus/src/main/java/id/colossus/budget/account/facade/
- [ ] T034 [US3] Implement list accounts logic in AccountService in colossus/src/main/java/id/colossus/budget/account/core-service/impl/AccountServiceImpl.java
- [ ] T035 [US3] Add security - filter by logged-in user ID in colossus/src/main/java/id/colossus/budget/account/core-service/impl/AccountServiceImpl.java
- [ ] T036 [US3] Create account list Thymeleaf page in colossus/src/main/resources/templates/account/list.html
- [ ] T037 [US3] Add account list JS with API call in colossus/src/main/resources/static/js/account-list.js
- [ ] T038 [US3] Add navigation menu to access accounts in colossus/src/main/resources/templates/fragments/

### Phase 6: User Story 4 - Update Budget Account (Priority: P2)

**Goal**: Logged-in users can update existing budget account details

**Independent Test**: Edit account details - verify changes are saved

- [ ] T039 [P] [US4] Add GET /api/v1/accounts/{id} endpoint to AccountController in colossus/src/main/java/id/colossus/budget/account/facade/
- [ ] T040 [P] [US4] Add PUT /api/v1/accounts/{id} endpoint to AccountController in colossus/src/main/java/id/colossus/budget/account/facade/
- [ ] T041 [US4] Implement get account by ID in AccountService in colossus/src/main/java/id/colossus/budget/account/core-service/impl/AccountServiceImpl.java
- [ ] T042 [US4] Implement update account logic in AccountService in colossus/src/main/java/id/colossus/budget/account/core-service/impl/AccountServiceImpl.java
- [ ] T043 [US4] Create edit account Thymeleaf page in colossus/src/main/resources/templates/account/edit.html
- [ ] T044 [US4] Add edit account JS with form handling in colossus/src/main/resources/static/js/account-edit.js

### Phase 7: User Story 5 - Delete Budget Account (Priority: P2)

**Goal**: Logged-in users can delete budget accounts

**Independent Test**: Delete account - verify it no longer appears in list

- [ ] T045 [US5] Add DELETE /api/v1/accounts/{id} endpoint to AccountController in colossus/src/main/java/id/colossus/budget/account/facade/
- [ ] T046 [US5] Implement delete account logic (soft delete) in AccountService in colossus/src/main/java/id/colossus/budget/account/core-service/impl/AccountServiceImpl.java
- [ ] T047 [US5] Add confirmation dialog to account list for delete in colossus/src/main/resources/templates/account/list.html
- [ ] T048 [US5] Add delete JS with confirmation handling in colossus/src/main/resources/static/js/account-list.js

### Phase 8: Polish & Cross-Cutting Concerns

- [ ] T049 Add global exception handler @RestControllerAdvice in colossus/src/main/java/id/colossus/budget/account/facade/exception/GlobalExceptionHandler.java
- [ ] T050 Add input validation messages in colossus/src/main/resources/messages.properties
- [ ] T051 Create common header/footer fragments in colossus/src/main/resources/templates/fragments/
- [ ] T052 Add user logout functionality in colossus/src/main/java/id/colossus/budget/account/config/
- [ ] T053 Add request logging interceptor in colossus/src/main/java/id/colossus/budget/account/config/
- [ ] T054 Verify all endpoints follow REST API standards (proper HTTP methods, status codes)
- [ ] T055 Add Javadoc comments to all public methods per constitution requirement

## Summary

| Metric | Value |
|--------|-------|
| Total Tasks | 55 |
| User Story 1 Tasks | 9 |
| User Story 2 Tasks | 7 |
| User Story 3 Tasks | 6 |
| User Story 4 Tasks | 6 |
| User Story 5 Tasks | 4 |
| Setup Tasks | 7 |
| Foundational Tasks | 9 |
| Polish Tasks | 7 |
| Parallelizable Tasks | 9 |

## MVP Scope

**Recommended MVP**: User Story 1 (Register and Login) - Tasks T001-T025

This provides the authentication foundation required for all subsequent user stories. Once register/login works, subsequent stories can be implemented incrementally.

## Parallel Execution Opportunities

Tasks marked [P] can be executed in parallel as they work on different files:
- T008, T009, T010, T011 (entity and repository creation)
- T012, T013, T014 (DTOs and enums)
- T026, T033, T039, T040 (various controller endpoints)