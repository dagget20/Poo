class Alumno
	def initialize(codigo, nombre, t1, t2)
		@codigo = codigo
		@nombre = nombre
		@t1 = t1
		@t2 = t2
	end

	def estado_aprobacion
		if @t1 > 85 and @t2 > 85
			"El Alumno #{@nombre} con código #{@codigo} está aprobado"
		elsif @t1 > 85 or @t2 > 85
			"El Alumno #{@nombre} con código #{@codigo} está observado"
		else
			"El Alumno #{@nombre} con código #{@codigo} está desaprobado"
		end
	end
end

alumno1 = Alumno.new('I20154568', 'Bill Gates', 90, 95)
alumno2 = Alumno.new('I20154568', 'Steve Jobs', 80, 95)
puts alumno1.estado_aprobacion
puts alumno2.estado_aprobacion