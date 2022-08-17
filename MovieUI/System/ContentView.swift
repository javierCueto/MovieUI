//
//  ContentView.swift
//  MovieUI
//
//  Created by Javier Cueto on 10/08/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    let url = URL(string: "https://jsonplaceholder.typicode.com/users")
    
    init() {
        call()
    }
    
    private func call() {
        Task {
            let data = await fetch()
            switch data {
                
            case .success(let response):
                print(response)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    struct User: Decodable {
        let id: Int
    }
    
    private func fetch() async -> Result<[User], Error>{
//        guard let url = url else {
//            return Result.failure(URLError(.badServerResponse))
//        }
//        
        //let (data, response) =  try! await URLSession.shared.data(from: url)

        
        await withCheckedContinuation { continuation in
            guard let url = url else {
                return continuation.resume(returning: Result.failure(URLError(.badServerResponse)))
            }

                let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
                    guard let data = data else {
                        return continuation.resume(returning: Result.failure(URLError(.badServerResponse)))
                    }
                    
                    do {
                        let users = try JSONDecoder().decode([User].self,from: data)
                        continuation.resume(returning: Result.success(users))
                    }catch {
                        return continuation.resume(returning: Result.failure(URLError(.badServerResponse)))
                    }
            
                }
 
            dataTask.resume()
        }
       
    }

    var body: some View {
        NavigationView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        Text("Item at \(item.timestamp!, formatter: itemFormatter)")
                    } label: {
                        Text(item.timestamp!, formatter: itemFormatter)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
            Text("Select an item")
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
