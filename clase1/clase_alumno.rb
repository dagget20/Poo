class Alumno

	def initialize(nota1, nota2, nota3)
		@nota1 = nota1
		@nota2 = nota2
		@nota3 = nota3
	end

	def calcular_promedio
		promedio = ((@nota1 + @nota2 + @nota3) / 3.0).round(2)
		return promedio
	end

	def determinar_aprobacion
		if (calcular_promedio >= 13)
			"Aprobado"
		else
			"Desaprobado"
		end
	end

	def nota_mayor
		if @nota1 > @nota2 and @nota1 > @nota3
			return @nota1
		elsif @nota2 > @nota1 and @nota2 > @nota3
			return @nota2
		else
			return @nota3
		end	
	end
end

alumno1 = Alumno.new(18,16,19)
puts alumno1.calcular_promedio
puts alumno1.determinar_aprobacion
puts alumno1.nota_mayor