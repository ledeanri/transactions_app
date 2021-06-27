class Withdrawal < ApplicationRecord
  belongs_to :account

  validates :account, presence: true
  validates :amount, presence: true, numericality: true
  validates :transaction_number, presence: true, uniqueness: true
  validates_associated :account
  #validates_with :account_amount_greater_than_or_equal_to_zero

  accepts_nested_attributes_for :account

  before_validation :load_defaults

  #def account_amount_greater_than_or_equal_to_zero
  #  account.
  #end

  def load_defaults
    if self.new_record?
      self.transaction_number = SecureRandom.uuid
    end
  end
end
