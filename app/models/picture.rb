class Picture < ApplicationRecord
  belongs_to :user

  validates :binary_data, uniqueness: { scope: :user_id }
end
