class Poligono
	def calcular_area
	end
end

class Triangulo < Poligono
	attr_accessor :base, :altura
	def initialize(base, altura)
		@base, @altura = base, altura
	end

	def calcular_area
		area = (base * altura) / 2
		return area.round(2)
	end
end

class Circulo < Poligono
	attr_accessor :radio
	def initialize(radio)
		@radio = radio
	end

	def calcular_area
		area = Math::PI * radio ** 2
		return area.round(2)
	end
end

class Cuadrado < Poligono
	attr_accessor :lado
	def initialize(lado)
		@lado = lado
	end

	def calcular_area
		area = lado * lado
		return area.round(2)
	end
end

class Administrador
	attr_accessor :poligonos
	def initialize
		@poligonos = []
	end

	def agregar_poligono(poligono)
		poligonos.push(poligono)
	end

	def cantidad_figuras
		cantidad = poligonos.size
	end

	def suma_areas
		areas = 0.0
		for i in 0..poligonos.size-1
			areas += poligonos[i].calcular_area
		end
		return areas.round(2)
	end

	def mayor_area
		mayor = 0
		for i in 0..poligonos.size-1
			if poligonos[i].calcular_area > poligonos[mayor].calcular_area
				mayor = i
			end
		end
		tipo = poligonos[mayor].class
		print "Los atributos del poligono de mayor area son, "
		case tipo.to_s
			when "Triangulo"
				puts "base: " + poligonos[mayor].base.to_s + " altura: " + poligonos[mayor].altura.to_s
			when "Circulo"
				puts "radio: " + poligonos[mayor].radio.to_s
			when "Cuadrado"
				puts "lado: " + poligonos[mayor].lado.to_s
		end
				
				
	end

end

poligono1 =  Circulo.new(10.0)
poligono2 =  Triangulo.new(5.0,20.0)
poligono3 =  Cuadrado.new(15.0)
poligono4 =  Circulo.new(3.1415)
poligono5 =  Triangulo.new(14.0,3.5)


administrador = Administrador.new

administrador.agregar_poligono(poligono1)
administrador.agregar_poligono(poligono2)
administrador.agregar_poligono(poligono3)
administrador.agregar_poligono(poligono4)
administrador.agregar_poligono(poligono5)

puts "La cantidad de figuras es: " + administrador.cantidad_figuras.to_s
puts "El total de la suma de las areas es: " + administrador.suma_areas.to_s
puts administrador.mayor_area