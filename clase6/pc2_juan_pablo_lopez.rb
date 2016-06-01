class Cliente
	attr_accessor :nombre, :dni
	def initialize(nombre, dni)
		@nombre, @dni = nombre, dni
	end

	def calcular_factores
		factores = 100.0 * (3.0/10.0)
		return factores.round(2)
	end

	def presentarse
		puts "Los datos del cliente con Número de DNI: #{dni}, son lo siguientes:"
		puts "Bombre: " + nombre
		puts "DNI: " + dni.to_s
	end
end

class Platinum < Cliente
	attr_accessor :numero_autos
	def initialize(nombre, dni, numero_autos)
		super(nombre, dni)
		@numero_autos = numero_autos
	end

	def presentarse
		super
		puts "Número_autos: " + numero_autos.to_s
		puts "Tipo de cliente: Platinum"
	end

	def calcular_factores
		factores = 0.9 * (numero_autos + 1.0) / numero_autos
		return factores.round(2)
	end
end

class Oro < Cliente
	attr_accessor :numero_visitas
	def initialize(nombre, dni, numero_visitas)
		super(nombre, dni)
		@numero_visitas = numero_visitas
	end

	def presentarse
		super
		puts "Número de visitas: " + numero_visitas.to_s
		puts "Tipo de cliente: Oro"
	end

	def calcular_factores
		factores = 1.0 * (numero_visitas) / (numero_visitas + 1.0)
		return factores.round(2)
	end
end

class Plata < Cliente
	attr_accessor :numero_autos
	def initialize(nombre, dni)
		super(nombre, dni)
	end

	def presentarse
		super
		puts "Tipo de cliente: Plata"
	end

	def calcular_factores
		super
	end

end

class Empresa
	attr_accessor :clientes

	def initialize
		@clientes = []
	end

	def agregar_clientes(cliente)
		clientes.push(cliente)
	end	

	def total_factores
		total = 0.0

		for i in 0..clientes.size-1
			total += clientes[i].calcular_factores
		end

		return total.round(2)
	end

	def cantidad_clientes
		return clientes.size
	end

	def buscar_cliente(dni)
		indice = -1
		for i in 0..clientes.size-1
			if clientes[i].dni == dni
				indice = i
			end
		end

		if indice < 0
			puts "cliente no existe"
			return 0
		end

		clientes[indice].presentarse
	end
end

#Crear Clientes
cliente1 = Platinum.new("Bruce Wayne", 40404040, 4)
cliente2 = Oro.new("Clark Kent", 41414141, 4)
cliente3 = Plata.new("Peter Parker", 42424242)
cliente4 = Platinum.new("Steve Rogers", 43434343,2)
cliente5 = Oro.new("Dr Strange", 44444444, 5)
cliente6 = Plata.new("Dr Doom", 45454545)

#Crear Controladora
empresa1 = Empresa.new

#Agregar Clientes
empresa1.agregar_clientes(cliente1)
empresa1.agregar_clientes(cliente2)
empresa1.agregar_clientes(cliente3)
empresa1.agregar_clientes(cliente4)
empresa1.agregar_clientes(cliente5)
empresa1.agregar_clientes(cliente6)

#Prueba
puts "La suma total de factores de todos los clientes es: " + empresa1.total_factores.to_s
puts "La cantidad de clientes es: " + empresa1.cantidad_clientes.to_s
puts
empresa1.buscar_cliente(42424242)
puts
empresa1.buscar_cliente(40404040)
puts
empresa1.buscar_cliente(41414141)
puts
empresa1.buscar_cliente(45454545)
puts
empresa1.buscar_cliente(47474747)
