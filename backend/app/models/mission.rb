class Mission < ActiveRecord::Base
  has_many :astronauts
  accepts_nested_attributes_for :astronauts
end
