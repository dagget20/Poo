class Personaje
  attr_accessor :nombre, :energia
  
  def initialize(nombre, energia)
  	@nombre, @energia = nombre, energia
  end

  def alimentatse(cantidad_energia)
    self.energia += cantidad_energia
  end

  def consumir_energia(cantidad_energia)
  	self.energia -= cantidad_energia
  end
end

class Guerrero < Personaje
  attr_accessor :arma

  def initialize(nombre, energia, arma)
    super(nombre, energia)
    @arma = arma
  end

  def combatir(cantidad_energia)
    if cantidad_energia > energia
      puts "No tienes suficiente energía"
    else
      consumir_energia(cantidad_energia)
      return arma + " - " + cantidad_energia.to_s
    end
  end
end

class Mago < Personaje
  attr_accessor :poder

  def initialize(nombre, poder)
    @poder = poder
    super(nombre, energia = 100)
  end

  def encantar
  	consumir_energia(2)
  	return poder
  end
end

personaje1 = Guerrero.new('Arturo', 250, 'Espada')
personaje2 = Mago.new('Merlín', 'Ilusión')
personaje3 = Guerrero.new('Conan', 350, 'Hacha')
personaje4 = Mago.new('Gandalf', 'Rayos')

puts personaje1.combatir(20)
puts personaje2.encantar
puts personaje3.combatir(25)
puts personaje4.encantar
