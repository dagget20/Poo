class Tienda
	attr_accessor :ventas
	def initialize
		@ventas = []
	end

	def agregar_ventas(venta)
		ventas.push(venta)
	end

	def calcular_totales
		total_valor = 0.0
		total_descuento = 0.0
		total_igv = 0.0
		total_ventas = 0.0

		for i in 0..ventas.size-1
			total_valor += ventas[i].venta
			total_descuento += ventas[i].descuento
			total_igv += ventas[i].calcular_igv
			total_ventas += ventas[i].calcular_igv
		end
		puts "Total valor: " + total_valor.to_s
		puts "Total descuento: " + total_descuento.to_s
		puts "Total igv: " + total_igv.to_s
		puts "Total valor: " + total_ventas.to_s
	end

	def mejor_ciente
		mejor = 0
		for i in 0..ventas.size-1
			if ventas[i] > ventas[mejor]
				mejor = i
			end
		end
		puts "El mejor cliente es: " + ventas[i].cliente.nombre
	end

	def mostrar_ventas
		for i in 0..ventas.size-1
			print ventas[i].cliente.codigo + " - "
			print ventas[i].cliente.nombre + " - "
			print ventas[i].cliente.codigo + " - "
			print ventas[i].cliente.codigo + " - "
		end
	end

end

class Venta
	attr_accessor :cliente, :fecha, :venta, :descuento

	def initialize(cliente, fecha, venta, descuento)
		@cliente, @fecha, @venta, @descuento = cliente, fecha, venta, descuento
	end

	def calcular_igv
		igv = valor - descuento
		return igv.round(2)
	end

	def calcular_total
		total =  valor - descuento + igv
		return total.round(2)
	end

end

class Cliente
	attr_accessor :codigo, :nombre, :direccion 

	def initalize(codigo, nombre, direccion)
		@codigo, @nombre, @direccion = codigo, nombre, direccion
	end
end