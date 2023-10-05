# User API Spec

## Register user
Endpoint : POST /api/users

Request body :
```json
{
  "username" : "cuycuy",
  "password" : "rahasia",
  "name" : "Memet Dollar"
}
```

Response body (Success) :
```json
{
  "data" : "OK"
}
```

Response body (Failed) :
```json
{
  "errors" : "Username must not blank, ???"
}
```
## Login user
Endpoint : POST /api/auth/login

Request body :
```json
{
  "username" : "cuycuy",
  "password" : "rahasia"
}
```

Response body (Success) :
```json
{
  "data" : {
    "token" : "TOKEN",
    "expiredAt" : 12321312312313123 //milisec
  }
}
```

Response body (Failed) :
```json
{
  "errors" : "Username or password wrong"
}
```
## Get user
Endpoint : GET /api/users/current

Request header :

- X-API-TOKEN : Token (Mandatory)

Response body (Success) :
```json
{
  "data" : {
    "username" : "cuycuy",
    "name" : "Memet Dollar"
  }
}
```

Response body (Failed) :
```json
{
  "errors" : "Unauthorized"
}
```
## Update user
Endpoint : PATCH /api/users/current

Request header :

- X-API-TOKEN : Token (Mandatory)

Request body :
```json
{
  "name" : "Memet Dollar", // put if only want to update name
  "password" : "new pass" // put if only want to update password
}
```

Response body (Success) :
```json
{
  "data" : {
    "username" : "cuycuy",
    "name" : "Memet Dollar"
  }
}
```

Response body (Failed) :
```json
{
  "errors" : "Unauthorized"
}
```
## Logout user

Endpoint : DELETE /api/auth/logout

Request header :

- X-API-TOKEN : Token (Mandatory)

Response body (Success) :
```json
{
  "data" : "OK"
}
```