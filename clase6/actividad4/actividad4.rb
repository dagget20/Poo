require "./candidato.rb"
require "./factory_candidato.rb"

class Encuestadora
  attr_accessor :candidatos
  
  def initialize
    @candidatos = []
  end

  def agregar_candidato(type, *args)
    candidatos << create_candidato(type, *args)
  end

  def consulta_canditato(dni)
    posicion = -1
    for i in 0..candidatos.size-1
      if candidatos[i].dni == dni
        posicion = i
      end
    end
    if posicion < 0
      puts "No existe el candidato buscado"
      return 0
    end

    puts "Resultado de busqueda"
    puts "-------------------------"
    candidatos[posicion].detalle_candidato
  end

  def mayor_candidato(type)
    mayor = 0
    candidatos_tipo =[]
    for i in 0..candidatos.size-1
      if type == candidatos[i].class.to_s
        candidatos_tipo.push(candidatos[i])
      end
    end

    for i in 0..candidatos_tipo.size-1
      if candidatos_tipo[i].calcular_puntaje > candidatos_tipo[mayor].calcular_puntaje
        mayor = i
      end
    end
      
    candidatos_tipo[mayor].nombre + " - " + candidatos_tipo[mayor].calcular_puntaje.to_s
  end

  def listar_candidatos
    puts "Lista de Candidatos"
    puts "-----------------------"

    for i in 0..candidatos.size-1
      candidatos[i].detalle_candidato
    end
    
    puts "Resultado de Ganadores"
    puts "--------------------------"
    puts "Candidato presidencial con mayor puntaje " + mayor_candidato("CandidatoPresidencial").to_s
    puts "Candidato parlamentario con mayor puntaje " + mayor_candidato("CandidatoParlamentario").to_s
    puts "Candidato al Parlemento Andino con mayor puntaje " + mayor_candidato("CandidatoPAndino").to_s
    puts

  end


  private

  def create_candidato(type, *args)
    FactoryCandidato.create(type, *args)
  end
end

encuestadora = Encuestadora.new

encuestadora.agregar_candidato('presidencial', 40404040, "PPK", "Master", "PPK", 8, 9, 9)
encuestadora.agregar_candidato('presidencial', 41414141, "Keiko", "Master", "Fuerza Popular", 5, 6, 7)
encuestadora.agregar_candidato('parlamentario', 42424242, "Sheput", "Titulado", "PPK", 7, 7.5, 6.5, "Lima", 7)
encuestadora.agregar_candidato('parlamentario', 43434343, "Vizcarra", "Titulado", "PPK", 8, 8.5, 7.5, "Moquegua", 8)
encuestadora.agregar_candidato('andino', 44444444, "Kenji", "Secundaria", "Fuerza Popular", 4, 3, 2.5)
encuestadora.agregar_candidato('andino', 45454545, "Veronika", "Titulado", "Frente Amplio", 7.5, 7, 6.5)

encuestadora.listar_candidatos
encuestadora.consulta_canditato(45454545)


