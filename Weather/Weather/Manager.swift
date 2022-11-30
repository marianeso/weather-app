//
//  Manager.swift
//  Weather
//
//  Created by Wellington on 15/11/22.
//

import Foundation

class WeatherManager {
    
    
    func  fetchWeatherWithCompletion(lat: Double, long: Double, completion: @escaping (WeatherData?)->Void) {

        //urlCOmponents: URL customizada
        let baseURL = "https://api.openweathermap.org/data/2.5/weather?"
        let lat = "lat=" + String(lat)
        let long = "&lon=" + String(long)
        let appid = "&appid=c42972387f816eee5477381c9410f824&units=metric"
        
        let weatherURL = baseURL + lat + long + appid

        guard let url = URL(string: weatherURL) else {
            return
        }
            
        let request = URLRequest(url: url)
        
        //completion: estou aguardando a resposta do servidor. Funcao para fazer a requisicao para o servidor, pedir um dado.
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            //transformacao. DE PARA. DE dados do JSON para o response (classe principal), onde ficara armazenado os dados
            //PopularMovieResponse: Pega o dado da requicao, parce do dado completo.
            //Completion (nil): Se o response der erro, a completion vai retornar nulo
            guard let data = data,
                    let response = try? JSONDecoder().decode(WeatherData.self, from: data) else {
                    completion(nil)
                return
            }
            
            //avisar e devolver para a classe que esta esperando o dado que ele chegou
            //response é a variavel que pega a requisicao, e o .results é o [PopularMovie] que definimos no parametro acima.
            completion(response)
            
        }
        task.resume()
    }
}

