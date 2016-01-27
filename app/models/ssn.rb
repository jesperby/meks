# Refugee has date_of_birth and ssn_extension attributes, `ssns` are additional ones
class Ssn < ActiveRecord::Base
  belongs_to :refugee

  validates :date_of_birth, format: { with: /\A\d{4}\-\d{2}\-\d{2}\z/,
      message: "Ogiltigt datumformat, måste vara yyyy-mm-dd" }

  def full_ssn
    date_of_birth.to_s.gsub('-', '') + '-' + extension.to_s
  end
end
