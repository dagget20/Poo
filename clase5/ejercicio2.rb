class Empleado
	attr_accessor :codigo, :nombre, :apellido
	def initialize(codigo, nombre, apellido)
		@codigo, @nombre, @apellido = codigo, nombre, apellido
	end

	def calcualar_sueldo
	end
end

class Contratado < Empleado
	attr_accessor :tarifa_hora, :horas_trabajadas
	
	def initialize(codigo, nombre, apellido, tarifa_hora, horas_trabajadas)
		super(codigo, nombre, apellido)
		@tarifa_hora = tarifa_hora
		@horas_trabajadas =  horas_trabajadas
	end

	def calcular_sueldo
		sueldo = tarifa_hora * horas_trabajadas
		return sueldo.round(2)
	end

end

class Estable < Empleado
	attr_accessor :tipo_tarifa, :dias_trabajados
	def initialize(codigo, nombre, apellido, tipo_tarifa, dias_trabajados)
		super(codigo, nombre, apellido)
		@tipo_tarifa = tipo_tarifa
		@dias_trabajados =  dias_trabajados
	end

	def calcular_sueldo
		case tipo_tarifa
			when "A"
				tarifa = 10
			when "B"
				tarifa = 40
		end
		sueldo = tarifa * dias_trabajados
		return sueldo.round(2)
	end
end

class Empresa
	attr_accessor :trabajadores

	def initialize
		@trabajadores = []
	end

	def agregar_trabajadores(trabajador)
		trabajadores.push(trabajador)
	end

	def listar
		puts "Relación de empleados"
		puts "----------------------------------"
		for i in 0..trabajadores.size-1
			print trabajadores[i].codigo.to_s + " "
			print trabajadores[i].nombre + " "
			print trabajadores[i].apellido + " "
			print trabajadores[i].calcular_sueldo.to_s
			puts
		end
	end

end


trabajador1 =  Contratado.new(20150001, 'Ash', 'Ketchup', 12, 40)
trabajador2 =  Contratado.new(20150002, 'Misty', 'Ketchup', 10, 35)
trabajador3 =  Estable.new(20150003, 'Oliver', 'Atom', "A", 24)
trabajador4 =  Estable.new(20150004, 'Steve', 'Hyuga', "B", 18)

empresa = Empresa.new
empresa.agregar_trabajadores(trabajador1)
empresa.agregar_trabajadores(trabajador2)
empresa.agregar_trabajadores(trabajador3)
empresa.agregar_trabajadores(trabajador4)

empresa.listar

