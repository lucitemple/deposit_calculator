class CalculatorInput
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :initial_deposit, :integer
  attribute :interest_rate, :float
  attribute :term, :integer
  attribute :vesting, :string

  VESTING_OPTIONS = %w[monthly quarterly annually maturity].freeze

  validates :initial_deposit,
            presence: { message: "is required" },
            numericality: { greater_than: 0, message: "must be greater than zero" }

  validates :interest_rate,
            presence: { message: "is required" },
            numericality: { greater_than: 0, message: "must be greater than zero" }

  validates :term,
            presence: { message: "is required" },
            numericality: { greater_than: 0, message: "must be greater than zero" }

  validates :vesting,
            presence: { message: "is required" },
            inclusion: {
              in: VESTING_OPTIONS,
              message: ->(object, data) { "'#{data[:value]}' is not a valid vesting period" }
            }
end
