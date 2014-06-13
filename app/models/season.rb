class Season < ActiveRecord::Base
  has_many :fixtures
  accepts_nested_attributes_for :fixtures, reject_if: :all_blank, allow_destroy: true
  validates :name, presence: true
end
