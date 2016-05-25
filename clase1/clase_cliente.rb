class Cliente
	def initialize(tipo, pedido)
		@tipo =  tipo
		@pedido = pedido
	end

	def calculo_descuento
		descuento = 0
		case @tipo
			when "oro"
				if @pedido > 1000
					descuento = @pedido * 0.2
				end
			when "plata"
				if @pedido > 1200
					descuento = @pedido * 0.1
				end
		end

		return descuento.round(2)
	end
end

cliente1 = Cliente.new('oro', 1500)
cliente2 = Cliente.new('plata', 1500)
cliente3 = Cliente.new('normal', 1500)
cliente4 = Cliente.new('oro', 800)

puts cliente1.calculo_descuento
puts cliente2.calculo_descuento
puts cliente3.calculo_descuento
puts cliente4.calculo_descuento