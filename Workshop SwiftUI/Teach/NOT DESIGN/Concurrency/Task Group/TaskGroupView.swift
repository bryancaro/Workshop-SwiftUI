//
//  TaskGroupView.swift
//  AsyncAwait
//
//  Created by Bryan Caro on 6/11/22.
//

import SwiftUI

struct TaskGroupView: View {
    //  MARK: - Environment
    //  MARK: - Observed Object
    //  MARK: - (Binding-State) variables
    @StateObject private var vm = TaskGroupViewModel()
    //  MARK: - Variables
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    //  MARK: - Principal View
    var body: some View {
        ZStack {
            LazyVGrid(columns: columns, spacing: 50) {
                ForEach(vm.data, id: \.self) { uiImage in
                    Image(uiImage: uiImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 150, height: 150)
                        .mask(RoundedRectangle(cornerRadius: 30))
                        .shadow(color: Color.black.opacity(0.4), radius: 12, x: 20, y: 20)
                }
            }
        }
        .onAppear(perform: vm.onAppear)
        .onDisappear(perform: vm.onDisappear)
    }
    //  MARK: - Properties
}

//  MARK: - Actions
extension TaskGroupView {}

//  MARK: - Local Components
extension TaskGroupView {}

//  MARK: - Preview
struct TaskGroupView_Previews: PreviewProvider {
    static var previews: some View {
        TaskGroupView()
    }
}
