class Candidato
  attr_accessor :dni, :nombre, :grado_instruccion, :partido_politico, :trayectoria, :simpatia, :honestidad
  def initialize(dni, nombre, grado_instruccion, partido_politico, trayectoria, simpatia, honestidad)
    @dni, @nombre, @grado_instruccion, @partido_politico, @trayectoria, @simpatia, @honestidad = dni, nombre, grado_instruccion, partido_politico, trayectoria, simpatia, honestidad
  end

  def calcular_puntaje
    puntaje = trayectoria * 0.2 + simpatia * 0.6 + honestidad * 0.2
    return puntaje.round(2)
  end
  
  def detalle_candidato
    puts "DNI: " + dni.to_s
    puts "Nombre: " + nombre
    puts "Grado de instrucción: " + grado_instruccion
    puts "Partido político: " + partido_politico
    puts "Trayectoria: " + trayectoria.to_s
    puts "Simpatía: " + simpatia.to_s
    puts "Honestidad: " + honestidad.to_s
    puts "Puntaje: " + calcular_puntaje.to_s
    puts
  end
end

class CandidatoPresidencial < Candidato
  def initialize(dni, nombre, grado_instruccion, partido_politico, trayectoria, simpatia, honestidad)
    super(dni, nombre, grado_instruccion, partido_politico, trayectoria, simpatia, honestidad)
  end
end

class CandidatoParlamentario < Candidato
  attr_accessor :region, :reconocimineto_local
  def initialize(dni, nombre, grado_instruccion, partido_politico, trayectoria, simpatia, honestidad, region, reconocimineto_local)
    super(dni, nombre, grado_instruccion, partido_politico, trayectoria, simpatia, honestidad)
    @region, @reconocimineto_local = region, reconocimineto_local
  end

  def calcular_puntaje
    puntaje = trayectoria * 0.2 + simpatia * 0.6 + honestidad * 0.2
    puntaje = (puntaje + reconocimineto_local) / 2.0
    return puntaje.round(2)
  end
end

class CandidatoPAndino < Candidato
  def initialze(dni, nombre, grado_instruccion, partido_politico, trayectoria, simpatia, honestidad)
    super(dni, nombre, grado_instruccion, partido_politico, trayectoria, simpatia, honestidad)
  end
end


