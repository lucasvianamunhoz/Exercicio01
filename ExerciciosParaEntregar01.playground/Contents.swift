import UIKit

class Competidor{
    var velocidade:Int = 0
    var aceleracao:Int = 0
    var giro:Int=0
    var placa:String = ""
}

class Corrida:FuncionalidadeCorrida {
 
    
    var distancia: Int = 0
    var premioEmDolares:Int = 0
    var nome : String = ""
    var quantidadeDeCompetidoresPermitidos: Int = 0
    var listaCompetidores : [Competidor] = []
    var socorristaCarro : SocorristaCarro = SocorristaCarro()
    var socorristaMoto : SocorristaMoto = SocorristaMoto()
    
    func adicionarCarro(velocidade: Int, aceleracao: Int, giro: Int, placa: String) {
        let carro = Carro()
        carro.velocidade = velocidade
        carro.aceleracao = aceleracao
        carro.giro =  giro
        carro.placa = placa
        self.listaCompetidores.append(carro);
    }
    
    func adicionarMoto(velocidade: Int, aceleracao: Int, giro: Int, placa: String) {
        let moto = Moto()
        moto.velocidade = velocidade
        moto.aceleracao = aceleracao
        moto.giro =  giro
        moto.placa = placa
        self.listaCompetidores.append(moto);
    }
    
    func eliminarCompetidor(competidor: Competidor) {
        for  (index,comp) in self.listaCompetidores.enumerated() {
            if(comp.placa==competidor.placa){
                self.listaCompetidores.remove(at: index)
            }
        }
    }
    
    func eliminarCompetidor(umaPlaca: String) {
        for  (index,comp) in self.listaCompetidores.enumerated() {
            if(comp.placa==umaPlaca){
                self.listaCompetidores.remove(at: index)
            }
        }

    }
    
    func oGanhador() -> Competidor {
        let index = Int(arc4random_uniform(UInt32(self.listaCompetidores.count-1)))
        return self.listaCompetidores[index]
    }
    func socorrer(umaPlaca: String) {
        
    }
}
protocol  FuncionalidadeCorrida {
    func adicionarCarro(velocidade:Int,aceleracao:Int,giro:Int,placa:String) -> Void;
    func adicionarMoto(velocidade:Int,aceleracao:Int,giro:Int,placa:String)  -> Void;
    func eliminarCompetidor(competidor:Competidor)  -> Void
    func eliminarCompetidor(umaPlaca:String)  -> Void
    func oGanhador()  -> Competidor
    func socorrer(umaPlaca:String) -> Void
}

class Categoria : Competidor {
    var peso : Int
    var rodas : Int
    init(peso:Int, rodas:Int) {
        self.peso = peso
        self.rodas =  rodas
    }
}
class Carro: Categoria {
     init() {
        super.init(peso: 1000, rodas: 4)
    }
}
class Moto: Categoria {
     init() {
        super.init(peso: 300, rodas: 2)
    }
}

class SocorristaCarro : FuncionalidadesSocorrista{

    
    func socorrer(umCompetidor: Competidor) {
        if umCompetidor is Moto{
           print("Socorrendo Moto , placa:"+umCompetidor.placa)
       }

    }
    
    
}
class SocorristaMoto: FuncionalidadesSocorrista{

    func socorrer(umCompetidor: Competidor) {
        if umCompetidor is Carro {
            print("Socorrendo Carro , placa:"+umCompetidor.placa)
        }
    }
    
    
}

protocol FuncionalidadesSocorrista{
    func  socorrer(umCompetidor:Competidor)

}
