import Foundation

protocol INetworkSevice: AnyObject {
    func request(path: String, completion: @escaping (Data?, Error?) -> Void)
}

public class NetworkService: INetworkSevice {
    public init() {}
    
    lazy var urlSession: URLSession? = {
        return URLSession.shared
    }()
    
    public func request(path: String, completion: @escaping (Data?, Error?) -> Void) {
        print("do your request")
        guard let url = URL(string: path) else {
            return
        }
        let request = URLRequest(url: url)
        let task = urlSession?.dataTask(with: request) { data, _ , error  in
            completion(data, error)
        }
        task?.resume()
    }

}

protocol IParsingJsonService: AnyObject {
    func parseJson<T: Codable>(data: Data?, completion: @escaping (T?) -> Void)
}

public class ParsingJsonService: IParsingJsonService {
    public var saved: Any?
    public init() {}
    public func parseJson<T: Codable>(data: Data?, completion: @escaping (T?) -> Void) {
        if let data = data {
            let decoder = JSONDecoder()
            if let json = try? decoder.decode(T.self, from: data) {
                saved = json
            }
        }
    }
}
