class Project < ActiveRecord::Base
  has_and_belongs_to_many :categories

  def load_details
    LoadProjectDetails.perform_later self if downloads.blank?
  end

  def github=(github)
    super if github =~ /\Ahttps?:\/\/github.com/
  end
end
