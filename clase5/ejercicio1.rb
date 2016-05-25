class Poligono
	attr_accessor :base, :altura

	def initialize(base, altura)
		@base, @altura = base, altura
	end

	def calcular_area
	end
end

class Rectangulo < Poligono
	def initialize(base, altura)
		super(base, altura)
	end

	def calcular_area
		return (base * altura).round(2)
	end
end

class Triangulo < Poligono
	def initialize(base, altura)
		super(base, altura)
	end

	def calcular_area
		return ((base * altura)/2.0).round(2)
	end
end


figura1 = Rectangulo.new(2,2)
figura2 = Rectangulo.new(3,6)
figura3 = Triangulo.new(5.5,4.3)
figura4 = Triangulo.new(1,2)

puts "El area de la figura1 es " + figura1.calcular_area.to_s + " m2"
puts "El area de la figura2 es " + figura2.calcular_area.to_s + " m2"
puts "El area de la figura3 es " + figura3.calcular_area.to_s + " m2"
puts "El area de la figura4 es " + figura4.calcular_area.to_s + " m2"
