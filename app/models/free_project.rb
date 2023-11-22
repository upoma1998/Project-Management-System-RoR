class FreeProject < ApplicationRecord
    belongs_to :organization
    validates :project_name,presence: true, uniqueness: true
    validates :start_date, presence: true
    validates :completion_date, presence: true
  end