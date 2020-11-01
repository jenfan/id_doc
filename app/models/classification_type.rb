class ClassificationType < ApplicationRecord
  scope :base, -> { where.not(user_label: true) }
  scope :user_label, -> { where(user_label: true) }
end
