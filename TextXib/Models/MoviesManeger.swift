//
//  MoviesModel.swift
//  TextXib
//
//  Created by Zaggle on 17/10/22.
//

import Foundation
import Alamofire

protocol movieManegerDelegate{
    func didUpdatedNowShowing(movie: MovieModel)
    func didUpdateMovies()
    func didFailWithError(error:Error)
}
class MovieManeger{
    
    var movies = [MovieModel]()
    let apiEndpoint = "https://api.themoviedb.org/3/movie/now_playing?language=en-US&api_key=55957fcf3ba81b137f8fc01ac5a31fb5"
    
    var delegate:movieManegerDelegate?
//    let rVC = rootViewController()
    func fetchNowShowing(){
        
        performReq(url: apiEndpoint)
    }
    func performReq(url:String){
        
        AF.request(url).response{response in
            let x = self.parseJSON(response.data ?? Data())

        }
    }
    
    
    
    func parseJSON(_ movieData: Data) -> [Movie]?{
        let decoder = JSONDecoder()
        
        do{
        
        
        let decodedData = try decoder.decode(MovieData.self, from: movieData)

            return decodedData.results
        }catch{
            print(error)
            return nil
        }
    }
    
    

        
    func getData(completion handler: @escaping ([Movie]?) -> Void,pageNo:Int) {
       let  api = self.apiEndpoint + "&page=\(pageNo)"
            AF.request(api).response{response in
                    let x = self.parseJSON(response.data ?? Data())
                if x?.count != 0 {
                        
                       handler(x)  /// <===
                    }
                }
            }
        
    
}
