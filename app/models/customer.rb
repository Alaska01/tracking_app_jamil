class Customer < ApplicationRecord
  has_many :movements, dependent: :destroy
  accepts_nested_attributes_for :movements
  before_save :add_uniq_id

  def self.import(file)
    CSV.foreach(file.path,  headers:true) do |row|
      Customer.create! row.to_hash
    end
  end

  private
    def add_uniq_id
      id = SecureRandom.hex(10).upcase
      self.uniq_id = id
    end
end
