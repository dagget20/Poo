class Item
	attr_accessor :titulo, :duracion, :estado_prestamo, :comentario

	def initialize(titulo, duracion, estado_prestamo, comentario)
		@titulo = titulo
		@duracion = duracion
		@estado_prestamo = estado_prestamo
		@comentario = comentario
	end

	def registrar_item
	end

	def imprimir_catalogo
	end
end

class Cd < Item

	attr_accessor :artista, :numero_pistas
	def initialize(titulo, duracion, estado_prestamo, comentario, artista, numero_pistas)
			super(titulo, duracion, estado_prestamo, comentario)
			@artista =  artista
			@numero_pistas = numero_pistas
	end

end

class Dvd < Item
	attr_accessor :director
	def initialize(titulo, duracion, estado_prestamo, comentario, director)
		super(titulo, duracion, estado_prestamo, comentario)
		@director = director
	end
end

class Catalogo
	attr_accessor :items

	def initialize
		@items = []
	end

	def registar_item(item)
		items.push(item)
	end

	def imprimir_catalogo
		for i in 0..items.size - 1
			print items[i].titulo + " - " +
			items[i].duracion + " - " +
			items[i].estado_prestamo.to_s + " - " +
			items[i].comentario + " - "
			if items[i].class == Cd
				print items[i].artista + " - " + items[i].numero_pistas.to_s
			else
				print items[i].director
			end
			puts

		end
	end
end

# titulo, duracion, estado_prestamo, comentario, artista, numero_pistas
dvd1 = Dvd.new("Avengers", "120m", true, "muy buena", "marvel")
dvd2 = Dvd.new("Avengers 2", "130m", false, "muy buena", "marvel")
dvd3 = Dvd.new("Avengers 3", "140m", true, "muy buena", "marvel")
cd1 = Cd.new("Disco", "70m", false, "malisimo", "Rockstar", 10)

netflix = Catalogo.new
netflix.registar_item(dvd1)
netflix.registar_item(dvd2)
netflix.registar_item(dvd3)
netflix.registar_item(cd1)
netflix.imprimir_catalogo