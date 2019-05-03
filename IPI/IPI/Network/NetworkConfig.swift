//
//  NetworkConfig.swift
//  IPI
//
//  Created by Felipe Zamudio on 29/04/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper
import ObjectMapper
import SwiftyJSON

/// Se establecen las configuraciones básicas de Headers para los métodos POST, PUT y GET
class Network: NSObject {

    /**
     Config the request.

     Add header of content type, appi-id  and accept; the optional headers are authorization, DEVICEID.
     If the request requires a body, it adds it

     - Parameter url: url of the enpoint api
     - Parameter json: String in JSON format with the body data, if the request don't have body this field is *Empty*
     - Parameter method: Rest Method (**GET**, **POST**, **PUT**)
     - Parameter extraHeaders: Array with the optional headers
     */
    class func setupRequest(_ url: String, json: String!, extraHeaders: [[String: String]], method: NetworkRestMethods) -> URLRequest! {

        var request = URLRequest(url: URL(string: url)!)
        printDebugMessage(tag: "\(request)")

        request.httpMethod = method.rawValue
        request.setValue(NetworkConfig.apiKey, forHTTPHeaderField: NetworkConfig.headerApikey)
        request.setValue(NetworkConfig.appJson, forHTTPHeaderField: NetworkConfig.headerAccept)
        request.setValue(NetworkConfig.appJson, forHTTPHeaderField: NetworkConfig.headerContentType)

        for header in extraHeaders {
            request.setValue(header[NetworkConfig.headerValue], forHTTPHeaderField: header[NetworkConfig.headerName]!)
        }

        if json != nil && !json.isEmpty {
            request.httpBody = json.data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
            print(json!)
        }

        return request
    }

    /**
     Crea url del api a consumir, y establece los parametros de configuración de la solicutud; si no hay error en la configuración
     de la solucitud se envia al servidor

     - Parameter urlApi: EndPoint de la capacidad a consumir
     - Parameter json: String en formato *JSON* con el cuerpo de la solicitud, si la solicitud no requiere de un cuerpo este valor debe ser vacio
     - Parameter extraHeaders: Arreglo *clave : valor* con los encabezado y sus respectivos valores, si la solicitus no requiere de header adicionales, se debe enviar el arreglo vacio
     - Parameter method: Metodo REST *(GET, POST, PUT)*
     - Parameter completion: (callBack)
     */
    class func buildRequest (urlApi: String, json: String!, extraHeaders: [[String: String]], method: NetworkRestMethods, completion: @escaping (ResponseCallback) -> ()) {

        let url = [NetworkConfig.urlAccess, urlApi].compactMap{$0}.joined(separator: "")

        guard let request = setupRequest(url, json: json!, extraHeaders: extraHeaders, method: method) else {
            completion(ResponseCallback.error(error: CustomError.NoData(description: NetworkErrorMessage.createRequestError)))
            return
        }

        sendRequest(request: request, completion: completion)
    }

    /**
     Función para procesar el request, y retornar la respuesta por medio del callback

     - Parameter request: *URLRequest* con la configuración de *Headers*, *Parameters* y *EndPoints*
     - Parameter completion: Callback
     */
    class func sendRequest (request: URLRequest, completion: @escaping (ResponseCallback) -> ()) {

        Alamofire.request(request).responseJSON { response in

            guard response.response != nil else {
                completion(ResponseCallback.succeeded(succeed: false, message: NetworkErrorMessage.notConexionError))
                return
            }

            guard let data = response.data, let _ = String(data: data, encoding: .utf8) else {
                completion(ResponseCallback.error(error: CustomError.NoData(description: NetworkErrorMessage.parsingResultError)))
                return
            }

            guard let resp = response.response else {
                completion(ResponseCallback.error(error: CustomError.NoData(description: NetworkErrorMessage.nilResponseError)))
                return
            }

            printDebugMessage(tag: String(resp.statusCode))

            let JSONResponse = response.result.value

            var result: Bool = false
            var message = nullString

            switch resp.statusCode {
            case NetworkCodes.successful, NetworkCodes.created:
                result = true
                completion(ResponseCallback.succeededObject(result: JSONResponse as AnyObject))
                break

            case NetworkCodes.internalServerError:
                result = false
                message = NetworkErrorMessage.internalServerError
                completion(ResponseCallback.succeeded(succeed: result, message: message))
                break

            case NetworkCodes.notFound:
                result = false
                message = JSONResponse != nil ? getErrorMSN(json: JSONResponse! as! [String : Any]) : NetworkErrorMessage.notConexionError
                completion(ResponseCallback.succeeded(succeed: result, message: message))
                break

            default:
                result = false
                message =  JSONResponse != nil ? getErrorMSN(json: JSONResponse! as! [String : Any]) : NetworkErrorMessage.msnDefaultError
                completion(ResponseCallback.succeeded(succeed: result, message: message))
                break
            }
        }
    }

    /**
     Función para obtener el mensaje de error

     - Parameter json: Respuesta del servidor parseada como [String:Any]
     - Returns: Detalle del error
     */
    class func getErrorMSN(json: [String:Any]) -> String {

        if json[JSONKeys.detail] != nil {
            return json[JSONKeys.detail] as! String
        }
        else if json[JSONKeys.birthdate] != nil {
            return NetworkErrorMessage.BirthdateFormatError
        }
        else {
            return NetworkErrorMessage.msnDefaultError
        }
    }

}
