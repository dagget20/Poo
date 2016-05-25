class Mamifero
	def respirar
		puts 'inpirar, esperirar'
	end
end

class Gato < Mamifero
	def maullar
		puts 'Miauuuuu'
	end
end

cribas =  Gato.new
cribas.respirar
cribas.maullar