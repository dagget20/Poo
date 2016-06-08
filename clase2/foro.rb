class Carro
	attr_accessor :marca, :modelo, :placa, :motor
	def initialize(marca, modelo, placa, capacidad)
		@marca, @modelo, @placa = marca, modelo, motor
		@motor = Motor.new(capacidad)
	end
end

class Motor
	attr_accessor :capacidad

	def initialize(capacidad)
		@capacidad = capacidad
	end

	def encender
		puts "run run"
	end

	def apagar
		puts "motor apagado"
	end

	def descripcion
		puts "Motor de #{capacidad}L"
	end
end

carro1 = Carro.new("Toyota", "Yaris", "AEO-123", 1.3)
carro1.motor.descripcion

