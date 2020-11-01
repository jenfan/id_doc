class ClassificationType < ApplicationRecord
  scope :base, -> { where(base: true) }
  scope :manual, -> { where(base: false) }
end
