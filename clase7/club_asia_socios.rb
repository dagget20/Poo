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
	attr_accessor :dni, :nombre_apellido, :edad, :factor_edad, :qdependientes, :membresia_anual, :membresia_descuento, :membresia_neta, :tiposocio, :socios
	def initialize(dni, nombre_apellido, edad)
		@dni=dni
		@nombre_apellido=nombre_apellido
		@edad=edad
		@tiposocio=tiposocio
		@socios=Array.new
	end
	
	def calcular_factor_edad
		@factor_edad=0
		if edad>17 && edad<31
			@factor_edad=5
		elsif edad>30 && edad<51
			@factor_edad=4
		elsif edad>51
			@factor_edad=3
		end

	end	

	def calcular_membresia
		if @tiposocio=="Honorario"
			@membresia_anual=200.00
		else
			@membresia_anual=((@factor_edad*200)+(@qdependientes*100)) 
		end

		if @tiposocio=="Fundador"
			@membresia_descuento=(@membresia_anual*0.2).round(2)
		else
			@membresia_descuento=0
		end

		@membresia_neta=(@membresia_anual-@membresia_descuento)
	end

	def adicionar_socios(detalle)
		socios<<detalle
	end

	def visualizar_titulos
		print "  dni".ljust(10)
		print "nombres".ljust(8)
		print "edad".ljust(6)
		print "  socio".ljust(16)
		print "dep".ljust(5)
		print "fact edad".ljust(5)
		print "mem anual".ljust(10)
		print "mem desc".ljust(10)
		print "mem neta"
		print "\n"
	end
	

	def visualizar_detalle
		visualizar_titulos
		for i in 0..socios.size-1
			print "#{socios[i].dni}".ljust(10)
			print "#{socios[i].nombre_apellido}".ljust(8)
			print "#{socios[i].edad}".ljust(6)
			print "#{socios[i].tiposocio}".ljust(16)
			print "#{socios[i].qdependientes}".ljust(5)
			print "#{socios[i].factor_edad}".ljust(5)
			print "#{socios[i].membresia_anual}".ljust(10)
			print "#{socios[i].membresia_descuento}".ljust(10)
			print "#{socios[i].membresia_neta}\n"
			puts " "
		end
		visualizar_totales
	end

	def visualizar_totales
		@totalmembresia=0.0
		socios.each do |registro|
			@totalmembresia=@totalmembresia+registro.membresia_neta
		end
		print " ".ljust(42)
		print "Total de Membresia Neta:".ljust(26)
		print "#{@totalmembresia}\n"

	end
end

class Fundador < Socio
	attr_accessor :qdependientes, :membresia, :tiposocio
	def initialize(dni, nombre_apellido, edad, qdependientes)
		super(dni, nombre_apellido, edad)
		@qdependientes=qdependientes
		@factor_edad=calcular_factor_edad
		@tiposocio="Fundador"
		@membresia=calcular_membresia
		
	end
	
	def calcular_factor_edad
		super		
		return factor_edad
	end
	
	def calcular_membresia
		super
	end
end


class Invitado < Socio
	attr_accessor :qdependientes, :membresia, :tiposocio
	def initialize(dni, nombre_apellido, edad, qdependientes)
		super(dni, nombre_apellido, edad)
		@qdependientes = qdependientes
		@factor_edad=calcular_factor_edad
		@tiposocio="Invitado"
		@membresia=calcular_membresia
		
	end

	def calcular_factor_edad
		super
		return factor_edad	
	end
	
	def calcular_membresia
		super
	end
end	

class Honorario < Socio
	attr_accessor :qdependientes, :membresia, :tiposocio
	def initialize(dni, nombre_apellido, edad)
		super(dni, nombre_apellido, edad)
		@qdependientes = 0
		@factor_edad=calcular_factor_edad
		@tiposocio="Honorario"
		@membresia=calcular_membresia
		
	end

	def calcular_factor_edad
		super
		return factor_edad	
	end
	
	def calcular_membresia
		super
	end
end


fundador01=Fundador.new("09080259", "Oscar", 57, 3)
invitado01=Invitado.new("08754329", "Manuel", 34, 2)
honorario01=Honorario.new("01345924", "Jose", 43)
fundador02=Fundador.new("07645322", "Janet", 23, 0)
invitado02=Invitado.new("37802133", "Juana", 51, 1)
honorario02=Honorario.new("98746182", "Gloria", 15)

socio01=Socio.new("", "", 0)
socio01.adicionar_socios(fundador01)
socio01.adicionar_socios(invitado01)
socio01.adicionar_socios(honorario01)
socio01.adicionar_socios(fundador02)
socio01.adicionar_socios(invitado02)
socio01.adicionar_socios(honorario02)

socio01.visualizar_detalle
