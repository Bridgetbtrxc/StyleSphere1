//
//  SwiftDataModelPreview.swift
//  StyleSphere
//
//  Created by Macbook on 02/06/24.
//

import SwiftUI
import SwiftData

struct ModelPreview<Model: PersistentModel, Content: View>: View {
    
    var content: (Model) -> Content
    
    init(@ViewBuilder content: @escaping (Model) -> Content) {
        self.content = content
    }
    
    var body: some View {
        PreviewContentView(content: content)
            .modelContainer(SwiftDataModel.container)
    }
    
    struct PreviewContentView: View {
        
        @Query private var models: [Model]
        var content: (Model) -> Content
        
        @State private var waitedToShowIssue = false
        
        var body: some View {
            if let model = models.first {
                content(model)
            } else {
                ContentUnavailableView("Could not load model for previews", systemImage: "xmark")
                    .opacity(waitedToShowIssue ? 1 : 0)
                    .task {
                        Task {
                            try await Task.sleep(for: .seconds(1))
                            waitedToShowIssue = true
                        }
                    }
                
            }
        }
    }
    
}
