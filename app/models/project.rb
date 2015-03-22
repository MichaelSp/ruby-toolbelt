class Project < ActiveRecord::Base
  has_and_belongs_to_many :categories

  after_initialize :load_details

  def load_details
    LoadProjectDetails.perform_later self if downloads.blank?
  end
end
