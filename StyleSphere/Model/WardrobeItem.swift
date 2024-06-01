import Foundation
import SwiftData
import SwiftUI

@Model
class WardrobeItem {
    var id: UUID = UUID()
    var category: String
    var name: String
    var color: String
    var imageData: Data?
    
    init(name: String, category: String, color: String, imageData: Data? = nil) {
        self.name = name
        self.category = category
        self.color = color
        self.imageData = imageData
    }
    
    var image: Image? {
        if let data = imageData, let uiImage = UIImage(data: data) {
            return Image(uiImage: uiImage)
        }
        return nil
    }
}
