class IftaRate < ApplicationRecord
  validates :year, presence: true
  validates :quarter, presence: true
  validates_uniqueness_of :year, scope: :quarter

  def fail!(message:)
    update(status: :error, error: message)
  end

  def complete!(rates:)
    update(status: :completed, rates: rates)
  end
end
