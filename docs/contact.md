# Contact API Spec

## Create Contact

Endpoint : POST /api/contacts

Request header :

- X-API-TOKEN : Token (Mandatory)

Request body :
```json
{
  "firstName" : "Memet",
  "lastName" : "Dollar",
  "email" : "metdol@example.com",
  "phone" : "0888123123"
}
```

Response body (Success) :
```json
{
  "data" : {
    "id" : "random string",
    "firstName" : "Memet",
    "lastName" : "Dollar",
    "email" : "metdol@example.com",
    "phone" : "0888123123"
  }
}
```

Response body (Failed) :
```json
{
  "errors" : "Email format invalid, phone format invalid, ..."
}
```

## Update Contact

Endpoint : PUT /api/contacts/{idContact}

Request header :

- X-API-TOKEN : Token (Mandatory)

Request body :
```json
{
  "firstName" : "Memet",
  "lastName" : "Dollar",
  "email" : "metdol@example.com",
  "phone" : "0888123123"
}
```

Response body (Success) :
```json
{
  "data" : {
    "id" : "random string",
    "firstName" : "Memet",
    "lastName" : "Dollar",
    "email" : "metdol@example.com",
    "phone" : "0888123123"
  }
}
```

Response body (Failed) :
```json
{
  "errors" : "Email format invalid, phone format invalid, ..."
}
```

## Get Contact

Endpoint : GET /api/contacts/{idContact}

Request header :

- X-API-TOKEN : Token (Mandatory)

Response body (Success) :
```json
{
  "data" : {
    "id" : "random string",
    "firstName" : "Memet",
    "lastName" : "Dollar",
    "email" : "metdol@example.com",
    "phone" : "0888123123"
  }
}
```

Response body (Failed) :
```json
{
  "errors" : "Contact is not found"
}
```

## Search Contact

Endpoint : GET /api/contacts

Request / Query param :

- name : String, contact first name or last name, using like query, optional
- phone : String, contact phone, using like query, optional
- email : String, contact email, using like query, optional
- page : Integer, start from 0, default 0
- size : Integer, default 10

Request header :

- X-API-TOKEN : Token (Mandatory)

Response body (Success) :
```json
{
  "data" : [
    {
      "id" : "random string",
      "firstName" : "Memet",
      "lastName" : "Dollar",
      "email" : "metdol@example.com",
      "phone" : "0888123123"
    }
  ],
  "paging" : {
    "currentPage" : 0
    "totalPage" : 10,
    "size" : 10
  }
}
```

Response body (Failed) :
```json
{
  "errors" : "Unauthorized"
}
```

## Remove Contact

Endpoint : DELETE /api/contacts/{idContact}

Request header :

- X-API-TOKEN : Token (Mandatory)

Response body (Success) :
```json
{
  "data" : "OK"
}
```

Response body (Failed) :
```json
{
  "data" : "Contact is not found"
}
```