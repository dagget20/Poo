class Producto
  attr_accessor :fecha_caducidad, :numero_lote, :fecha_envasado, :pais_origen

  def initialize(fecha_caducidad, numero_lote, fecha_envasado, pais_origen)
    @fecha_caducidad, @numero_lote, @fecha_envasado, @pais_origen = fecha_caducidad, numero_lote, fecha_envasado, pais_origen
  end

  def detallar_producto
     puts "Fecha de caducidad: " + fecha_caducidad
     puts "Número de lote: " + numero_lote.to_s
     puts "Fecha de envasado: " + fecha_envasado
     puts "País de origen: " + pais_origen
  end

end

class Fresco < Producto
  def initialize(fecha_caducidad, numero_lote, fecha_envasado, pais_origen)
    super(fecha_caducidad, numero_lote, fecha_envasado, pais_origen)
  end
end

class Frio < Producto
  attr_accessor :temp_recomendada

  def initialize(fecha_caducidad, numero_lote, fecha_envasado, pais_origen,temp_recomendada)
    super(fecha_caducidad, numero_lote, fecha_envasado, pais_origen)
    @temp_recomendada = temp_recomendada
  end

  def detallar_producto
    super
    puts "Temperatura recomendada: " + temp_recomendada.to_s + "º C"
  end
end

class Refrigerado < Frio
  attr_accessor :codigo_entidad
  
  def initialize(fecha_caducidad, numero_lote, fecha_envasado, pais_origen, temp_recomendada, codigo_entidad)
    super(fecha_caducidad, numero_lote, fecha_envasado, pais_origen, temp_recomendada)
    @codigo_entidad = codigo_entidad
  end

  def detallar_producto
    super
    puts "Código de la entidad: " + codigo_entidad.to_s
  end
end

class Congelado < Frio
  def initialize(fecha_caducidad, numero_lote, fecha_envasado, pais_origen, temp_recomendada)
    super(fecha_caducidad, numero_lote, fecha_envasado, pais_origen, temp_recomendada)
  end
end

class CongeladoAire < Congelado
  attr_accessor :nitrogeno, :oxigeno, :co2, :vapor_agua
  
  def initialize(fecha_caducidad, numero_lote, fecha_envasado, pais_origen, temp_recomendada, nitrogeno, oxigeno, co2, vapor_agua)
    super(fecha_caducidad, numero_lote, fecha_envasado, pais_origen, temp_recomendada)
    @nitrogeno, @oxigeno, @co2, @vapor_agua = nitrogeno, oxigeno, co2, vapor_agua
  end

  def detallar_producto
    super
    puts "Porcentaje de nitrogeno: " + nitrogeno.to_s + "%"
    puts "Porcentaje de oxigen: " + oxigeno.to_s  + "%"
    puts "Porcentaje de dioxido de carbono: " + co2.to_s  + "%"
    puts "Porcentaje de vapor de agua: " + vapor_agua.to_s  + "%"
  end
end

class CongeladoAgua< Congelado
  attr_accessor :salinidad
  
  def initialize(fecha_caducidad, numero_lote, fecha_envasado, pais_origen, temp_recomendada, salinidad)
    super(fecha_caducidad, numero_lote, fecha_envasado, pais_origen, temp_recomendada)
    @salinidad = salinidad
  end

  def detallar_producto
    super
    puts "Salinidad del agua: " + salinidad.to_s
  end
end

class CongeladoNitrogeno < Congelado
  attr_accessor :metodo_congelacion, :tiempo_exposicion
  
  def initialize(fecha_caducidad, numero_lote, fecha_envasado, pais_origen, temp_recomendada, metodo_congelacion, tiempo_exposicion)
    super(fecha_caducidad, numero_lote, fecha_envasado, pais_origen, temp_recomendada)
    @metodo_congelacion, @tiempo_exposicion = metodo_congelacion, tiempo_exposicion
  end

  def detallar_producto
    super
    puts "Metodo congelación: " + metodo_congelacion
    puts "Tiempo de exposición: " + tiempo_exposicion.to_s + "s"
  end
end

producto1 =  Fresco.new("30-06-2016", 20, "05-06-2016", "Perú")
producto2 =  Refrigerado.new("31-08-2016", 24, "05-06-2016", "Perú", 5, 232321)
producto3 =  CongeladoAire.new("31-12-2016", 25, "05-06-2016", "Perú", 1, 25, 20, 25, 25)
producto4 =  CongeladoAgua.new("30-11-2016", 25, "05-06-2016", "Perú", 0, 4)
producto5 =  CongeladoNitrogeno.new("31-12-2016", 25, "05-06-2016", "Perú", -2, "Criopreservación", 30)



producto1.detallar_producto
puts
producto2.detallar_producto
puts
producto3.detallar_producto
puts
producto4.detallar_producto
puts
producto5.detallar_producto


