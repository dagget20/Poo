class Empresa
	attr_accessor :razon_social, :pago

	def initialize(razon_social, tipo, importe)
		@razon_social = razon_social
		@pago = Pago.new(tipo, importe)
	end

	def identificar
		"La empresa con razón social #{razon_social} realizó un " + pago.detallar
	end

end

class Pago
	attr_accessor :tipo, :importe

	def initialize(tipo, importe)		
		@tipo, @importe = tipo, importe
	end

	def detallar
		"pago de #{tipo} por S/. #{importe.to_s}"
	end
end

empresa1 = Empresa.new("UPC SA", "IR", 1545.25)
puts empresa1.identificar