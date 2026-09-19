screen OnboardingQueue "Merchants awaiting KYC review"
  navbar "Admin"
  sidebar "Onboarding -> OnboardingQueue | Transactions -> TransactionMonitor | Payouts -> PayoutRuns | Disputes -> DisputeQueue | Fees -> FeeConfig"
  row
    search "Search merchants"
    right
    select "Status: Pending"
  table "Business | Country | Submitted | Status" -> MerchantReview
    row "Acme Traders | Nigeria | Sep 12 | Pending"
    row "Kilimanjaro Foods | Kenya | Sep 14 | Pending"

screen MerchantReview "Review one merchant's verification"
  navbar "Admin"
  sidebar "Onboarding -> OnboardingQueue | Transactions -> TransactionMonitor | Payouts -> PayoutRuns | Disputes -> DisputeQueue | Fees -> FeeConfig"
  card "Acme Traders"
    text "Country: Nigeria"
    text "ID document: view uploaded document"
    badge "Pending" warning
  row
    button "Reject" danger
    right
    button "Approve" primary
  row
    right
    button "Suspend merchant" danger

screen TransactionMonitor "All transactions across merchants"
  navbar "Admin"
  sidebar "Onboarding -> OnboardingQueue | Transactions -> TransactionMonitor | Payouts -> PayoutRuns | Disputes -> DisputeQueue | Fees -> FeeConfig"
  row
    search "Search transactions"
    right
    select "Merchant: All"
    select "Status: All"
  table "Merchant | Amount | Method | Status | Flag"
    row "Acme Traders | 4,500 NGN | Mobile Money | Completed | -"
    row "Kilimanjaro Foods | 92,000 KES | Card | Completed | Review"

screen PayoutRuns "Weekly payout runs"
  navbar "Admin"
  sidebar "Onboarding -> OnboardingQueue | Transactions -> TransactionMonitor | Payouts -> PayoutRuns | Disputes -> DisputeQueue | Fees -> FeeConfig"
  card "Next scheduled run | Friday | 3 merchants"
  row
    right
    button "Trigger payout run now" primary
  table "Merchant | Amount | Status"
    row "Acme Traders | 124,548 NGN | Paid"
    row "Kilimanjaro Foods | 88,120 KES | Paid"

screen DisputeQueue "Disputes needing mediation"
  navbar "Admin"
  sidebar "Onboarding -> OnboardingQueue | Transactions -> TransactionMonitor | Payouts -> PayoutRuns | Disputes -> DisputeQueue | Fees -> FeeConfig"
  table "Transaction | Customer | Reason | Status" -> DisputeReview
    row "TXN-1041 | Jane K. | Item not received | Open"

screen DisputeReview "Mediate a dispute"
  navbar "Admin"
  sidebar "Onboarding -> OnboardingQueue | Transactions -> TransactionMonitor | Payouts -> PayoutRuns | Disputes -> DisputeQueue | Fees -> FeeConfig"
  card "Dispute on TXN-1041"
    text "Reason: Item not received"
    textarea "Resolution notes"
  row
    button "Reject dispute" danger
    right
    button "Resolve in customer's favor" primary

screen FeeConfig "Platform fee configuration"
  navbar "Admin"
  sidebar "Onboarding -> OnboardingQueue | Transactions -> TransactionMonitor | Payouts -> PayoutRuns | Disputes -> DisputeQueue | Fees -> FeeConfig"
  card "Transaction fee"
    input "Fee percentage"
    row
      right
      button "Save" primary

flow "Onboarding review"
  role "Platform Admin"
  description "An admin reviews and approves or rejects merchant onboarding applications"
  OnboardingQueue
  MerchantReview

flow "Platform operations"
  role "Platform Admin"
  description "An admin monitors transactions, runs payouts, mediates disputes and sets fees"
  TransactionMonitor
  PayoutRuns
  DisputeQueue
  DisputeReview
  FeeConfig
