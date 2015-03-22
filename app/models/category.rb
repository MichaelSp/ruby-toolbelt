class Category < ActiveRecord::Base
  acts_as_nested_set
  has_and_belongs_to_many :projects

  alias_attribute :categories, :children
end
