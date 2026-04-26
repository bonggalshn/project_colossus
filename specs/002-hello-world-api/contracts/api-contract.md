# Hello World API Contract

**Version**: 1.0.0
**Base Path**: `/api`
**Content-Type**: `application/json`

## Endpoints

### 1. GET /hello - Basic Hello World

**Description**: Returns a basic "Hello World" greeting message

**Request**:
- Method: GET
- Path: `/api/hello`
- Headers: None required
- Query Parameters: None

**Successful Response**:
- Status Code: 200 OK
- Content-Type: application/json
- Body:
```json
{
  "message": "Hello World",
  "status": "success",
  "timestamp": "2026-04-26T14:00:00.000Z",
  "version": "1.0.0"
}
```

**Error Responses**:
- 405 Method Not Allowed: If HTTP method other than GET is used
- 500 Internal Server Error: If unexpected server error occurs

### 2. GET /hello?name={name} - Personalized Greeting

**Description**: Returns a personalized greeting with the specified name

**Request**:
- Method: GET
- Path: `/api/hello`
- Headers: None required
- Query Parameters:
  - `name` (string, optional): The name to include in the greeting

**Successful Response**:
- Status Code: 200 OK
- Content-Type: application/json
- Body (with name parameter):
```json
{
  "message": "Hello John",
  "status": "success",
  "timestamp": "2026-04-26T14:00:00.000Z",
  "version": "1.0.0"
}
```
- Body (without name parameter - same as basic endpoint):
```json
{
  "message": "Hello World",
  "status": "success",
  "timestamp": "2026-04-26T14:00:00.000Z",
  "version": "1.0.0"
}
```

**Validation Rules**:
- `name` parameter maximum length: 100 characters
- `name` parameter allowed characters: letters, numbers, spaces, basic punctuation

**Error Responses**:
- 400 Bad Request: If name parameter contains invalid characters or exceeds length limit
- 405 Method Not Allowed: If HTTP method other than GET is used
- 500 Internal Server Error: If unexpected server error occurs

### 3. GET /health - Health Check

**Description**: Returns the current health status and version information of the API

**Request**:
- Method: GET
- Path: `/api/health`
- Headers: None required
- Query Parameters: None

**Successful Response**:
- Status Code: 200 OK
- Content-Type: application/json
- Body:
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
  "uptime": "PT1H30M45S"
}
```

**Error Responses**:
- 405 Method Not Allowed: If HTTP method other than GET is used
- 503 Service Unavailable: If API is in degraded or unhealthy state
- 500 Internal Server Error: If unexpected server error occurs

## Response Format

### Standard Response Structure

All successful responses follow this structure:

```json
{
  "message": "string",
  "status": "string",  // success|error|warning
  "timestamp": "string",  // ISO-8601 timestamp
  "version": "string"  // semantic version
}
```

### Error Response Structure

All error responses follow this structure:

```json
{
  "message": "string",  // human-readable error message
  "error": "string",  // machine-readable error code
  "status": "error",
  "timestamp": "string",  // ISO-8601 timestamp
  "version": "string",  // API version
  "details": "string"  // optional detailed error information
}
```

## HTTP Status Codes

| Status Code | Usage |
|-------------|-------|
| 200 OK | Successful request |
| 400 Bad Request | Invalid client input |
| 405 Method Not Allowed | Unsupported HTTP method |
| 500 Internal Server Error | Unexpected server error |
| 503 Service Unavailable | API is unhealthy or overloaded |

## Rate Limiting

**Current Implementation**: No rate limiting applied

**Future Consideration**: When implementing rate limiting:
- Use standard HTTP headers: `X-RateLimit-Limit`, `X-RateLimit-Remaining`, `X-RateLimit-Reset`
- Return 429 Too Many Requests when limit exceeded
- Include retry-after information in response

## CORS Policy

**Development Environment**:
- Allow all origins (`*`)
- Allow all methods (GET, POST, PUT, DELETE, etc.)
- Allow all headers
- Max age: 3600 seconds

**Production Environment**:
- Configurable via properties
- Default: Restrict to known client domains

## Versioning

**Current Version**: 1.0.0

**Versioning Strategy**:
- URL-based versioning: `/api/v1/hello` (not implemented in v1.0.0)
- Header-based versioning: `Accept: application/vnd.colossus.v1+json` (future)
- Backward compatibility maintained within major versions

## Deprecation Policy

Not applicable for v1.0.0. Future versions will:
- Mark deprecated endpoints in documentation
- Include deprecation warnings in responses
- Maintain deprecated endpoints for at least 6 months
- Announce deprecations in release notes

## Authentication

**Current Implementation**: No authentication required

**Future Consideration**: When adding authentication:
- Use standard OAuth2/Bearer tokens
- Include Authorization header: `Authorization: Bearer {token}`
- Return 401 Unauthorized for missing/invalid credentials
- Return 403 Forbidden for insufficient permissions

## Examples

### cURL Examples

```bash
# Basic hello world
curl -X GET "http://localhost:8080/api/hello"

# Personalized greeting
curl -X GET "http://localhost:8080/api/hello?name=John"

# Health check
curl -X GET "http://localhost:8080/api/health"
```

### JavaScript Examples

```javascript
// Basic hello world
fetch('/api/hello')
  .then(response => response.json())
  .then(data => console.log(data.message));

// Personalized greeting
fetch('/api/hello?name=John')
  .then(response => response.json())
  .then(data => console.log(data.message));

// Health check
fetch('/api/health')
  .then(response => response.json())
  .then(data => console.log(data.serviceStatus));
```

## OpenAPI Specification

This contract can be represented in OpenAPI/Swagger format. See the implementation for the complete OpenAPI documentation.