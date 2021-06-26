class Account < ApplicationRecord
  belongs_to :user

  validates :user, presence: true
  validates :amount, presence: true, numericality: true

  has_many :transfers
  has_many :deposits
  has_many :withdrawals
  has_many :balances
end
