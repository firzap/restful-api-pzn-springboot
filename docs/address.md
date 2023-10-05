# Address API Specs

## Create Address

Endpoint : POST /api/contacts/{idContact}/addresses

Request header :

- X-API-TOKEN : Token (Mandatory)

Request body :

```json
{
  "street" : "Jalan apa",
  "city" : "kota",
  "province" : "provinsi",
  "country" : "negara",
  "postalCode" : "123123"
}
```

Response body (success):

```json
{
  "data" : {
    "id" : "randomString",
    "street" : "Jalan apa",
    "city" : "kota",
    "province" : "provinsi",
    "country" : "negara",
    "postalCode" : "123123"
  }
}
```

Response body (failed):

```json
{
  "errors" : "Contact is not found"
}
```

## Update Address

Endpoint : PUT /api/contacts/{idContact}/addresses/{idAddress}

Request header :

- X-API-TOKEN : Token (Mandatory)

Request body :

```json
{
  "street" : "Jalan apa",
  "city" : "kota",
  "province" : "provinsi",
  "country" : "negara",
  "postalCode" : "123123"
}
```

Response body (success):

```json
{
  "data" : {
    "id" : "randomString",
    "street" : "Jalan apa",
    "city" : "kota",
    "province" : "provinsi",
    "country" : "negara",
    "postalCode" : "123123"
  }
}
```

Response body (failed):

```json
{
  "errors" : "Address is not found"
}
```

## Get Address

Endpoint : GET /api/contacts/{idContact}/addresses/{idAddress}

Request header :

- X-API-TOKEN : Token (Mandatory)

Response body (success):

```json
{
  "data" : {
    "id" : "randomString",
    "street" : "Jalan apa",
    "city" : "kota",
    "province" : "provinsi",
    "country" : "negara",
    "postalCode" : "123123"
  }
}
```

Response body (failed):

```json
{
  "errors" : "Address is not found"
}
```

## Remove Address

Endpoint : DELETE /api/contacts/{idContact}/addresses/{idAddress}

Request header :

- X-API-TOKEN : Token (Mandatory)

Response body (success):

```json
{
  "data" : "OK"
}
```

Response body (failed):

```json
{
  "errors" : "Address is not found"
}
```

## List Address

Endpoint : GET /api/contacts/{idContact}/addresses

Request header :

- X-API-TOKEN : Token (Mandatory)

Response body (success):

```json
{
  "data" : [
    {
      "id" : "randomString",
      "street" : "Jalan apa",
      "city" : "kota",
      "province" : "provinsi",
      "country" : "negara",
      "postalCode" : "123123"
    }
  ]
}
```

Response body (failed):

```json
{
  "errors" : "Contact is not found"
}
```