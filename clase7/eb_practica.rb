class Solicitante
	attr_accessor :tipo_doc, :documento, :nombre, :apellido, :edad, :ingreso
	def initialize(tipo_doc, documento, nombre, apellido, edad, ingreso)
		@tipo_doc, @documento, @nombre, @apellido, @edad, @ingreso = tipo_doc, documento, nombre, apellido, edad, ingreso
		raise ArgumentError, "La edad no puede ser negativa" if edad < 0
	end

	def calcular_puntuacion
		puntuacion = ingreso / 100.0 + edad
		return puntuacion.round(2)
	end

	def calcular_estado
		if calcular_puntuacion > 60
			"APROBADO"
		else
			"DESAPROBADO"
		end
	end
end

class Turista < Solicitante
	attr_accessor :dependientes, :bolsa_viajes
	
	def initialize(tipo_doc, documento, nombre, apellido, edad, ingreso, dependientes, bolsa_viajes)
		super(tipo_doc, documento, nombre, apellido, edad, ingreso)
		@dependientes, @bolsa_viajes = dependientes, bolsa_viajes
	end

	def calcular_puntuacion
		puntuacion = super
		if dependientes
			puntuacion += 7
		end

		if bolsa_viajes
			puntuacion +=7
		end

		return puntuacion
	end
end

class Trabajador < Solicitante
	attr_accessor :contrato
	def initialize(tipo_doc, documento, nombre, apellido, edad, ingreso, contrato)
		super(tipo_doc, documento, nombre, apellido, edad, ingreso)
		@contrato = contrato
	end

	def calcular_puntuacion
		puntuacion = super

		if contrato
			puntuacion +=15
		end
		return puntuacion
	end
end

class Residente < Solicitante
	attr_accessor :habla_ingles
	def initialize(tipo_doc, documento, nombre, apellido, edad, ingreso, habla_ingles)
		super(tipo_doc, documento, nombre, apellido, edad, ingreso, contrato)
		@habla_ingles = habla_ingles
	end

	def calcular_puntuacion
		puntuacion = super

		if habla_ingles
			puntuacion +=20
		end
		return puntuacion
	end
end

class Administrador
	attr_accessor :solicitantes
	def initialize
		@solicitantes = solicitantes
	end

	def buscar_solicitante(numero_documento)
		for i in 0..solicitantes.size-1
			if solicitantes[i].documento == numero_documento
				return solicitantes[i]
			end
		end
		return "Solictante no encontrado"
	end

	def listar
		puts "======================================================"
		print "Tipo"
		print " Número"
		print " Nombre"
		print " Apellido"
		print " Edad"
		print " Ingreso"
		print " Puntaje"
		print " Estado"
		puts "======================================================"
		for i in 0..solicitantes.size-1
			print solicitantes[i].tipo_doc
			print solicitantes[i].documento
			print solicitantes[i].nombre
			print solicitantes[i].apellido
			print solicitantes[i].edad
			print solicitantes[i].ingreso
			print solicitantes[i].calcular_puntuacion
			print solicitantes[i].calcular_estado
		end
	end

	def agregar_solicitante(type, *args)
		solicitantes << create_solicitante(type,args)
	end

	private

	def create_solicitante(type, *args)
		SolicitanteFactory.create(type, *args)
	end

end

class SolicitanteFactory
	def self.create(type, *args)
		case type
		when "turista"
			Turista.new(*args)
		when "trabajador"
			Trabajador.new(*args)
		when "residente"
			Residente.new(*args)
		end
	end
end

app = Administrador.new
# app.agregar_solicitante("turista", "DNI", "40404040", "Roberto", "Montero", true, false)
# app.agregar_solicitante("trabajador", "DNI", "41414141", "Hiromi", "Akatu", true)
# app.agregar_solicitante("residente", "DNI", "40404040", "Roberto", "Montero", false)
