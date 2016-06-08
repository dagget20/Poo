class Empresa
	attr_accessor :clientes
	def initialize
		@clientes = []
	end

	def agregar_clientes(cliente)
		clientes.push(cliente)
	end
end

class Cliente
	attr_accessor :nombre
	def initialize(nombre)
		@nombre = nombre
	end
end

cliente1 = Cliente.new("Han Solo")
cliente2 = Cliente.new("Chewbacca")
cliente3 = Cliente.new("Luke Skywalker")

empresa = Empresa.new

empresa.agregar_clientes(cliente1)
empresa.agregar_clientes(cliente2)
empresa.agregar_clientes(cliente3)

empresa.clientes.each do |cliente|
	puts cliente.nombre
end

