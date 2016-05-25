class Venta

	attr_accessor :ventas, :meses

	def initialize(ventas, meses)
		@ventas = ventas
		@meses = meses
	end

	def calcular_mayor_venta
		posicion = 0
		for i in 0..ventas.size - 1
			if ventas[i] > ventas[posicion]
				posicion = i
			end
		end
		return @meses[posicion]
	end

	def calcular_menor_venta
		posicion = 0
		for i in 0..ventas.size - 1
			if ventas[i] < ventas[posicion]
				posicion = i
			end
		end
		return @meses[posicion]
	end

	def calcular_promedio
		suma = 0.0
		for i in 0..ventas.size - 1
			suma += ventas[i]
		end
		promedio = suma / ventas.size

		return promedio.round(2)
	end

	def ventas_mayor
		mayores = []
		for i in 0..ventas.size - 1
			if ventas[i] > calcular_promedio
				mayores.push(meses[i])
			end
		end

		return mayores
	end

end

ventas1 = Venta.new([209.15, 390.54, 283.34, 398.98, 495.34],["Enero", "Febrero", "Marzo", "Abril", "Mayo"])

puts "Mes de mayor venta " + ventas1.calcular_mayor_venta.to_s
puts "Mes de mayor venta " + ventas1.calcular_menor_venta.to_s
puts "Promedio de ventas " + ventas1.calcular_promedio.to_s
print "Meses de mayor venta " + ventas1.ventas_mayor.to_s
puts