//
//  ContentView.swift
//  My To Do
//
//  Created by Swapnil on 04/12/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    //used to perform crud operations
    @Environment(\.modelContext)
         private var modelcontext
    
    
    
    @Query private var lists: [Notes]
    
    @State private var title: String = ""
    @State private var isAlertShowing: Bool = false
    var body: some View {
        NavigationStack{
            List {
                ForEach(lists)
                {
                    list in
                    Text(list.title)
                        .font(.title3)
                        .fontWeight(.light)
                        .padding(.horizontal, 2)
                        .padding(.vertical, 2)
                        .swipeActions{
                            Button("Delete", role: .destructive){
                                modelcontext
                                    .delete(list)
                            }
                        }
                }
            }
            .navigationTitle("My ToDo")
            .toolbar{
                ToolbarItem(placement:
                        .topBarTrailing){
                        Button{
                            isAlertShowing.toggle()
                        } label:{
                            Image(systemName: "plus.circle")
                                .imageScale(.large)
                        }
                    }
           
               }
            .alert("create a new wish", isPresented: $isAlertShowing){
                         TextField("Enter a list",text: $title)
                
                Button(){
                    modelcontext.insert(Notes(title:title))
                    title = " "
                    
                }label :{
                    Text("Save")
                }
                .disabled(title.isEmpty)
            }
           
            .overlay{
                if lists.isEmpty {
                    ContentUnavailableView("My lists are unavailabe",systemImage: "plus.circle.fill",description: Text("No lists yet. Add one to get started."))
                }
            }
        }
        
    }
}

#Preview("second list"){
    
        let container = try! ModelContainer(for: Notes.self,configurations:
                                            ModelConfiguration(isStoredInMemoryOnly: true))
        
        let context = container.mainContext
    
        
       context.insert(Notes(title: "Swift Coding Club"))
       context.insert(Notes(title: "good morning"))
       context.insert(Notes(title: "good afternoon"))
        
       return ContentView()
        .modelContainer(container)
    }
#Preview("Main List") {
        ContentView()
            .modelContainer(for: Notes.self,inMemory: true)
    }

