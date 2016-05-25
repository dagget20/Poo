class Persona
	attr_accessor :nombre, :dni

	def initialize(nombre, dni)
		@nombre, @dni = nombre, dni
	end

	def identificarse(direccion)
		casa =  Casa.new(direccion)
		"Mi nombre es #{nombre}, con dni #{dni}. " + casa.vivoen
	end
end

class Casa
	attr_accessor :direccion

	def initialize(direccion)
		@direccion = direccion
	end

	def vivoen
		"Vivo en #{direccion}"
	end
end

persona1 = Persona.new("Piccoro", "6546354")
puts persona1.identificarse("namek")