class Balance < ApplicationRecord
  belongs_to :account
  belongs_to :transfer
  belongs_to :deposit
  belongs_to :withdrawal
end
