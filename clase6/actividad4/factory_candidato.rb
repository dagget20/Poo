class FactoryCandidato
  def self.create(type, *args)
    case type
       when "presidencial"
         CandidatoPresidencial.new(*args)
       when "parlamentario"
         CandidatoParlamentario.new(*args)
       when "andino"
         CandidatoPAndino.new(*args)
    end
  end
end
