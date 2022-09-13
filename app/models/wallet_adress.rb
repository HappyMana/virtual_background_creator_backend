class WalletAdress < ApplicationRecord
  belongs_to :user

  validates :wallet_adress, uniqueness: { scope: :user_id }
end
