# X Account Checker API

[![RapidAPI Badge](https://img.shields.io/badge/Available%20on-RapidAPI-black?style=for-the-badge&logo=rapidapi)](https://rapidapi.com/osint-org-osint-org-default/api/x-checker)

A lightweight API to verify X (formerly known as Twitter) account existence by username and email.

## Table of Contents
- [Features](#features)
- [Getting Started](#getting-started)
- [API Endpoints](#api-endpoints)
  - [Single Account Check](#single-account-check)
  - [Bulk Account Check](#bulk-account-check)
- [Response Format](#response-format)
- [Requirements](#requirements)
- [Pricing](#pricing)
- [Support](#support)
- [Legal Compliance](#legal-compliance)

## Features

✅ Single account verification  
✅ Bulk check up to 10 accounts at once  
✅ Supports emails and usernames  
✅ Fast JSON responses  
✅ Enterprise-grade reliability  

## Getting Started
1. **Get API Key**
   - Subscribe via [RapidAPI Hub](https://rapidapi.com/osint-org-osint-org-default/api/x-cchecker)
   - Get your `X-RapidAPI-Key` from your dashboard

2. **Base URL**
```text
https://x-checker.p.rapidapi.com
```
## API Endpoints
### Single Account Check

**Endpoint**
> POST /check

***Request***  
   ```json
{
    "input": "test@example.com"
}
```

**cURL Example**
```bash
curl --request POST \
     --url https://x-checker.p.rapidapi.com/check \
     --header 'X-RapidAPI-Host: x-checker.p.rapidapi.com' \
     --header 'X-RapidAPI-Key: YOUR_API_KEY' \
     --header 'Content-Type: application/json' \
     --data '{"input": "test@example.com"}'
```
### Bulk Account Check
**Endpoint**  
> POST /check_bulk

**Request**
```json
{
    "input": [
        "test@example.com",
        "xuser123",
        "19295551234"
    ]
}
```
**Python Example**
```python
import requests

url = "https://x-checker.p.rapidapi.com/check_bulk"
payload = {"input": ["test@example.com", "xuser123", "+19295551234"]}
headers = {
    "X-RapidAPI-Key": "YOUR_API_KEY",
    "X-RapidAPI-Host": "x-checker.p.rapidapi.com",
    "Content-Type": "application/json"
}

response = requests.post(url, json=payload, headers=headers)
print(response.json())
```

## Response Format
**Successful Response**
```json
{
  "live": true
}
```
**Bulk Response**
```json
[
  {
    "live": true,
    "identifier": "john@doe.com"
  },
  {
    "live": true,
    "identifier": "jane@doe.com"
  },
  {
    "live": false,
    "identifier": "19295551234"
  }
]
```

## Requirements
- Minimum input length: 3 characters

- Bulk requests limited to 10 items per call

- Valid input types:
  - Email addresses
  - Usernames
 
## Pricing
Flexible plans available through [RapidAPI](https://rapidapi.com/osint-org-osint-org-default/api/x-checker/pricing).   
Free tier available for testing and low-volume usage.

## Support

For technical issues or enterprise inquiries:  
📧 <info@osinttrace.com>
## Legal Compliance

This API is intended for legitimate use cases only. Users are responsible for:

- Complying with X's Terms of Service
- Adhering to all applicable data privacy laws
- Obtaining proper consent for data processing

*This service is not affiliated with or endorsed by X Inc.*
