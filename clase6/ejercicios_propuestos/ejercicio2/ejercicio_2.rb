require "./alumno.rb"
require "./factory_alumno.rb"

class Empresa
  attr_accessor :alumnos
  def initialize
    alumnos = []
  end

  def agregar_alumno(tipo,codigo, nombre, apellido)
    alumnos << create_alumno(tipo, codigo, nombre, apellido)
  end

  def create_alumno(type, codigo, nombre, apellido)
    FactoryAlumno.create(type, codigo, nombre, apellido)
  end
end

empresa = Empresa.new

