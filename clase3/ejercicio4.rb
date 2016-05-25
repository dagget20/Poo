class Alumno
	attr_accessor :nombre, :codigo, :cursos

	def initialize(nombre,codigo, descripcion, ciclo, pension)
		@nombre = nombre
		@codigo = codigo
		# curso = Curso.new(descripcion, ciclo, pension)
		@cursos =  []
	end

	def estudiar
		puts "Yo estudio los siguientes cursos: "
		for i in 0..cursos.size-1
			puts cursos[i].detallar
		end
	end

	def cursar(descripcion, ciclo, pension)
		curso = Curso.new(descripcion, ciclo, pension)
		cursos.push(curso)
	end
end

class Curso
	attr_accessor :descripcion, :ciclo, :pension

	def initialize(descripcion, ciclo, pension)
		@descripcion, @ciclo, @pension = descripcion, ciclo, pension
	end

	def detallar
		"#{descripcion}, del ciclo #{ciclo} con un costo de S/. #{pension}"
	end
end

alumno1 =  Alumno.new("Juan", "20000000", "Matemática", "5", 100)
alumno1.cursar( "POO", "3", 300)
alumno1.estudiar