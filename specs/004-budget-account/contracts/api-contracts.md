# REST API Contracts: Budget Account Management

## Authentication API

### Register User

**POST** `/api/v1/auth/register`

**Request Body:**
```json
{
  "username": "string (required, 3-50 chars)",
  "password": "string (required, min 6 chars)"
}
```

**Responses:**
- 201 Created: User registered successfully
- 400 Bad Request: Validation errors
- 409 Conflict: Username already exists

---

### Login User

**POST** `/api/v1/auth/login`

**Request Body:**
```json
{
  "username": "string (required)",
  "password": "string (required)"
}
```

**Responses:**
- 200 OK: Login successful, returns session/token
- 401 Unauthorized: Invalid credentials

---

## Budget Account API

### List Accounts

**GET** `/api/v1/accounts`

**Headers:** Authorization required

**Responses:**
- 200 OK: Returns array of accounts
- 401 Unauthorized: Not logged in

**Response:**
```json
[
  {
    "id": 1,
    "accountName": "My Savings",
    "accountNo": "ACC001",
    "accountType": "CASH",
    "accountDescription": "Savings account",
    "accountCurrency": "USD"
  }
]
```

---

### Create Account

**POST** `/api/v1/accounts`

**Headers:** Authorization required

**Request Body:**
```json
{
  "accountName": "string (required)",
  "accountNo": "string (required, unique)",
  "accountType": "CASH | DEBIT (required)",
  "accountDescription": "string (optional)",
  "accountCurrency": "string (required, 3-char code)"
}
```

**Responses:**
- 201 Created: Account created
- 400 Bad Request: Validation errors
- 401 Unauthorized: Not logged in

---

### Get Account

**GET** `/api/v1/accounts/{id}`

**Headers:** Authorization required

**Responses:**
- 200 OK: Returns account details
- 404 Not Found: Account not found
- 401 Unauthorized: Not logged in

---

### Update Account

**PUT** `/api/v1/accounts/{id}`

**Headers:** Authorization required

**Request Body:**
```json
{
  "accountName": "string (optional)",
  "accountType": "CASH | DEBIT (optional)",
  "accountDescription": "string (optional)",
  "accountCurrency": "string (optional)"
}
```

**Responses:**
- 200 OK: Account updated
- 400 Bad Request: Validation errors
- 404 Not Found: Account not found
- 401 Unauthorized: Not logged in

---

### Delete Account

**DELETE** `/api/v1/accounts/{id}`

**Headers:** Authorization required

**Responses:**
- 204 No Content: Account deleted
- 404 Not Found: Account not found
- 401 Unauthorized: Not logged in

---

## Error Response Format

```json
{
  "timestamp": "2026-04-27T10:00:00",
  "status": 400,
  "error": "Bad Request",
  "message": "Validation failed",
  "details": [
    {
      "field": "accountName",
      "message": "Account name is required"
    }
  ]
}
```