//
//  BusquedaManager.swift
//  Mi Cartelera
//
//  Created by Erinson Andres Romero Terry on 16/12/22.
//

import Foundation
protocol BusquedaDelegate {
    func didUpdateBusqueda(_ movie: [Results])
    func didFailWithErrorBusqueda(error: Error)
}
struct BusquedaSeries {
    let tmdbURL = "https://api.themoviedb.org/3/search/tv?"
    let key = "api_key=25ade025b619d5e50b642ab3f95baf95&language=es-MX&page=1&include_adult=false&query="
    var delegate: BusquedaDelegate?
    func Tipo(tipo: String) {
        let urlString = "\(tmdbURL)\(key)\(tipo)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String){
        // creo un url
        if let url = URL(string: urlString) {
            //creo un urlsession
            let session = URLSession(configuration: .default)
            //doy una tarea a la session
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    delegate?.didFailWithErrorBusqueda(error: error!)
                    return
                }
                if let safeData = data {
                    if  let cartelMostrar = self.parseJSON(movieData: safeData) {
                        self.delegate?.didUpdateBusqueda(cartelMostrar)
                    }
                }
            }//aqui el session toma todos los datos de la pagina
            // inicio la sesion
            task.resume()
        }
    }
    
    func parseJSON(movieData: Data) -> [Results]? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(UltimosData.self, from: movieData)
            let resultados = decodedData.results// aqui se descomprime
            return resultados
        } catch {
            delegate?.didFailWithErrorBusqueda(error: error)
            return nil
        }
    }
    
}
