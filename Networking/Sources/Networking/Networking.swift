import Foundation

protocol INetworkSevice: AnyObject {
    func request(path: String, completion: @escaping (Data?, Error?) -> Void)
}

public class NetworkService: INetworkSevice {
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
    
    lazy var urlSession: URLSession? = {
        return URLSession.shared
    }()
    
    public init() {}
    
    public func doTest() {
        print("testing...")
    }
}
