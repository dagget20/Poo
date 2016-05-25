class Trabajador
	attr_accessor :codigo, :nombres, :tipo, :horas, :precio_hora, :prod_vendidos
	def initialize(codigo, nombres, tipo, horas, precio_hora, prod_vendidos)
		@codigo, @nombres, @tipo, @horas, @precio_hora, @prod_vendidos = codigo, nombres, tipo, horas, precio_hora, prod_vendidos
	end

	def determinar_sueldo
		sueldo = 0.0
		case tipo
			when 'fijo'
				sueldo = horas * precio_hora
			when 'contratado'
				if prod_vendidos < 50
					sueldo = 100.0
				elsif prod_vendidos > 50 and prod_vendidos <= 100
					sueldo = 150.0
				else
					sueldo = 200.0
				end	
		end
		return sueldo.round(2)
	end
end

class Controladora
	attr_accessor :trabajadores

	def initialize
		@trabajadores = []
	end

	def agregar_trabajador(trabajador)
		trabajadores.push(trabajador)
	end

	def calcular_total_sueldo
		planilla = 0.0
		for i in 0..trabajadores.size-1
			planilla += trabajadores[i].determinar_sueldo
		end
		return planilla
	end

	def cantidad_pagos
		return trabajadores.size
	end

	def sueldo_promedio
		promedio =  calcular_total_sueldo / cantidad_pagos
		return promedio
	end
end

trabajador1 = Trabajador.new('t0001', 'Steve Rogers', 'fijo', 48, 7.5, 140)
trabajador2 = Trabajador.new('t0002', 'Tony Stark', 'fijo', 36, 10.5, 140)
trabajador3 = Trabajador.new('t0003', 'Natasha Romanov', 'contratado', 40, 7.5, 350)
trabajador4 = Trabajador.new('t0004', 'Peter Parker', 'contratado', 45, 7.5, 100)

planilla = Controladora.new()
planilla.agregar_trabajador(trabajador1)
planilla.agregar_trabajador(trabajador2)
planilla.agregar_trabajador(trabajador3)
planilla.agregar_trabajador(trabajador4)

puts planilla.calcular_total_sueldo
puts planilla.cantidad_pagos
puts planilla.sueldo_promedio