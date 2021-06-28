class Balance < ApplicationRecord
  belongs_to :account
  belongs_to :transfer
  belongs_to :deposit
  belongs_to :withdrawal

  scope :having_dob_between, ->(start_date, end_date) { where(dob: start_date..end_date) }
end
