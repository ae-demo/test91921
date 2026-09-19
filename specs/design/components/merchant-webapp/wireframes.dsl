screen Onboarding "Complete your business verification to start accepting payments"
  heading "Business Verification"
  input "Business name"
  select "Country (Nigeria, Kenya, Ghana)"
  input "ID document URL"
  row
    right
    button "Submit for review" primary -> Dashboard

screen Dashboard "Merchant performance summary"
  navbar "Merchant"
  sidebar "Dashboard -> Dashboard | Checkout -> CheckoutIntegration | Transactions -> Transactions | Payouts -> Payouts | Payout Settings -> PayoutSettings"
  row
    card "Sales this week | 128,400 | NGN"
    card "Platform fees | 3,852 | NGN"
    card "Next payout | 124,548 | scheduled Friday"
  chart "Sales over time" 600x260
  table "Recent transactions | Amount | Status"
    row "TXN-1042 | 4,500 NGN | Completed"
    row "TXN-1041 | 1,200 KES | Failed"

screen CheckoutIntegration "Hosted checkout link and API integration"
  navbar "Merchant"
  sidebar "Dashboard -> Dashboard | Checkout -> CheckoutIntegration | Transactions -> Transactions | Payouts -> Payouts | Payout Settings -> PayoutSettings"
  card "Hosted checkout link"
    text "https://pay.example.com/m/acme-store"
    button "Copy link"
  card "API integration"
    text "Use this key to create checkout sessions from your own site."
    text "sk_live_••••••••"
    button "Regenerate key"

screen Transactions "All transactions for your business"
  navbar "Merchant"
  sidebar "Dashboard -> Dashboard | Checkout -> CheckoutIntegration | Transactions -> Transactions | Payouts -> Payouts | Payout Settings -> PayoutSettings"
  row
    search "Search transactions"
    right
    select "Status: All"
  table "Date | Customer | Amount | Method | Status" -> TransactionDetail
    row "Sep 18 | +234 801... | 4,500 NGN | Mobile Money | Completed"
    row "Sep 17 | +254 722... | 1,200 KES | Card | Failed"

screen TransactionDetail "Transaction details"
  navbar "Merchant"
  sidebar "Dashboard -> Dashboard | Checkout -> CheckoutIntegration | Transactions -> Transactions | Payouts -> Payouts | Payout Settings -> PayoutSettings"
  card "Transaction TXN-1042"
    text "Amount: 4,500 NGN"
    text "Method: Mobile Money"
    badge "Completed" success
  row
    right
    button "Issue refund" danger

screen PayoutSettings "Payout bank or mobile wallet configuration"
  navbar "Merchant"
  sidebar "Dashboard -> Dashboard | Checkout -> CheckoutIntegration | Transactions -> Transactions | Payouts -> Payouts | Payout Settings -> PayoutSettings"
  card "Payout account"
    select "Account type: Bank / Mobile Wallet"
    input "Account number or wallet number"
    row
      right
      button "Save" primary

screen Payouts "Weekly payout history"
  navbar "Merchant"
  sidebar "Dashboard -> Dashboard | Checkout -> CheckoutIntegration | Transactions -> Transactions | Payouts -> Payouts | Payout Settings -> PayoutSettings"
  table "Scheduled for | Amount | Status"
    row "Sep 19 | 124,548 NGN | Paid"
    row "Sep 12 | 98,340 NGN | Paid"

flow "Merchant onboarding"
  role "Merchant"
  description "A merchant signs up and submits verification details for review"
  Onboarding
  Dashboard

flow "Manage payments"
  role "Merchant"
  description "A merchant tracks sales, integrates checkout, manages payouts and issues refunds"
  Dashboard
  CheckoutIntegration
  Transactions
  TransactionDetail
  PayoutSettings
  Payouts
