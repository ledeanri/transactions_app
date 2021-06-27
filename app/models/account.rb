class Account < ApplicationRecord
  belongs_to :user

  validates :user, presence: true
  validates :amount, presence: true, numericality: true
  validates :account_number, presence: true, uniqueness: true

  has_many :transfers
  has_many :deposits
  has_many :withdrawals
  has_many :balances

  before_validation :load_defaults

  def load_defaults
      if self.new_record?
        self.amount = 0.00
        self.account_number = SecureRandom.uuid
      end
  end

  def to_s
    account_number
  end
end
