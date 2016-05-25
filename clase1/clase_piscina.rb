class Piscina
	def initialize(largo, ancho, profundidad)
		@largo = largo
		@ancho = ancho
		@profundidad = profundidad
	end

	def calculo_cantidad_agua
		capacidad_max = @largo * @ancho * @profundidad * 1000
		cantidad_agua = capacidad_max * 0.75
		return cantidad_agua.round(2)
	end

	def calculo_cantidad_cloro
		cantidad_cloro = (calculo_cantidad_agua / 1.5) * 0.015
		return cantidad_cloro.round(2)
	end
end

piscina1 = Piscina.new(10,10,2)
puts piscina1.calculo_cantidad_agua
puts piscina1.calculo_cantidad_cloro


