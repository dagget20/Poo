class Alumno
  attr_accessor :codigo, :nombre, :apellido
  def initialize(codigo, nombre, apellido)
    @codigo, @nombre, @apellido = codigo, nombre, apellido
  end
end

class AlumnoTraslado < Alumno
  def initialize(codigo, nombre, apellido)
    super(codigo, nombre, apellido)
  end
end

class AlumnoBecado < Alumno
  def initialize(codigo, nombre, apellido)
    super(codigo, nombre, apellido)
  end
end

class AlumnoRegular < Alumno
  def initialize(codigo, nombre, apellido)
    super(codigo, nombre, apellido)
  end
end
