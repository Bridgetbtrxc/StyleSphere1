import Foundation
import SwiftData
import SwiftUI

@Model
class WardrobeItem {
    // Categories for the wardrobe items
    @Transient static let categories = ["Pants", "Skirt", "Clothing", "Shirt", "T-Shirt", "Sandal", "Shoes"]
    
    var id: UUID = UUID()
    var category: String
    var name: String
    var color: String
    @Attribute(.externalStorage) var image: Data?
      
    init(name: String = "", category: String = "", color: String = "", image: Data? = nil) {
        self.name = name
        self.category = category
        self.color = color
        self.image = image
       // self.imageData = imageData
}
//class LooksItem{
//    let name: String
//    var items: [WardrobeItem]
//    
//    init(name: String, items: [WardrobeItem]) {
//        self.name = name
//        self.items = items
//    }
//}


    
//    @Transient
//    var image: Image? {
//        if let data = imageData, let uiImage = UIImage(data: data) {
//            return Image(uiImage: uiImage)
//        }
//        return nil
//    }
}
