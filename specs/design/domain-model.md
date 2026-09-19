# Domain Model

The platform's data centers on a Merchant's onboarding, the Transactions their customers pay, and the Payouts settled back to them; Disputes and saved Payment Methods hang off those.

```mermaid
erDiagram
    MERCHANT ||--o{ PAYOUT_ACCOUNT : links
    MERCHANT ||--o{ TRANSACTION : receives
    MERCHANT ||--o{ PAYOUT : "is paid"
    CUSTOMER ||--o{ PAYMENT_METHOD : saves
    CUSTOMER ||--o{ TRANSACTION : makes
    CUSTOMER ||--o{ DISPUTE : raises
    TRANSACTION ||--o| DISPUTE : "may have"

    MERCHANT {
        string id
        string businessName
        string country
        string currency
        string kycStatus
        decimal feePercentage
        string status
        datetime createdAt
    }
    PAYOUT_ACCOUNT {
        string id
        string merchantId
        string type
        string accountDetails
        boolean verified
    }
    TRANSACTION {
        string id
        string merchantId
        string customerId
        decimal amount
        string currency
        string paymentMethod
        string status
        datetime createdAt
    }
    PAYOUT {
        string id
        string merchantId
        decimal amount
        string currency
        string status
        date scheduledFor
        datetime paidAt
    }
    DISPUTE {
        string id
        string transactionId
        string customerId
        string reason
        string status
        string resolution
        datetime createdAt
    }
    CUSTOMER {
        string id
        string name
        string email
        datetime createdAt
    }
    PAYMENT_METHOD {
        string id
        string customerId
        string type
        string details
        datetime createdAt
    }
```

- **Merchant** — a registered business; `kycStatus` tracks onboarding review, `feePercentage` the flat rate applied to its transactions.
- **PayoutAccount** — the bank or mobile wallet a Merchant's weekly payout is sent to.
- **Transaction** — one customer payment via mobile money or card; `customerId` is optional (guest checkout).
- **Payout** — one scheduled weekly settlement run's disbursement to a Merchant.
- **Dispute** — a Customer's challenge to a Transaction, mediated by a Platform Admin.
- **Customer** — a shopper with an optional account for saved Payment Methods and history.

