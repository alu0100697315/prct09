require "prct07/version" 

class Bibliografia
		attr_reader  :head, :tail
		include Enumerable
		Node = Struct.new :value, :next , :prev

		def initialize (referencias) 
			if referencias.instance_of? Referencia
				@head = Node.new(referencias, nil, nil)
				@tail = nil
			else raise "Debe crearse una clase Referencia y pasarla como parámetro al constructor de esta clase" end
		end
		
def each
aux = @head
    if (@head == nil and @tail == nil)
                yield nil
            elsif (@head == @tail)
                yield @head.value
            else
                while(aux != nil)
                    yield aux.value  
                    aux = aux.next 
                end
    end
end
   
		def add (value)
			if value.is_a? Referencia #Si se pasa una sola referencia
				if @head == nil
					@head = Node.new(value, nil, nil)
					@tail = nil
				else
					if @tail == nil
						@tail = Node.new(value, nil, @head)
						@head.next=@tail	
					else
						aux = @tail
						@tail = Node.new(value, nil)
						aux.next = @tail
						tail.prev = aux
					end
				end
			elsif value.is_a? Array #Si se pasa un array de referencias
				value.each do |i|
					self.add(i)
				end
			else raise "Se debe pasar una Referencia o un Array de Referencias"
			end
		
		end
		def popup
			aux = self.head
			@head = aux.next
			return aux
		end
end
class Referencia
		attr_accessor :autor, :titulo, :serie,:editorial,:nedi,  :fecha, :isbn  
		include Comparable
		def initialize (autor, titulo, serie, editorial, nedi, fecha, isbn )
			@autor = autor
			@titulo = titulo
			@serie = serie
			@editorial = editorial
			@nedi = nedi
			@fecha = fecha
			@isbn = isbn
		end

		def <=>(other)
			@autor <=> other.autor
		end
		
		def ==(other)
			@autor == other.autor
		end
		def to_s
			salida = String.new ""
			salida += self.autores
			salida +=
			"#{titulo}\n"+
			"#{serie}\n"+
	    	"#{editorial}; #{nedi} (#{fecha})\n"
			"#{isbn}\n"
			salida += self.isbns
			return salida
		end

		def autores
			salida = String.new ""
			if @autor.instance_of? String
				salida = "#{autor}\n"
			elsif @autor.instance_of? Array
				for item in @autor
					if @autor.last == item
						salida += item.to_s+"\n"
					else
						salida += item.to_s+", "
					end
				end
			end
			return salida
		end


		def isbns
			salida = String.new ""
			if @isbn.instance_of? String
				salida = "#{isbn}\n"
			elsif @isbn.instance_of? Array
				for item in @isbn
				salida += item.to_s+"\n"
				end
			end
			return salida
		end
end

class Libro < Referencia
    #
       attr_accessor :isbn, :editorial, :nedi
		def initialize(titulo, autor, fecha, isbn, editorial, nedi)
			@titulo= titulo
		    @autor= autor
		    @fecha= fecha
			@isbn= isbn
			@editorial= editorial
			@nedi= nedi
		end
    
    	def isbns
        	salida = String.new ""
        	if @isbn.instance_of? String
        		salida = "#{isbn}\n"
        	elsif @isbn.instance_of? Array
        		for item in @isbn
        		salida += item.to_s+"\n"
        		end
        	end
        	return salida
    	end
        def to_s
            salida = String.new ""
    			salida += "Libro: \n"
    			salida += self.autores
    			salida +=
    			"#{titulo}\n"+
    			"#{serie}\n"+
    			"#{editorial}; #{nedi} (#{fecha})\n"
    			salida += self.isbns
    			return salida
        end
    
end

class Articulo < Referencia
    
        attr_accessor :volumen, :fasciculo, :articulo
    
        def initialize (autor, titulo, serie, volumen, nedi, fecha, fasciculo, articulo)
            super(autor, titulo, serie, fecha, nedi) #llamada al constructor de la clase padre
            @volumen = volumen
            @fasciculo = fasciculo
            @articulo = articulo
        end
    
        def to_s
            salida = String.new ""
    			salida += "Artículo: \n"
    			salida += self.autores
    			salida +=
    			"#{titulo}\n"+
    			"#{volumen}, #{fasciculo}, #{articulo}\n"
    			"#{serie}\n"+
    			"#{nedi} (#{fecha})\n"
    			return salida
        end
    
end
