require "./producto.rb"
require "./factory_producto.rb"

class Usuario
  attr_accessor :nombre, :discos
  def initialize(nombre)
    @nombre = nombre
    @discos = []
  end

  def agregar_discos(type, *args)
    discos << create_producto(type, *args)
  end

  def cantidad_discos
    return discos.size
  end

  private
  
  def create_producto(type, *args)
    Producto_factory.create(type, *args)
  end
end

class Empresa
  attr_accessor :usuarios
  def initialize
    @usuarios = []
  end

  def agregar_usuarios(usuario)
    usuarios.push(usuario)
  end

  def reporte_usuario(nombre)
    posicion = -1
    for i in 0..usuarios.size-1
      if nombre == usuarios[i].nombre
        posicion = i
      end
    end

    if posicion < 0
      puts "usuario inexistente, verifique nombre"
      return 0
    end

    puts "Nombre: " + usuarios[posicion].nombre
    puts "Cantidad de discos: " + usuarios[posicion].cantidad_discos.to_s
  end

  def reporte_discos(nombre)
    posicion = -1
    for i in 0..usuarios.size-1
      if nombre == usuarios[i].nombre
        posicion = i
      end
    end

    if posicion < 0
      puts "usuario inexistente, verifique nombre"
      return 0
    end

    puts "Colección de discos de #{nombre}"
    puts "--------------------------------"
    for i in 0..usuarios[posicion].cantidad_discos-1
      usuarios[posicion].discos[i].detalle_producto
    end
  end
end

empresa = Empresa.new

cliente1 = Usuario.new("PPK")
cliente2 = Usuario.new("Keiko")

cliente1.agregar_discos("cd","Get Born","Jet", 8, 70)
cliente1.agregar_discos("dvd", "Star Wars", "3500")
cliente1.agregar_discos("bluray", "Civil War", "Russo brothers", 130)
cliente2.agregar_discos("cd","Born to wild","Steppen Wolf", 10, 90)
cliente2.agregar_discos("dvd", "21", "2800")
cliente2.agregar_discos("bluray", "Ant-Man", "Peyton Reed", 125)

empresa.agregar_usuarios(cliente1)
empresa.agregar_usuarios(cliente2)

empresa.reporte_usuario("PPK")
empresa.reporte_usuario("Keiko")
puts
empresa.reporte_discos("PPK")
empresa.reporte_discos("Keiko")


