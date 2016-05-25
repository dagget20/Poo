class Profesor
	attr_accessor :codigo, :dni, :nombre

	def initialize(codigo, dni, nombre)
		@codigo, @dni, @nombre = codigo, dni, nombre
	end

	def presentarse(facultad,denominacion)
		departamento = Departamento.new(facultad,denominacion)
		"El Profesor #{nombre} de código #{codigo} " + "pertenece a:" + departamento.describirse
	end
end

class Departamento
	attr_accessor :facultad, :denominacion

	def initialize(facultad, denominacion)
		@facultad, @denominacion = facultad, denominacion
	end

	def describirse
		"Facultad de #{facultad}, departamento de  #{denominacion}"
	end
end

profe1 = Profesor.new("123456", "41414141","Obi-wan")
puts profe1.presentarse("Ingeniería", "Epe")