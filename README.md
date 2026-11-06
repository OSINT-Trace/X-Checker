# X (Twitter) Account Checker & Intelligence API

[![OSINT Trace - Direct API (Recommended)](https://img.shields.io/badge/OSINT%20Trace-Direct%20API%20(Recommended)-00DF9A?style=for-the-badge&logo=shield)](https://osinttrace.com) [![API.Market](https://img.shields.io/badge/API.Market-8B5CF6?style=for-the-badge)](https://api.market/store/osint-trace-1/x-checker) [![RapidAPI](https://img.shields.io/badge/RapidAPI-black?style=for-the-badge&logo=rapidapi)](https://rapidapi.com/osint-org-osint-org-default/api/x-checker)

An enterprise-grade OSINT API to verify X (formerly Twitter) account existence and retrieve rich profile intelligence (account creation date, follower/following statistics, biography, avatar photos, verification badges, custom avatar flags, and direct profile URLs) by username, email address, or phone number.

> ⚠️ **Metadata Availability & Privacy Notice**:
> Extracted metadata is **conditional and never guaranteed**. Availability strictly depends on:
> 1. **Input Format**: Username queries inspect public profiles to extract audience metrics (`followers`, `following`), account age (`created_at`), biography, and verification status. Phone number queries perform high-speed carrier pre-auth verification to confirm whether the number is registered on X, returning presence confirmation only (`live: true/false`, without profile metadata). Email queries verify registration presence and attach profile data if the handle matches the email prefix.
> 2. **Platform & Privacy Settings**: Suspended, protected (private), or deactivated accounts may omit public attributes.

---
- [Features](#features)
- [Getting Started](#getting-started)
  - [1. Get API Key](#1-get-api-key)
  - [2. Base URL & Authentication](#2-base-url--authentication)
- [API Endpoints](#api-endpoints)
  - [Single Account Check](#single-account-check)
  - [Code Examples](#code-examples)
- [Response Format](#response-format)
- [HTTP Status Codes](#http-status-codes)
- [Requirements](#requirements)
- [Pricing](#pricing)
- [Support](#support)
- [Legal Compliance](#legal-compliance)

---

## Features

✅ **Instant Verification**: Real-time presence verification for X / Twitter profiles.  
✅ **Multi-Identifier Input**: Query using usernames, email addresses, or phone numbers (international E.164 format).  
✅ **Deep Metadata Extraction**: Returns display names, usernames, biographies, follower & following counts, account creation date (`created_at`), verified status badges, custom avatar indicators, and profile URLs.  
✅ **High Performance**: Asynchronous architecture with high-speed proxy cycling and anti-bot bypass.  
✅ **Developer-Friendly**: Available via direct REST API on [OSINT Trace](https://osinttrace.com) (Recommended) and major developer marketplaces.

---

## Getting Started

### 1. Get API Key

- **OSINT Trace Direct (Recommended)**: Create an account on [OSINT Trace](https://osinttrace.com) and generate your API Key from the [Workspace Dashboard](https://app.osinttrace.com).
- **API.Market**: Subscribe via [API.Market X Checker](https://api.market/store/osint-trace-1/x-checker).
- **RapidAPI**: Subscribe via [RapidAPI X Checker](https://rapidapi.com/osint-org-osint-org-default/api/x-checker).

### 2. Base URL & Authentication

Authentication headers and endpoints vary by provider:

| Provider | Base URL | Auth Header | Endpoint |
|:---|:---|:---|:---|
| **OSINT Trace (Direct - Recommended)** | `https://api.osinttrace.com/v1` | `x-osint-key: YOUR_OSINT_KEY` | `POST /check/x` |
| **API.Market** | `https://prod.api.market/api/v1/osint-trace-1/x-checker` | `X-Api-Key: YOUR_API_KEY` | `POST /check/x` |
| **RapidAPI** | `https://x-checker.p.rapidapi.com` | `X-RapidAPI-Key: YOUR_API_KEY`<br>`X-RapidAPI-Host: x-checker.p.rapidapi.com` | `POST /check` |

---

## API Endpoints

### Single Account Check

**Endpoint (OSINT Trace Direct - Recommended):**
> `POST https://api.osinttrace.com/v1/check/x`

**Request Body (Username or Email):**
```json
{
  "input": "target_user"
}
```

**Request Body (Phone Number):**
```json
{
  "input": "+14155552671"
}
```

### Code Examples

<details open>
<summary><b>OSINT Trace Direct API (cURL) — Recommended</b></summary>

```bash
# Verify by Username or Email
curl --request POST \
     --url https://api.osinttrace.com/v1/check/x \
     --header 'x-osint-key: YOUR_OSINT_KEY' \
     --header 'Content-Type: application/json' \
     --data '{"input": "target_user"}'

# Verify by Phone Number (E.164 format)
curl --request POST \
     --url https://api.osinttrace.com/v1/check/x \
     --header 'x-osint-key: YOUR_OSINT_KEY' \
     --header 'Content-Type: application/json' \
     --data '{"input": "+14155552671"}'
```
</details>

<details>
<summary><b>API.Market (cURL)</b></summary>

```bash
curl --request POST \
     --url https://prod.api.market/api/v1/osint-trace-1/x-checker/check/x \
     --header 'X-Api-Key: YOUR_API_KEY' \
     --header 'Content-Type: application/json' \
     --data '{"input": "+14155552671"}'
```
</details>

<details>
<summary><b>RapidAPI (cURL)</b></summary>

```bash
curl --request POST \
     --url https://x-checker.p.rapidapi.com/check \
     --header 'X-RapidAPI-Host: x-checker.p.rapidapi.com' \
     --header 'X-RapidAPI-Key: YOUR_API_KEY' \
     --header 'Content-Type: application/json' \
     --data '{"input": "+14155552671"}'
```
</details>

> Additional code snippets for Python, Node.js, Go, PHP, C#, Java, and Shell are available in the [`examples/`](./examples) directory.

---

## Response Format

### 1. Account Found via Username (Full Profile Metadata)
```json
{
  "live": true,
  "note": null,
  "metadata": {
    "username": "osint_specialist",
    "name": "Jane Analyst",
    "bio": "Threat intelligence, digital forensics, and cybersecurity research 🛡️",
    "avatar_url": "https://pbs.twimg.com/profile_images/example_avatar.jpg",
    "followers": 5820,
    "following": 410,
    "created_at": "2018-04-12T10:15:00Z",
    "is_verified": true,
    "has_custom_avatar": true,
    "profile_url": "https://x.com/osint_specialist"
  }
}
```

### 2. Account Found via Phone Number (Presence Verification)
```json
{
  "live": true,
  "note": null
}
```

### 3. Account Not Found
```json
{
  "live": false,
  "note": null,
  "metadata": null
}
```

---

## HTTP Status Codes

| Status Code | Description | Rationale |
|:---|:---|:---|
| **`200 OK`** | Success | Query processed and presence/metadata returned. |
| **`400 Bad Request`** | Validation Error | Malformed request body or input under minimum length. |
| **`401 Unauthorized`** | Authentication Required | Missing, invalid, or expired API key header. |
| **`403 Forbidden`** | Quota / Subscription Error | Quota balance exhausted or subscription inactive. |
| **`408 Request Timeout`** | Timeout | Upstream verification exceeded maximum execution window. |
| **`429 Too Many Requests`** | Rate Limit Exceeded | Exceeded 1 request/second limit. |

---

## Requirements

- **Minimum input length**: 3 characters
- **Supported input formats**:
  - Usernames (`target_user`)
  - Email addresses (`user@example.com`)
  - Phone numbers in international standard E.164 format (`+14155552671`, `+212612423061`)
- **Rate Limit**: 1 request per second per active API key.

---

## Pricing

- **Direct Plans (Recommended)**: Flexible subscription tiers and bulk volume pricing available on [OSINT Trace Pricing](https://osinttrace.com/pricing).
- **Marketplace Plans**: Subscriptions also available through [API.Market](https://api.market/store/osint-trace-1/x-checker) and [RapidAPI](https://rapidapi.com/osint-org-osint-org-default/api/x-checker/pricing).
- **Free Tier**: Free tier available for evaluation and testing.

---

## Support

For technical inquiries, enterprise SLA plans, or integration assistance:  
📧 Email: [support@osinttrace.com](mailto:support@osinttrace.com)  
🌐 Website: [osinttrace.com](https://osinttrace.com)

---

## Legal Compliance

This API is designed for legitimate cybersecurity investigation, fraud prevention, brand safety, and threat intelligence. Users must:
- Comply with applicable local and international data protection regulations (e.g., GDPR, CCPA).
- Adhere to X's Terms of Service and developer guidelines.
- Ensure lawful basis for investigative data processing.

*This service is independently operated by OSINT Trace and is not affiliated with or endorsed by X Corp.*
