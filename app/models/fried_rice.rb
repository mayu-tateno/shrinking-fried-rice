class FriedRice
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :amount, :integer
  attribute :minute, :integer
  attribute :second, :integer

  validates :amount, presence: true
  validates :minute, presence: true
  validates :second, presence: true
end