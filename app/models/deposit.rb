class Deposit < ApplicationRecord
  belongs_to :account

  validates :account, presence: true
  validates :amount, presence: true, :numericality => { :greater_than_or_equal_to => 0 }
  validates :transaction_number, presence: true, uniqueness: true

  accepts_nested_attributes_for :account

  before_validation :load_defaults

  def load_defaults
    if self.new_record?
      self.transaction_number = SecureRandom.uuid
    end
  end
end
