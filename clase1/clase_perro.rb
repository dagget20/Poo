class Perro
	def initialize(nombre, raza, peso, color)
		@nombre = nombre
		@raza = raza
		@peso = peso
		@color = color
	end

	def correr
		"Estoy corriendo"
	end

	def ladrar
		"Guau Guau!"
	end

	def morder
		"Grrrr grrrr"
	end

	def presentarse
		"Hola soy #{@nombre} el primer perro raza #{@raza} que habla, y peso #{@peso.to_s}Kg."
	end
end

perro1 = Perro.new('Pongo', 'dalmata', 20, 'Blanco con manchas')

puts perro1.correr
puts perro1.ladrar
puts perro1.morder
puts perro1.presentarse
