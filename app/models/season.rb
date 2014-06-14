class Season < ActiveRecord::Base
  has_many :fixtures, dependent: :destroy
  has_many :races, through: :fixtures

  accepts_nested_attributes_for :fixtures, reject_if: :all_blank, allow_destroy: true
  validates :name, presence: true
end
