class Alumno
	def initialize(codigo, nombre, apellidos, nota_pc1, nota_pc2, nota_dd, nota_eb)
		@codigo = codigo
		@nombre = nombre
		@apellidos = apellidos
		@nota_pc1 = nota_pc1
		@nota_pc2 = nota_pc2
		@nota_dd = nota_dd
		@nota_eb = nota_eb
	end

	def presentarse
		"Hola mi nombre es #{@nombre + " " + @apellidos} y mi código es #{@codigo}"
	end

	def calculo_nota_final
		promedio = @nota_pc1 * 0.2 + @nota_pc2 * 0.25 + @nota_dd * 0.25 + @nota_eb * 0.30
		return promedio.round(2)
	end

	def determinar_aprobacion
		if calculo_nota_final >= 13
			"El alumno #{@nombre + " " + @apellidos} con código #{@codigo} esta aprobado"
		else
			"El alumno #{@nombre + " " + @apellidos} con código #{@codigo} esta desprobado"
		end
	end

end


alumno1 = Alumno.new('U201566554', 'Juan', 'Lopez', 18, 19, 17, 18)

puts alumno1.presentarse
puts alumno1.calculo_nota_final
puts alumno1.determinar_aprobacion