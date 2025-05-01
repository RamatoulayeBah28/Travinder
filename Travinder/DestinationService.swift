//
//  DestinationService.swift
//  Travinder
//
//  Created by Ramatoulaye Bah on 29/04/2025.
//

import Foundation

class TripAdvisorAPI {
    static let apiKey = "261129F7A12343CDB3F4B1C71B003FBE"
    static let baseURL = "https://api.content.tripadvisor.com/api/v1/"
    
    func fetchLocationID(for city: String, completion: @escaping (Int?) -> Void) {
        let query = city.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? city
        let urlString = "\(TripAdvisorAPI.baseURL)location/search?key=\(TripAdvisorAPI.apiKey)&q=\(query)&language=en"

        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                completion(nil)
                return
            }

            do {
                let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
                if let dataArray = json?["data"] as? [[String: Any]],
                   let first = dataArray.first,
                   let locationIDString = first["location_id"] as? String,
                   let locationID = Int(locationIDString) {
                    completion(locationID)
                } else {
                    completion(nil)
                }
            } catch {
                print("Error parsing JSON: \(error)")
                completion(nil)
            }
        }.resume()
    }
    
    func fetchLocationDetails(locationID: Int, completion: @escaping ([String: Any]?) -> Void) {
        let urlString = "\(TripAdvisorAPI.baseURL)location/\(locationID)/details?key=\(TripAdvisorAPI.apiKey)&language=en&currency=USD"

        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                completion(nil)
                return
            }

            do {
                let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
                completion(json)
            } catch {
                print("Error parsing JSON: \(error)")
                completion(nil)
            }
        }.resume()
    }
    
    func getDestinationDetails(for city: String) {
        fetchLocationID(for: city) { locationID in
            guard let locationID = locationID else {
                print("Failed to get location ID for \(city)")
                return
            }

            self.fetchLocationDetails(locationID: locationID) { details in
                if let details = details {
                    let description = details["description"] as? String ?? "No description"
                    let priceLevel = details["price_level"] as? String ?? "N/A"
                    let groups = (details["groups"] as? [[String: Any]])?.compactMap { $0["name"] as? String } ?? []

                    print("\(city) Details:")
                    print("Description: \(description)")
                    print("Price Level: \(priceLevel)")
                    print("Activities: \(groups.joined(separator: ", "))")
                }
            }
        }
    }



}
