//
//  FirebaseMockNetworkManager.swift
//  MoviesSearchTests
//
//  Created by Admin on 28/03/2022.
//

import Foundation
@testable import MoviesSearch

//class FirebaseMockNetworkManager: FirebaseNetworkManagerType {
class FirebaseMockNetworkManager {
    var dataResponce: String = ""
    func validateFields(userEmail: String?, password: String?, fileName: String?)-> Void {
             
         let bundle = Bundle(for: FirebaseMockNetworkManager.self)
        guard let url = bundle.url(forResource: fileName, withExtension:".json") else {
             return
         }
         
         do {
             let data = try Data(contentsOf: url)
             let decoded = JSONDecoder()
             do{
                 print(data)
                 let decodedResponce = try decoded.decode(FirebaseResponce.self, from: data)
                 
                 dataResponce = decodedResponce.responce
                 print(dataResponce)

             }catch{
                 print(error.localizedDescription)
             }
         }catch {
             
         }
        
     }
    
}
