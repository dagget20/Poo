=begin
Pregunta 2

Un Club de Socios de Asia ha decidido desarrollar un programa para gestionar los datos de sus socios
y el cálculo de la membresía anual.
A los socios se les solicita su número de DNI, nombre y apellido, y edad. 
Los socios pueden ser fundadores, invitados u honorarios.
En el caso de los socios fundadores e invitados se solicita además la cantidad de dependientes a su cargo
(sólo el número, esposa + hijos menores de 18 años).

La membresía anual se calcula de esta forma:
Membresía anual (en soles) = Factor_edad * 200 + Dependientes * 100

Donde: 
Factor_edad = 5, si la edad del socio está entre 18 y 30 años.
Factor_edad = 4, si la edad del socio está entre 31 y 50 años.
Factor_edad = 3, si la edad del socio es mayor a 51 años.

Los socios fundadores tienen además un descuento del 20% en la membresía anual.
Y en el caso de los socios honorarios la membresía anual es simplemente 200 soles
(no se tiene en cuenta la fórmula general pues no se les permite dependientes).

Desarrollar las clases y sus relaciones usando herencia y polimorfismo. 
Elaborar un método que permita el cálculo de la Membresía anual de cada socio.
Elaborar un método que liste los socios del club indicando su tipo y su membresía anual a pagar.
Elaborar un método que muestre el total a recaudar por membresías. 
=end

class Socio
	attr_accessor :dni, :nombre, :apellido, :edad
	def initialize(dni, nombre, apellido, edad)
		@dni, @nombre, @apellido, @edad = dni, nombre, apellido, edad
	end

	def calcular_membresia
		factor_edad=0
		if edad>17 && edad<31
			factor_edad=5
		elsif edad>30 && edad<51
			factor_edad=4
		elsif edad>51
			factor_edad=3
		end

		membresia = factor_edad * 200
	end
end

class Fundador < Socio
	attr_accessor :dependientes
	def initialize(dni, nombre, apellido, edad, dependientes)
		super(dni, nombre, apellido, edad)
		@dependientes = dependientes
	end

	def calcular_membresia
		membresia = super
		membresia = (membresia + dependientes * 100) * 0.8
		return membresia.round(2)
	end
end

class Invitado < Socio
	attr_accessor :dependientes
	def initialize(dni, nombre, apellido, edad, dependientes)
		super(dni, nombre, apellido, edad)
		@dependientes = dependientes
	end

	def calcular_membresia
		membresia = super
		membresia = (membresia + dependientes * 100)
		return membresia.round(2)
	end
end

class Honorario < Socio
	def initialize(dni, nombre, apellido, edad)
		super(dni, nombre, apellido, edad)
	end

	def calcular_membresia
		return 200
	end
end

class FactorySocio
	def self.create(type, *args)
		case type
		when 'fundador'
			Fundador.new(*args)
		when 'invitado'
			Invitado.new(*args)
		when 'honorario'
			Honorario.new(*args)
		end
	end
end

class Club
	attr_accessor :socios

	def initialize
		@socios = []
	end

	def agregar_socio(type, *args)
		socios << create_socio(type, *args)
	end

	def total_recaudacion
		total = 0.0
		for i in 0..socios.size-1
			total += socios[i].calcular_membresia
		end
		return total
	end

	private

	def create_socio(type, *args)
		FactorySocio.create(type, *args)
	end
end

class ControllerClub
	attr_accessor :modeloClub, :vistaClub
	def initialize()
		@modeloClub = Club.new()
		@vistaClub = ClubView.new
	end

	def adicionar_socios(type, *args)
		modeloClub.agregar_socio(type, *args)
	end

	def procesar
		vistaClub.visualizar_detalle(modeloClub)
	end
end

class ClubView

	def visualizar_titulos
		print "  dni".ljust(10)
		print "nombres".ljust(8)
		print "apellido".ljust(10)
		print "edad".ljust(9)
		print "tipo".ljust(8)
		print "  dependientes".ljust(16)
		print "mem anual".ljust(10)
		print "\n"
	end
	

	def visualizar_detalle(club)
		visualizar_titulos
		for i in 0..club.socios.size-1
			print "#{club.socios[i].dni}".ljust(11)
			print "#{club.socios[i].nombre}".ljust(7)
			print "#{club.socios[i].apellido}".ljust(11)
			print "#{club.socios[i].edad}".ljust(6)
			print "#{club.socios[i].class}".ljust(16)
			if (club.socios[i].class.to_s == 'Honorario')
				print " - ".ljust(15) 
			else
				print "#{club.socios[i].dependientes}".ljust(15) 
			end
			print "#{club.socios[i].calcular_membresia}".ljust(10)
			puts " "
		end
		visualizar_totales(club)
	end

	def visualizar_totales(club)
		totalmembresia = club.total_recaudacion
		print " ".ljust(40)
		print "Total de Membresia Neta:".ljust(26)
		print "#{totalmembresia}\n"
	end
end

app = ControllerClub.new
app.adicionar_socios('honorario',"09080259", "Oscar", "Benitez", 57)
app.adicionar_socios('invitado', "08754329", "Manuel", "Juarez", 34, 2)
app.adicionar_socios('fundador', "01345924", "Jose", "Padilla", 43, 3)
app.adicionar_socios('honorario', "37802133", "Juana", "La Cubana", 51)
app.adicionar_socios('invitado',"98746182", "Gloria", "Guzman", 15, 0)


app.procesar
# club = Club.new
# club.agregar_socio('honorario',"09080259", "Oscar", "Benitez", 57)

# class Socio
# 	attr_accessor :dni, :nombre_apellido, :edad, :factor_edad, :qdependientes, :membresia_anual, :membresia_descuento, :membresia_neta, :tiposocio, :socios
# 	def initialize(dni, nombre_apellido, edad)
# 		@dni=dni
# 		@nombre_apellido=nombre_apellido
# 		@edad=edad
# 		@tiposocio=tiposocio
# 		@socios=Array.new
# 	end
	
# 	def calcular_factor_edad
# 		@factor_edad=0
# 		if edad>17 && edad<31
# 			@factor_edad=5
# 		elsif edad>30 && edad<51
# 			@factor_edad=4
# 		elsif edad>51
# 			@factor_edad=3
# 		end

# 	end	

# 	# def calcular_membresia
# 	# 	if @tiposocio=="Honorario"
# 	# 		@membresia_anual=200.00
# 	# 	else
# 	# 		@membresia_anual=((@factor_edad*200)+(@qdependientes*100)) 
# 	# 	end

# 	# 	if @tiposocio=="Fundador"
# 	# 		@membresia_descuento=(@membresia_anual*0.2).round(2)
# 	# 	else
# 	# 		@membresia_descuento=0
# 	# 	end

# 	# 	@membresia_neta=(@membresia_anual-@membresia_descuento)
# 	# end

# 	def calcular_membresia
# 	end


# 	def adicionar_socios(detalle)
# 		socios<<detalle
# 	end

# 	# def visualizar_titulos
# 	# 	print "  dni".ljust(10)
# 	# 	print "nombres".ljust(8)
# 	# 	print "edad".ljust(6)
# 	# 	print "  socio".ljust(16)
# 	# 	print "dep".ljust(5)
# 	# 	print "fact edad".ljust(5)
# 	# 	print "mem anual".ljust(10)
# 	# 	print "mem desc".ljust(10)
# 	# 	print "mem neta"
# 	# 	print "\n"
# 	# end
	

# 	# def visualizar_detalle
# 	# 	visualizar_titulos
# 	# 	for i in 0..socios.size-1
# 	# 		print "#{socios[i].dni}".ljust(10)
# 	# 		print "#{socios[i].nombre_apellido}".ljust(8)
# 	# 		print "#{socios[i].edad}".ljust(6)
# 	# 		print "#{socios[i].tiposocio}".ljust(16)
# 	# 		print "#{socios[i].qdependientes}".ljust(5)
# 	# 		print "#{socios[i].factor_edad}".ljust(5)
# 	# 		print "#{socios[i].membresia_anual}".ljust(10)
# 	# 		print "#{socios[i].membresia_descuento}".ljust(10)
# 	# 		print "#{socios[i].membresia_neta}\n"
# 	# 		puts " "
# 	# 	end
# 	# 	visualizar_totales
# 	# end

# 	# def visualizar_totales
# 	# 	@totalmembresia=0.0
# 	# 	socios.each do |registro|
# 	# 		@totalmembresia=@totalmembresia+registro.membresia_neta
# 	# 	end
# 	# 	print " ".ljust(42)
# 	# 	print "Total de Membresia Neta:".ljust(26)
# 	# 	print "#{@totalmembresia}\n"

# 	# end
# end


# class Fundador < Socio
# 	attr_accessor :qdependientes, :membresia, :tiposocio
# 	def initialize(dni, nombre_apellido, edad, qdependientes)
# 		super(dni, nombre_apellido, edad)
# 		@qdependientes=qdependientes
# 		@factor_edad=calcular_factor_edad
# 		@tiposocio="Fundador"
# 		@membresia=calcular_membresia
		
# 	end
	
# 	def calcular_factor_edad
# 		super		
# 		return factor_edad
# 	end
	
# 	def calcular_membresia
# 		super
# 	end
# end


# class Invitado < Socio
# 	attr_accessor :qdependientes, :membresia, :tiposocio
# 	def initialize(dni, nombre_apellido, edad, qdependientes)
# 		super(dni, nombre_apellido, edad)
# 		@qdependientes = qdependientes
# 		@factor_edad=calcular_factor_edad
# 		@tiposocio="Invitado"
# 		@membresia=calcular_membresia
		
# 	end

# 	def calcular_factor_edad
# 		super
# 		return factor_edad	
# 	end
	
# 	def calcular_membresia
# 		super
# 	end
# end	

# class Honorario < Socio
# 	attr_accessor :qdependientes, :membresia, :tiposocio
# 	def initialize(dni, nombre_apellido, edad)
# 		super(dni, nombre_apellido, edad)
# 		@qdependientes = 0
# 		@factor_edad=calcular_factor_edad
# 		@tiposocio="Honorario"
# 		@membresia=calcular_membresia
		
# 	end

# 	def calcular_factor_edad
# 		super
# 		return factor_edad	
# 	end
	
# 	def calcular_membresia
# 		super
# 	end
# end


# fundador01=Fundador.new("09080259", "Oscar", 57, 3)
# invitado01=Invitado.new("08754329", "Manuel", 34, 2)
# honorario01=Honorario.new("01345924", "Jose", 43)
# fundador02=Fundador.new("07645322", "Janet", 23, 0)
# invitado02=Invitado.new("37802133", "Juana", 51, 1)
# honorario02=Honorario.new("98746182", "Gloria", 15)

# socio01=Socio.new("", "", 0)
# socio01.adicionar_socios(fundador01)
# socio01.adicionar_socios(invitado01)
# socio01.adicionar_socios(honorario01)
# socio01.adicionar_socios(fundador02)
# socio01.adicionar_socios(invitado02)
# socio01.adicionar_socios(honorario02)

# socio01.visualizar_detalle
