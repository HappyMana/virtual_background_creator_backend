class CreateWalletAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :wallet_addresses do |t|
      t.string :wallet_address
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
