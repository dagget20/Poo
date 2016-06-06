class Producto
  attr_accessor :nombre
  def initialize(nombre)
    @nombre = nombre
  end

  def detalle_producto
    puts "Nombre del producto: " + nombre
  end
end

class Cd < Producto
  attr_accessor :cantante, :numero_pistas, :tiempo_total
  
  def initialize(nombre,cantante, numero_pistas, tiempo_total)
    super(nombre)
    @cantante, @numero_pistas, @tiempo_total = cantante, numero_pistas, tiempo_total
  end

  def detalle_producto
    super
    puts "Cantante: " + cantante
    puts "Número de pistas: " + numero_pistas.to_s
    puts "Tiempo total: " + tiempo_total.to_s
    puts
  end
end

class Dvd < Producto
  attr_accessor :cantidad_datos
  def initialize(nombre, cantidad_datos)
    super(nombre)
    @cantidad_datos = cantidad_datos
  end

  def detalle_producto
    super
    puts "Cantidad de datos: " + cantidad_datos.to_s + "MBs"
    puts
  end 
end

class Bluray < Producto
  attr_accessor :director, :tiempo_total
  def initialize(nombre, director, tiempo_total)
    super(nombre)
    @director, @tiempo_total = director, tiempo_total
  end

  def detalle_producto
    super
    puts "Diretor: " + director
    puts "Tiempo total: " + tiempo_total.to_s + "m"
    puts
  end
end
