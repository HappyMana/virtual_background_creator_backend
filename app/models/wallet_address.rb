class WalletAddress < ApplicationRecord
  belongs_to :user

  validates :wallet_address, uniqueness: { scope: :user_id }
end
