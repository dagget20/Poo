class Compra
	attr_accessor :codigo, :nombre, :precio, :cantidad

	def initialize(codigo, nombre, precio, cantidad)
		# @codigo = codigo
		# @nombre = nombre
		# @precio = precio
		# @cantidad = cantidad
		@codigo, @nombre, @precio, @cantidad = codigo, nombre, precio , cantidad
	end

	def determinar_total
		return precio * cantidad
	end
end

class Controlador
	attr_accessor :compras

	def initialize
		@compras = []
	end

	def agregar_compra(compra)
		compras.push(compra)
	end


	def determinar_total
		total = 0.0
		for i in 0..compras.size-1
			total += compras[i].determinar_total
		end
		return total
	end

	def determinar_descuento
		total = determinar_total
		descuento = 0.0
		if total > 100
			descuento = total * 0.2
		elsif total > 50
			descuento = total * 0.1
		end

		return descuento.round(2)	
	end

	def producto_mas_caro
		posicion_caro = 0
		for i in 0..compras.size - 1
			if compras[i].precio > compras[posicion_caro].precio
				posicion_caro = i
			end
		end
		return compras[posicion_caro].nombre
	end
end

compra1 = Compra.new('2001', 'celular',1500.0, 2)
compra2 = Compra.new('2002', 'case', 50.0, 2)
compra3 = Compra.new('2003', 'protector de pantalla', 21.0, 1)
compra4 = Compra.new('2005', 'limpiador', 10.0, 1)

carrito =  Controlador.new
carrito.agregar_compra(compra1)
carrito.agregar_compra(compra2)
carrito.agregar_compra(compra3)
carrito.agregar_compra(compra4)

puts carrito.determinar_total
puts carrito.determinar_descuento
puts carrito.producto_mas_caro