class Cliente
	attr_accessor :mes, :monto, :tipo_pago

	def initialize(mes, monto, tipo)
		@mes, @monto, @tipo = mes, monto, tipo
	end

	def determinar_pago
		case tipo_pago
		
		when 'tarjeta'
			return (monto*1.04).round(2)
		else
			return monto.round(2)
		end
	end
end

class Administrador
	attr_accessor :clientes

	def initialize
		@clientes = []
	end

	def agregar_cliente(cliente)
		clientes.push(cliente)
	end

	def calcular_total_pagado
		total = 0.0
		for i in 0..clientes.size - 1
			total += clientes[i].determinar_pago
		end
		return total
	end

	def calcular_pago_tarjeta
		total = 0.0
		for i in 0..clientes.size - 1
			if clientes[i].tipo_pago == 'tarjeta'
				total += clientes.determinar_pago
			end
		end
		return total
	end

end

cliente1 = Cliente.new('Enero', 200, 'tarjeta')
cliente2 = Cliente.new('Enero', 200, 'tarjeta')
cliente3 = Cliente.new('Enero', 200, 'tarjeta')

admin = Administrador.new
admin.agregar_cliente(cliente1)
admin.agregar_cliente(cliente2)
admin.agregar_cliente(cliente3)

puts admin.calcular_total_pagado
puts admin.calcular_pago_tarjeta