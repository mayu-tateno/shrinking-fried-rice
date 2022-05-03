class FriedRice
  include ActiveModel::Model
  include ActiveModel::Attributes
  extend ActiveModel::Translation

  attribute :amount, :integer
  attribute :minute, :integer
  attribute :second, :integer

  validates :amount, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 800 }
  validates :minute, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :second, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than: 60 }
end