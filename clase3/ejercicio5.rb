class Factura
	attr_accessor :numero, :proveedor, :detalle
	
	def initialize(numero, proveedor)
		@numero, @proveedor = numero, proveedor
		@detalle = []
	end

	def agregar_detalle(item)
		detalle.push(item)
	end

	def totalizar
		total = 0.0
		for i in 0..detalle.size-1
			total += detalle[i].calcular_total
		end
		return total.round(2)
	end
end

class Detalle
	attr_accessor :item, :descripcion, :unitario, :cantidad

	def initialize(item, descripcion, unitario, cantidad)
		@item, @descripcion, @unitario, @cantidad = item, descripcion, unitario, cantidad
	end

	def calcular_total
		total = unitario * cantidad
		return total.round(2)
	end
end

factura1 =  Factura.new("001-121212", "UPC")
detalle1 = Detalle.new(1, "Libro", 123.5, 2)
detalle2 = Detalle.new(1, "Ipad Pro", 3212.75, 1)
factura1.agregar_detalle(detalle1)
factura1.agregar_detalle(detalle2)
puts "El total de la factura #{factura1.numero} es S/.#{factura1.totalizar.to_s}" 