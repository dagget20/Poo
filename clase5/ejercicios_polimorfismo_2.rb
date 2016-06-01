class Paquete
	attr_accessor :nombre_paquete, :duracion_paquete, :costo_paquete
	def initialize(nombre_paquete,duracion_paquete, costo_paquete)
		@nombre_paquete, @duracion_paquete, @costo_paquete =nombre_paquete,duracion_paquete, costo_paquete
	end

	def describir_paquete
		puts "Nombre de paquete: " + nombre_paquete 
		puts "Duración del paquete: " + duración.to_s
		puts "Costo del paquete" + costo_paquete.to_s
	end

end

class Urbano < Paquete
	attr_accessor :hotel
	def initialize(nombre_paquete,duracion_paquete, costo_paquete,hotel)
		super(nombre_paquete,duracion_paquete, costo_paquete, hotel)
		@hotel = hotel
	end
	def describir_paquete
		super
		puts "Hotel: " + hotel
	end

end

class Historico < Paquete
	attr_accessor :tiempo, :entradas

	def initialize(nombre_paquete,duracion_paquete, costo_paquete, tiempo, entradas)
		super(nombre_paquete,duracion_paquete, costo_paquete)
		@tiempo = tiempo
		@entradas = entradas
	end

	def describir_paquete
		super
		puts "Tiempo: " + tiempo
		puts "Costo de entradas: "
	end
end

class Aventura < Paquete
	attr_accessor :aseguradora, :costo_equipos
	def initialize(nombre_paquete,duracion_paquete, costo_paquete, aseguradora, costo_equipos)
		super(nombre_paquete,duracion_paquete, costo_paquete)
		@aseguradora, @costo_equipos = aseguradora, costo_equipos
	end
end
