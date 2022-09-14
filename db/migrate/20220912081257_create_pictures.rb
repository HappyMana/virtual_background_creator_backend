class CreatePictures < ActiveRecord::Migration[6.0]
  def change
    create_table :pictures do |t|
      t.binary :binary_data, :limit => 5.megabyte
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
