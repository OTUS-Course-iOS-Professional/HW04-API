//
// WeatherSearchAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

open class WeatherSearchAPI {

    /**
     Weather Search
     
     - parameter query: (query) search query (optional)
     - parameter lattlong: (query) Latitude longitude (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func weatherSearch(query: String? = nil, lattlong: [Double]? = nil, apiResponseQueue: DispatchQueue = OpenAPIClient.apiResponseQueue, completion: @escaping ((_ data: [Location]?, _ error: Error?) -> Void)) {
        weatherSearchWithRequestBuilder(query: query, lattlong: lattlong).execute(apiResponseQueue) { result -> Void in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Weather Search
     - GET /location/search/
     - parameter query: (query) search query (optional)
     - parameter lattlong: (query) Latitude longitude (optional)
     - returns: RequestBuilder<[Location]> 
     */
    open class func weatherSearchWithRequestBuilder(query: String? = nil, lattlong: [Double]? = nil) -> RequestBuilder<[Location]> {
        let localVariablePath = "/location/search/"
        let localVariableURLString = OpenAPIClient.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "query": query?.encodeToJSON(),
            "lattlong": lattlong?.encodeToJSON(),
        ])

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<[Location]>.Type = OpenAPIClient.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }
}
