class RateCategory < ApplicationRecord
  has_many :rates, dependent: :destroy
  accepts_nested_attributes_for :rates,
    allow_destroy: true
  validates_associated :rates

  validates :name, presence: true
  validates :from_age, :to_age, presence: true, numericality: true
  validate :age_range

  def age_range
    if from_age && to_age && from_age >= to_age
      errors.add(:from_age, '"Från och med ålder" måste infalla före "till-ålder"')
    end
  end
end