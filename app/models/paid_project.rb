class PaidProject < ApplicationRecord
  belongs_to :organization
  validates :project_name,presence: true, uniqueness: true
  validates :start_date,:completion_date, presence: true
 
end
