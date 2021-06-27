class Deposit < ApplicationRecord
  belongs_to :account

  validates :account, presence: true
  validates :amount, presence: true, numericality: true
  validates :transaction_number, presence: true, uniqueness: true

  before_validation :load_defaults

  def load_defaults
    if self.new_record?
      self.transaction_number = SecureRandom.uuid
    end
  end
end
