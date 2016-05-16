class Astronaut < ActiveRecord::Base
  belongs_to :mission
  belongs_to :space_station

  validates :name, presence: {message: "Necessário preencher o nome"}
  #validates :birthdate, presence: {message: "Data de nascimento necessária"}

end
