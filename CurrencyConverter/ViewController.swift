//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Ислам Пулатов on 5/28/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var usdLabel: UILabel!
    @IBOutlet var aedLabel: UILabel!
    @IBOutlet var uzsLabel: UILabel!
    @IBOutlet var tryLabel: UILabel!
    @IBOutlet var rubLabel: UILabel!
    @IBOutlet var cadLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        view.backgroundColor = UIColor.black
        
    }


    @IBAction func getRatesButton(_ sender: Any) {
        
        guard let url = URL(string: "http://data.fixer.io/api/latest?access_key=7c9d698c8a6be18631b9c66dc969722e") else {
            
            print("Error Accessing the url")
            
            return
            
        }
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) { data, response, error in
            
            if error != nil {
                
                let alert = UIAlertController(title: "Error occurs!", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                
                let ok = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default)
                
                alert.addAction(ok)
                
                self.present(alert, animated: true)
                
                
            } else {
                
                if data != nil {
                    
                    do {
                        let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String , Any>
                        
                        DispatchQueue.main.async {
                            
                            if let rates = jsonResponse["rates"] as? [String : Any] {
                                
                                if let usd = rates["USD"] as? Double {
                                    
                                    self.usdLabel.text = "USD -   \(usd)"
                                    
                                }
                                
                                if let aed = rates["AED"] as? Double {
                                    
                                    self.aedLabel.text = "AED -   \(aed)"
                                    
                                }
                                
                                if let uzs = rates["UZS"] as? Double {
                                    
                                    self.uzsLabel.text = "UZS -   \(uzs)"
                                    
                                }
                                
                                
                                if let turklyr = rates["TRY"] as? Double {
                                    
                                    self.tryLabel.text = "TRY -    \(turklyr)"
                                    
                                }
                                
                                
                                if let rub = rates["RUB"] as? Double {
                                    
                                    self.rubLabel.text = "RUB -    \(rub)"
                                    
                                }
                                
                                if let cad = rates["CAD"] as? Double {
                                    
                                    self.cadLabel.text = "CAD -    \(cad)"
                                    
                                }
                                
                                
                            }
                            
                            
                        }
                        
                    } catch {
                        
                        print("Error")
                        
                    }
                    
                }
                
            }
            
        }
        
        task.resume()
        
        
    }
}

