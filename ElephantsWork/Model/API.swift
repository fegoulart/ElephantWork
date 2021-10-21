//
//  API.swift
//  ElephantsWork
//
//  Created by Jackeline Pires de Lima on 18/10/21.
//

import Foundation

struct API {
    
    // https://elephant-api.herokuapp.com/elephants
    
    let baseURL = "https://elephant-api.herokuapp.com"
    
    /// Retorna URL
    private var elephantsURL: String {
        return "\(self.baseURL)/\(EndPoints.elephants)"
    }
    
    //    ///Retorna sexo dos elefantes
        func setSexURL(sex: String) -> String {

            return "\(self.baseURL)/\(EndPoints.sex)/\(sex)"
        }
    
//    ///Retorna nome dos elefantes
//    func setNameURL() -> String {
//
//        return "\(self.baseURL)/\(EndPoints.name)"
//    }
//
//    ///Retorna imagem do elefantes
//    func setRandomURL() -> String {
//
//        return "\(self.baseURL)/\(EndPoints.random)"
//    }
//

//
//    ///Retorna especies do elefantes
//    func setSpeciesURL() -> String {
//
//        return "\(self.baseURL)/\(EndPoints.species)"
//    }
    
    
    
    func getElephants(completion: @escaping ([Elephant]?, Error?) -> Void) {
        
        // Criar array de elefante
        var arrayDeElefantes : [Elephant] = []
        // Configura sessão
        let config: URLSessionConfiguration = .default
        // Sessão
        let session: URLSession = URLSession(configuration: config)
        // URL
        guard let url: URL = URL(string: self.elephantsURL) else {
            completion(nil, ErrorAPI.noURL)
            return
        }
        // URL Request
        var urlRequest: URLRequest = URLRequest(url: url)
        // URL Request -> Method (GET)
        urlRequest.httpMethod = "\(HTTPMethod.GET)"
        // EXEC request HTTP
        let task = session.dataTask(with: urlRequest, completionHandler: { (result, urlResponse, error) in
            
            var statusCode: Int = 0
            if let response = urlResponse as? HTTPURLResponse {
                statusCode = response.statusCode
            }
            
            guard let data = result else {
                completion(nil, ErrorAPI.noData)
                return
            }
            print(urlRequest)
            do {
                // criar um decoder
                let decoder : JSONDecoder = JSONDecoder()
                // decodificar
                let decodeData: [Elephant] = try decoder.decode([Elephant].self, from: data)
                arrayDeElefantes = decodeData
                completion(arrayDeElefantes, nil)
                
            } catch let error {
                // error
                debugPrint("Status code: \(statusCode), Error: \(error.localizedDescription)")
                completion(nil, ErrorAPI.decodeFailed)
            }
            
        })
        
        task.resume()
    }
    
}



