class Cliente
	attr_accessor  :dni, :nombre, :direccion
	def initialize(dni, nombre, direccion)
		@dni, @nombre, @direccion = dni, nombre, direccion
	end
end

class Venta
	attr_accessor :numero_doc, :valor_venta, :cliente

	def initialize(numero_doc, valor_venta, cliente)
		@numero_doc = numero_doc
		@valor_venta = valor_venta
		@cliente = cliente
	end

	def calculo_igv
		igv = valor_venta * 0.18
		return igv.round(2)
	end

	def calculo_total_venta
		total = valor_venta + calculo_igv
		return total.round(2)
	end
end

class Tienda
	attr_accessor :ventas

	def initialize
		@ventas = []
	end

	def agregar_ventas(venta)
		ventas.push(venta)
	end

	def calcular_totales
		total_valores = 0.0
		total_igv = 0.0
		total_ventas = 0.0

		for i in 0..ventas.size - 1
			total_valores += ventas[i].valor_venta
			total_igv += ventas[i].calculo_igv
			total_ventas += ventas[i].calculo_total_venta
		end

		puts "El total en valor de venta es: S/." + total_valores.to_s
		puts "El total igv de venta es: S/." + total_igv.to_s
		puts "El total en ventas es: S/." + total_ventas.to_s
	end

	def mayor_venta
		mayor = 0
		for i in 0..ventas.size - 1
			if ventas[i].calculo_total_venta > ventas[mayor].calculo_total_venta
				mayor = i
			end
		end

		puts "El numero de documento de la mayor compra es #{ventas[mayor].numero_doc} por un total de #{ventas[mayor].calculo_total_venta} "
		puts "Los datos del cliente son, dni: " + ventas[mayor].cliente.dni.to_s + ", nombre: " + ventas[mayor].cliente.nombre + ", dirección: "  +ventas[mayor].cliente.direccion

	end
end

# CREACIÓN DE CLIENTES
cliente1 = Cliente.new(41414141, 'Steve Jobs', 'Palo Alto')
cliente2 = Cliente.new(42424242, 'Bill Gates', 'Los Cabos')
cliente3 = Cliente.new(43434343, 'Mark Zuckeberg', 'Silicon Valley')


#CREACIÓN DE VENTAS
venta1 = Venta.new('100-0001', 1000, cliente1)
venta2 = Venta.new('100-0002', 950, cliente2)
venta3 = Venta.new('100-0003', 700, cliente3)
venta4 = Venta.new('100-0004', 1500, cliente2)
venta5 = Venta.new('100-0005', 1200, cliente1)
venta6 = Venta.new('100-0006', 2000, cliente2)

#CREACION DE TIENDA
amazon = Tienda.new

#AGREGAR VENTAS
amazon.agregar_ventas(venta1)
amazon.agregar_ventas(venta2)
amazon.agregar_ventas(venta3)
amazon.agregar_ventas(venta4)
amazon.agregar_ventas(venta5)
amazon.agregar_ventas(venta6)

#CALCULO TOTALES Y MAYOR COMPRA
amazon.calcular_totales
amazon.mayor_venta
