class IftaRate < ApplicationRecord
  has_one_attached :file

  def fail!(message:)
    update(status: :error, error: message)
  end

  def complete!(rates:)
    update(status: :completed, rates: rates, error: "")
  end
end
