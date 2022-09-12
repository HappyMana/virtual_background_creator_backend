class CreateWalletAdresses < ActiveRecord::Migration[6.0]
  def change
    create_table :wallet_adresses do |t|
      t.string :wallet_adress
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
