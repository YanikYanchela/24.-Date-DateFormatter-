import UIKit

struct City {
    let country: String
    let city: String
    let utc: String
    let time: String
}

protocol AddWorldTimeDelegate: AnyObject {
    func didAddWorldTime(_ worldTime: WorldTime)
        
}

class AddWorldTimeTableViewController: UIViewController {
    
    var cityArray = [City]()

   
    weak var delegate: AddWorldTimeDelegate?
  
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
      
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        printAllTimeZonesAndUTC()
        
    }
    

    private func setupTableView() {
    
        tableView.backgroundColor = .systemGray
      
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor)
        ])
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }

    func printAllTimeZonesAndUTC() {
        let timeZones = TimeZone.knownTimeZoneIdentifiers
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        cityArray.removeAll()

        for timeZoneIdentifier in timeZones {
            if let timeZone = TimeZone(identifier: timeZoneIdentifier) {
                let country = (timeZone.identifier as NSString).components(separatedBy: "/").first ?? ""
                let city = (timeZone.identifier as NSString).components(separatedBy: "/").last?.replacingOccurrences(of: "_", with: " ") ?? ""
                
                // Получение UTC для данной временной зоны
                let utcOffsetSeconds = timeZone.secondsFromGMT()
                let utcOffsetHours = Double(utcOffsetSeconds) / 3600
                let utc = String(format: "GMT %+.1f", utcOffsetHours)
                
                // Получение текущего времени для данной временной зоны
                dateFormatter.timeZone = timeZone
                let currentTime = Date()
                let time = dateFormatter.string(from: currentTime)
                
                let cityInstance = City(country: country, city: city, utc: utc, time: time)
                cityArray.append(cityInstance)
            }
        }
//        tableView.reloadData()
    }
    
}

extension AddWorldTimeTableViewController:  UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityArray.count
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let city = cityArray[indexPath.row]
        cell.textLabel?.text = "\(city.city), \(city.country)"
        return cell
       
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCity = cityArray[indexPath.row]
       
        let worldTime = WorldTime(name: selectedCity.city, UTC: selectedCity.utc, time: selectedCity.time)
        
        self.dismiss(animated: true, completion: nil)
        
        delegate?.didAddWorldTime(worldTime)

    }
    
}
  
