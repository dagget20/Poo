class Boleta

	def initialize(monto)
		@monto = monto
	end

	def calculo_igv
		igv = @monto * 0.18
		return igv.round
	end

	def calculo_monto_total
		total = @monto + calculo_igv
		return total.round(2)
	end
end

boleta1 = Boleta.new(1000)
puts boleta1.calculo_igv
puts boleta1.calculo_monto_total
