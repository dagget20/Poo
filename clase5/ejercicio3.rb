class Trabajador
	attr_accessor :dni, :nombre
	def initialize(dni, nombre)
		 @dni, @nombre = dni, nombre
	end

	def calcular_sueldo
	end
end

class Obrero < Trabajador
	attr_accessor :horas_trabajadas, :horas_extras
	def initialize(dni, nombre, horas_trabajadas, horas_extras)
		super(dni, nombre)
		@horas_trabajadas, @horas_extras = horas_trabajadas, horas_extras
	end

	def calcular_sueldo
		sueldo = horas_trabajadas * 30 + horas_extras * 40
		return sueldo.round(2)
	end
end

class Adminitrativo < Trabajador
	attr_accessor :sueldo_base, :ventas
	def initialize(dni, nombre, sueldo_base, ventas)
		super(dni, nombre)
		@sueldo_base = sueldo_base
		@ventas = ventas
	end

	def calcular_sueldo
		sueldo = sueldo_base + ventas * 0.05
		return sueldo.round(2)
	end
end

class Tiempo_parcial < Trabajador
	attr_accessor :sueldo_base
	def initialize(dni, nombre, sueldo_base)
		super(dni, nombre)
		@sueldo_base = sueldo_base
	end

	def calcular_sueldo
		sueldo = sueldo_base - sueldo_base * 0.06
		return sueldo.round(2)
	end
end

class Empresa
	attr_accessor :empleados

	def initialize
		@empleados = []
	end

	def agregar_empleado(empleado)
		empleados.push(empleado)
	end

	def calcular_cantidad_trabajadores
		return empleados.size
	end

	def calcular_total_sueldos
		salarios = 0.0
		for i in 0..empleados.size-1
			salarios += empleados[i].calcular_sueldo
		end
		return salarios.round(2)
	end

	def consultasueldo(dni)
		sueldo = 0
		for i in 0..empleados.size-1
			if dni == empleados[i].dni
				sueldo = empleados[i].calcular_sueldo
			end
		end

		if sueldo != 0
			return sueldo.round(2)
		else
			puts "No existe ese empleado"
		end
	end
end


empleado1 = Obrero.new(40404040, 'Bob El Constructor', 40, 20)
empleado2 = Adminitrativo.new(41414141, 'Mario Mario', 2000, 5000)
empleado3 = Tiempo_parcial.new(42424242, 'Luigi Mario', 2500)
empleado4 = Obrero.new(43434343, 'Bobby El Destructor', 30, 15)

empresa =  Empresa.new
empresa.agregar_empleado(empleado1)
empresa.agregar_empleado(empleado2)
empresa.agregar_empleado(empleado3)
empresa.agregar_empleado(empleado4)

puts "Cantidad de empleados " + empresa.calcular_cantidad_trabajadores.to_s
puts "Total salarios a pagar S/. " + empresa.calcular_total_sueldos.to_s
puts "El salario del empleado con dni 40404040 es S/. " + empresa.consultasueldo(42424242).to_s

