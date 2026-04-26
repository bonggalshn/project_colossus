# Data Model: Budget Account Management

**Database**: `colossus_database` (single database as per constitution)

All tables are created within `colossus_database` as master data.

## Entities

### User

Represents a registered user of the budget planner system.

| Field | Type | Constraints | Description |
|-------|------|-------------|-------------|
| id | Long | PK, Auto-generated | Unique user identifier |
| username | String | NOT NULL, UNIQUE | User's login name |
| password | String | NOT NULL | Encrypted password (BCrypt) |
| createdAt | Timestamp | NOT NULL | Account creation timestamp |
| updatedAt | Timestamp | NOT NULL | Last update timestamp |

**Relationships**:
- One User has Many BudgetAccounts (cascade delete)

---

### BudgetAccount

Represents a user's financial account for budget tracking.

| Field | Type | Constraints | Description |
|-------|------|-------------|-------------|
| id | Long | PK, Auto-generated | Unique account identifier |
| userId | Long | NOT NULL, FK | Reference to User |
| accountName | String | NOT NULL | Name of the account |
| accountNo | String | NOT NULL, UNIQUE | Account number/identifier |
| accountType | Enum | NOT NULL | CASH or DEBIT |
| accountDescription | String | NULLABLE | Optional description |
| accountCurrency | String | NOT NULL | Currency code (e.g., USD, EUR) |
| createdAt | Timestamp | NOT NULL | Account creation timestamp |
| updatedAt | Timestamp | NOT NULL | Last update timestamp |
| deleted | Boolean | NOT NULL, DEFAULT false | Soft delete flag |

**Relationships**:
- Many BudgetAccount belongs to One User

---

## Enums

### AccountType

| Value | Description |
|-------|-------------|
| CASH | Cash-based account |
| DEBIT | Debit card/bank account |

---

## Validation Rules

### User Registration
- username: Required, 3-50 characters, alphanumeric + underscore
- password: Required, minimum 6 characters

### Budget Account
- accountName: Required, 1-100 characters
- accountNo: Required, 1-50 characters, unique system-wide
- accountType: Required, must be CASH or DEBIT
- accountDescription: Optional, max 500 characters
- accountCurrency: Required, 3-character ISO currency code

---

## State Transitions

### User States
- **Active**: Normal registered user
- No additional state machine needed for v1

### BudgetAccount States
- **Active**: Normal account, visible in list
- **Deleted**: Soft-deleted (marked deleted=true), hidden from list

---

## Indexes

| Index | Fields | Purpose |
|-------|--------|---------|
| idx_user_username | username | Fast login lookup |
| idx_account_user_id | user_id | Fast user account lookup |
| idx_account_no | account_no | Unique constraint enforcement |
| idx_account_deleted | deleted | Filter soft-deleted records |