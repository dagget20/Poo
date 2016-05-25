class Auto

	def initialize(marca, modelo, año, placa)
		@marca = marca
		@modelo = modelo
		@año = año
		@placa = placa
	end

	def encender
		"El auto de marca: #{@marca} está encendiendo..."
	end

	def avanzar
		"Estoy avanzando..."
	end

	def parar
		"Voy a parar..."
	end

end


auto1 = Auto.new('Honda', 'CRV', 2015, 'BOR-890')
auto2 = Auto.new('Toyota', 'Corolla', 2015, 'BAW-780')

puts auto1.encender
puts auto1.avanzar
puts auto1.parar
puts
puts auto2.encender
puts auto2.avanzar
puts auto2.parar