//
//  SportDBService.swift
//  MVP
//
//  Created by Fromage Charley on 24/10/2019.
//  Copyright © 2019 Voodoo Coding. All rights reserved.
//

import Alamofire

class SportDBService {
    func getTeamsList(for country: String, completion: @escaping (Teams?, Error?) -> Void) {
        let urlString = String(format: Constants.APIs.sportDBAPIBaseURL, Configuration.APIs.sportDBAPIKey) + String(format: Constants.APIs.sportDBAPISearchTeamsEndPoint, country)

        Alamofire.request(urlString).responseJSON { response in
            #if DEBUG
            print("Result: \(response.result)")
            #endif

            guard let data = response.data, let entity: Teams = try? JSONDecoder().decode(Teams.self, from: data) else {
                #if DEBUG
                print("Error parsing \(Teams.self)")
                #endif

                return
            }

            completion(entity, response.error)
        }
    }
}
