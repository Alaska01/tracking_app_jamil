class Customer < ApplicationRecord
  has_many :movements, dependent: :destroy
  accepts_nested_attributes_for :movements
end
