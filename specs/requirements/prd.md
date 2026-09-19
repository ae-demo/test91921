# test91921 — PRD

## Problem Statement

Merchants across African countries struggle to accept digital payments from customers because mobile money and card payment methods are fragmented across providers, countries and currencies. Without a unified platform, merchants must integrate multiple payment rails themselves, manually reconcile transactions, and arrange their own settlement into local bank accounts or mobile wallets — a costly, error-prone burden that slows down small and growing businesses.

## Solution

A merchant payments platform that lets businesses across African countries accept online payments from customers via mobile money and card, track those transactions in one place, and receive scheduled payouts of their net proceeds to a linked bank account or mobile wallet — while platform administrators oversee merchant onboarding, risk and fee configuration, and customers get a fast, trustworthy checkout experience.

## Actors

- **Merchant** — a business that signs up, completes verification, integrates the hosted checkout, and manages its transactions, payout account and payout history.
- **Platform Admin** — internal staff who approve merchant onboarding, monitor transactions for risk, configure platform fees, manage payout runs, and resolve disputes.
- **Customer** — a shopper who pays a merchant online via mobile money or card, optionally with a saved account for faster future checkouts.

## User Stories

1. As a Merchant, I want to sign up and complete verification, so that I can start accepting payments on the platform.
2. As a Merchant, I want to sign in securely via single sign-on, so that I can access my dashboard.
3. As a Merchant, I want to generate a hosted checkout link or integrate a checkout API on my website, so that my customers can pay me online.
4. As a Merchant, I want to view a list of my transactions with their status and details, so that I can track my sales.
5. As a Merchant, I want to configure my payout bank account or mobile wallet, so that I receive settlement funds correctly.
6. As a Merchant, I want to view my scheduled payouts and their history, so that I can reconcile my earnings.
7. As a Merchant, I want to issue a refund to a customer for a completed transaction, so that I can resolve customer issues.
8. As a Merchant, I want to see a dashboard summary of sales, fees and payouts, so that I can understand my business performance at a glance.
9. As a Platform Admin, I want to review and approve or reject merchant onboarding applications, so that only verified businesses can collect payments.
10. As a Platform Admin, I want to monitor transactions across all merchants for suspicious activity, so that I can mitigate fraud risk.
11. As a Platform Admin, I want to configure platform fee rates, so that the business model is applied consistently.
12. As a Platform Admin, I want to manage and trigger merchant payout runs, so that settlements happen reliably on schedule.
13. As a Platform Admin, I want to view and resolve disputes raised against merchant transactions, so that conflicts are handled fairly.
14. As a Platform Admin, I want to suspend or deactivate a merchant account, so that I can respond to fraud or policy violations.
15. As a Customer, I want to pay a merchant using mobile money or a card at checkout, so that I can complete my purchase.
16. As a Customer, I want to create an account and save my payment methods, so that future checkouts are faster.
17. As a Customer, I want to receive a payment confirmation/receipt, so that I have proof of payment.
18. As a Customer, I want to view my payment history across merchants, so that I can track my spending.

## Product Decisions

- All actors (Merchant, Platform Admin, Customer) sign in via SSO through Thunder, the platform IDP.
- Payment collection is online checkout only for this release — a hosted checkout page and/or API integration; in-person collection (POS, USSD, QR) is out of scope for now.
- The platform holds collected funds and disburses net proceeds to each merchant's linked bank account or mobile wallet on a scheduled payout run, after deducting platform fees.
- Payment methods accepted are mobile money and card; no payment processor is registered in the organization's catalog yet, and none was named as already in use, so the specific processor(s) remain open for the design stage.
- Transaction and payout confirmations are sent by email. *assumed*
- Merchant onboarding requires basic KYC — business registration details and an identifying document — reviewed by a Platform Admin before the merchant is activated. *assumed*
- The platform charges a percentage-based transaction fee, deducted before settlement. *assumed*
- The platform supports multiple African countries and their local currencies. *assumed*
- Customers can raise a dispute on a transaction with the platform; a Platform Admin mediates the resolution with the merchant. *assumed*

## Out of Scope

- In-person/POS payment collection (USSD prompts, card terminals, QR codes) — reserved for a future release.
- Customer-to-customer or wallet-to-wallet transfers.
- Merchant accounting, bookkeeping or tax-reporting features.
- Loans, credit lines or working-capital advances to merchants.
- Cross-currency FX conversion beyond standard settlement-currency handling.

## Open Questions

1. Which African countries and currencies must the platform support at launch?
2. Which mobile money and card payment processors does the business already have agreements with, or must the platform integrate with?
3. What is the platform's transaction fee percentage or fee model?
4. What payout schedule cadence is expected (daily, weekly, or on demand)?

