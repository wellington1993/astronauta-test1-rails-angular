class Astronaut < ActiveRecord::Base
  belongs_to :mission
  belongs_to :space_station
end
