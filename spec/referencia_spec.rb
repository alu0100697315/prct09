require "prct07"
require 'spec_helper'

describe Referencia do
    before :each do
        @b1 = Referencia.new("Dave Thomas", "Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide", "The Facets of Ruby", 
                             "Pragmatic Bookshelf", "4 edition", "July 7, 2013", "ISBN-13: 978-1937785499")
        @b2 = Referencia.new(["Dave Thomas","Andy Hunt", "Chad Fowler"], "Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide",
						   nil, "Pragmatic Bookshelf", "4 edition", "July 7, 2013", ["ISBN-13: 978-1937785499","ISBN-10: 1937785491"])
		
    end
    context "#Pruebas include comparable" do
            
            before :all do
                @libro1= Libro.new("Dave Thomas", "A", "The Facets of Ruby", 
                             "Pragmatic Bookshelf", "4 edition", "July 7, 2013", )
                @libro2= Libro.new("Andy Hunt", "B",
						    nil, "Pragmatic Bookshelf", "4 edition", "July 7, 2013")
				@libro3= Libro.new("Dave Thomas", "A", "The Facets of Ruby", 
                             "Pragmatic Bookshelf", "4 edition", "July 7, 2013", )
			    
            end
            
            it "El libro1 es menor estricto que el libro 2 " do
                 expect(@libro1 < @libro2).to eq(true)
            end
            it "El libro1 es menor o igual que el libro 2 " do
                 expect(@libro1 <= @libro2).to eq(true)
            end
            it "El libro1 es igual al libro3" do
                expect(@libro1 == @libro3).to eq(true)
            end
                
    end
    it "debe existir al menos un autor" do
        expect(@b1.autor).not_to eq nil
        expect(@b2.autor).not_to eq nil
    end

    it "debe existir un titulo" do
        expect(@b1.titulo).not_to eq nil
    end

    it "debe existir o no una serie" do
        expect(@b1.serie).not_to eq nil 
        expect(@b2.serie).to eq nil
    end

    it "debe existir una editorial" do
        expect(@b1.editorial).not_to eq nil
    end
  
    it "debe existir un numero de edicion" do
        expect(@b1.nedi).not_to eq nil
    end

    it "debe existir una fecha de publicacion" do
        expect(@b1.fecha).not_to eq nil
    end

    it "debe haber almenos un numero isbn" do
        expect(@b1.isbn).not_to eq nil
    end
  
  #METODOS DE ACCESO
 
    it "Existir un metodo que nos devuelve almenos un autor" do
        expect(@b1.autor).to eq("Dave Thomas") 
        expect(@b2.autor).to eq(["Dave Thomas","Andy Hunt", "Chad Fowler"])
    end

    it "Existe metodo que nos devuelve el titulo" do
        expect(@b1.titulo).to eq("Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide")
    end

    it "Existe un metodo que nos de devuelve o no una serie" do
        expect(@b1.serie).to eq("The Facets of Ruby") 
    end

    it "Existe un metodo que devuelve la editorial" do
        expect(@b1.editorial).to eq("Pragmatic Bookshelf") 
        expect(@b1.nedi).to eq("4 edition") 
    end

    it "Existe una fecha de publicacion" do
        expect(@b1.fecha).to eq("July 7, 2013") 
    end

    it "Existe un metodo que devuelve almenos un numero isbn" do
        expect(@b1.isbn).to eq("ISBN-13: 978-1937785499")
    end

    it "Existe un metodo de formateo" do
		expect(@b1.to_s).to eq "Dave Thomas\nProgramming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide\nThe Facets of Ruby\nPragmatic Bookshelf; 4 edition (July 7, 2013)\nISBN-13: 978-1937785499\n"
	end

end