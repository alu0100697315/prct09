require 'spec_helper'
require 'prct07'

describe Referencia do
      before :each do
        @r1 = Referencia.new(["Dave Thomas", "Andy Hunt", "Chad Fowler"], "Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide",
							nil, "Pragmatic Bookshelf", "4 edition", "July 7, 2013", ["ISBN-13: 978-1937785499","ISBN-10: 1937785491"])
        @r2 = Referencia.new("Scott Chacon", "Pro Git 2009th Edition", "Pro", "Apress", "2009 edition", "August 27, 2009",
                            ["ISBN-13: 978-1430218333","ISBN-10: 1430218339"])
        @r3 = Referencia.new(["David Flanagan", "Yukihiro Matsumoto"], "The Ruby Programming Language",nil,
                            "O’Reilly Media", "1 edition", "February 4, 2008", ["ISBN-10: 0596516177", "ISBN-13: 978-0596516178"])                                    
        @r4 = Referencia.new(["David Chelimsky", "Dave Astels", "Bryan Helmkamp", "Dan North", "Zach Dennis", "Aslak Hellesoy"],
                            "The RSpec Book: Behaviour Driven Development with RSpec, Cucumber, and Friends (The Facets of Ruby)",
                            nil, "Pragmatic Bookshelf", "1 edition", "December 25, 2010",["ISBN-10: 1934356379", "ISBN-13: 978-1934356371"])  
        @r5 = Referencia.new("Richard E. Silverman",    "Git Pocket Guide", nil, "O’Reilly Media", "1 edition", "August 2, 2013",
                                        ["ISBN-10: 1449325866","ISBN-13: 978-1449325862"]) 
       
        @b1 = Bibliografia.new @r1
        @b1.add(@r2)
       
    end
    
context "#Pruebas include enumerable" do
    
       before :each do
        @l1 = Bibliografia.new @r1
        @l1.add(@r2)
            
            @l1.add(@r1)
            @l1.add(@r2)
            @l1.add(@r4)
        end
        it "comprobrando el metodo all? con un bloque vacio" do
          expect(@l1.all?).to eq(true)
        end
        it "comprobrando el metodo any?" do
          expect(@l1.any?).to eq(true)
        end
end        
describe "Node" do
        
    it "Se crea un nodo" do
        expect(@b1.head).not_to eq(nil)
    end
    it "El nodo tiene un valor" do
        expect(@b1.head.value.to_s).to eq @r1.to_s
    end
    it "El nodo apunta a su siguiente" do
        expect(@b1.head.next.value).to eq @r2
    end
end

describe "List" do
    it "Se accede al primer elemento de la lista" do
        expect(@b1.head.value).to eq @r1
    end
    it "Cada elemento tiene un apuntador a previo" do
        expect(@b1.tail.prev.value).to eq @r1
    end
    it "Se extrae el primer elemento de la lista" do
        expect(@b1.popup.value).to eq @r1 #estraemos el primer elemento
        expect(@b1.head.value).to eq @r2  #Ahora la cabeza debe apuntar al siguiente elemento
    end
    it "Se accede al ultimo elemento de la lista" do
        expect(@b1.tail.value).to eq @r2
    end
    it "Se puede insertar un elemento" do
        @b1.add(@r3)
       expect(@b1.head.next.value).to eq @r2
       expect(@b1.tail.value).to eq @r3
    end
    it "Se pueden insertar varios elementos" do
        @b1.add([@r3,@r4,@r5])
        expect(@b1.head.next.value).to eq @r2
        expect(@b1.head.next.next.value).to eq @r3
        expect(@b1.head.next.next.next.value).to eq @r4
        expect(@b1.head.next.next.next.next.value).to eq @r5
        expect(@b1.tail.value).to eq @r5
    end
end
end