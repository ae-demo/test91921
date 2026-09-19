screen Checkout "Pay a merchant securely by mobile money or card"
  heading "Complete your payment"
  card "Order summary"
    text "Acme Traders"
    text "Amount: 4,500 NGN"
  select "Payment method: Mobile Money / Card"
  input "Phone number or card number"
  row
    right
    button "Pay now" primary -> Receipt

screen Receipt "Payment confirmation"
  heading "Payment successful"
  card "Receipt"
    text "Amount: 4,500 NGN"
    text "Paid to: Acme Traders"
    badge "Completed" success
  row
    right
    button "Sign in to save this receipt" -> PaymentHistory

screen PaymentHistory "Your payments across merchants"
  navbar "Customer"
  sidebar "Payment History -> PaymentHistory | Payment Methods -> PaymentMethods"
  table "Date | Merchant | Amount | Status" -> PaymentDetail
    row "Sep 18 | Acme Traders | 4,500 NGN | Completed"
    row "Sep 10 | Kilimanjaro Foods | 92,000 KES | Completed"

screen PaymentDetail "Payment detail"
  navbar "Customer"
  sidebar "Payment History -> PaymentHistory | Payment Methods -> PaymentMethods"
  card "Payment to Acme Traders"
    text "Amount: 4,500 NGN"
    text "Method: Mobile Money"
    badge "Completed" success
  row
    right
    button "Raise a dispute" -> RaiseDispute

screen RaiseDispute "Raise a dispute on this payment"
  navbar "Customer"
  sidebar "Payment History -> PaymentHistory | Payment Methods -> PaymentMethods"
  textarea "Reason for dispute"
  row
    right
    button "Submit dispute" primary -> PaymentHistory

screen PaymentMethods "Your saved payment methods"
  navbar "Customer"
  sidebar "Payment History -> PaymentHistory | Payment Methods -> PaymentMethods"
  table "Type | Details"
    row "Card | Visa •••• 4242"
    row "Mobile Money | MTN •••• 8821"
  row
    right
    button "Add payment method" primary -> AddPaymentMethod

screen AddPaymentMethod "Add a payment method"
  navbar "Customer"
  sidebar "Payment History -> PaymentHistory | Payment Methods -> PaymentMethods"
  select "Type: Mobile Money / Card"
  input "Account or card number"
  row
    right
    button "Save" primary -> PaymentMethods

flow "Checkout"
  description "A shopper pays a merchant at checkout without needing an account"
  Checkout
  Receipt

flow "My payments"
  role "Customer"
  description "A signed-in customer reviews payment history, disputes a charge and manages saved payment methods"
  PaymentHistory
  PaymentDetail
  RaiseDispute
  PaymentMethods
  AddPaymentMethod
