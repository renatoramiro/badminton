class Modalidade < ActiveRecord::Base
  attr_accessible :tipo
	has_and_belongs_to_many :atletas
end
