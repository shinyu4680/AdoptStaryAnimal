//
//  AnimalController.swift
//  AdoptStaryAnimal
//
//  Created by kevin on 2018/5/27.
//  Copyright © 2018 KevinChang. All rights reserved.
//

import Foundation
import UIKit

class AnimalController{
    static let shared = AnimalController()
    
    func fetchAnimal(completion: @escaping ([Animal]?) -> Void) {
        
    }
    
    func fetchImage(url: URL, completion: @escaping (UIImage?) -> Void) {
        let task = URLSession.shared.dataTask(with: url) {(data, response, error)in
            if let data = data,
                let image = UIImage(data: data){
                completion(image)
            }else {
                completion(nil)
            }
        }
        task.resume()
    }
}

func translateSter(input: String) -> String{
    var output: String?
    if input == "T"{
        output = "是"
    }else if input == "F"{
        output = "否"
    }else if input == "N"{
        output = "未輸入"
    }
    return output!
}

func translate(input: String) -> String{
    var output: String?
    if input == "M"{
        output = "男生"
    }else if input == "F"{
        output = "女生"
    }else if input == "N"{
        output = "未輸入"
    }else if input == "MINI"{
        output = "迷你"
    }else if input == "SMALL"{
        output = "小型"
    }else if input == "MEDIUM"{
        output = "中型"
    }else if input == "BIG"{
        output = "大型"
    }else if input == "CHILD"{
        output = "幼年"
    }else if input == "ADULT"{
        output = "成年"
    }else if input == "NONE"{
        output = "未公告"
    }else if input == "OPEN"{
        output = "開放認養"
    }else if input == "ADOPTED"{
        output = "已認養"
    }else if input == "OTHER"{
        output = "其他"
    }else if input == "DEAD"{
        output = "死亡"
    }
    return output!
}
