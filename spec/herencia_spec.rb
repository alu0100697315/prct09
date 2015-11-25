require "prct07"
require 'spec_helper'

describe Referencia do
    context "Libro" do
        
        before :each do
          libro = Libro.new(["Dave Thomas","Andy Hunt", "Chad Fowler"], "Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide", nil, "Pragmatic Bookshelf", "4 edition", "July 7, 2013")
        end
#       it "El objeto libro es una instancia de Libro" do
#       @libro.instance_of? Libro
#       expect(libro.instance_of?Libro).to eq(true)
#       end
#      it "Libro es hijo de Referencia" do
#         @libro.is_a?Referencia
#            expect(@libro.class.superclass).to eq (Referencia)
#        end
#    end
#    describe Articulo do
#        before :each do
#          @revista = Articulo.new("Jacobson Martin","Isolation,Indentification and Synthesis of the Sex Attractant of Gypsy Moth","Oct. 14, 1960","first edition","vol. 132","n. 3433","Sciense", 1)
#        end
#        
#        it "El objeto libro es una instancia de Libro" do
#            @revista.instance_of? Articulo
#        end
#        it "Artículo es hijo de Referencia"do
#            @revista.is_a?Referencia
#            expect(@revista.class.superclass).to eq (Referencia)
#       end
    end
end