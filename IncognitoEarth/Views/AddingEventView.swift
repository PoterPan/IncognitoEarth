//
//  AddingEventView.swift
//  IncognitoEarth
//
//  Created by Poter Pan on 2022/6/22.
//

import SwiftUI

struct AddingEventView: View {
//    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var eventListVM: EventListViewModel
    
    @State var newImage: String = ""
    @State var newName: String = ""
    @State var newDate: Date = Date()
    @State var newType: String = ""
    let types = ["環境保護","市容維護","其他"]
    @State private var selectedName = "其他"
    @State var newLocation: String = ""
    @State var newDescription: String = ""
    
    @State private var isShowPhotoLibrary = false
    @State private var imgSelected = UIImage()
    
    @FocusState private var isFocused: Bool
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    

    
    var body: some View {
        ScrollView {
            VStack() {
                
                ZStack(){
                    RoundedRectangle(cornerRadius: 10)
                        .frame(maxWidth: .infinity, minHeight: 120)
                        .foregroundColor(Color.gray.opacity(0.5))
                    
                    Button {
                        //
                    } label: {
                        HStack{
                            Image(systemName: "plus.square.on.square")
                            Text("新增封面照片")
                        }
                        .foregroundColor(.black)
                        .padding(8)
                        .background(.white)
                        .cornerRadius(10)
                    }
                    
                    

                    
                }
                .sheet(isPresented: $isShowPhotoLibrary) {
                    ImagePicker(sourceType: .camera, selectedImage: self.$imgSelected)
                }

                HStack {
                    TextField("活動名稱", text: $newName)
                        .frame(maxWidth: .infinity, minHeight: 50)
//                        .background(Color(UIColor.secondarySystemBackground))
                        .font(.title.bold())
                        .cornerRadius(10)
                        .focused($isFocused)
                    
                }

                HStack {
                    Text("類型：")
                    Spacer()
                    Picker(selection: $selectedName) {
                        ForEach(types, id: \.self) { type in
                            Text(type)
                        }
                    } label: {
                        Text("選擇類型")
                    }
                    .pickerStyle(.menu)
                    .padding(3)
                    .padding(.horizontal, 10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.accentColor, lineWidth: 3)
                    )
                }
                
                HStack {
                    DatePicker("活動時間：", selection: $newDate)
                        .cornerRadius(10)
                        .focused($isFocused)
                    
                }
                HStack {
                    Text("地點：")
                    TextField("", text: $newLocation)
                        .frame(maxWidth: .infinity, minHeight: 35)
                        .background(Color(UIColor.secondarySystemBackground))
                        .cornerRadius(10)
                        .focused($isFocused)
                    
                }
                
                HStack {
                    Text("說明：")
                    ZStack {
                        TextEditor(text: $newDescription)
                            .frame(maxWidth: .infinity, minHeight: 35)
                            .cornerRadius(10)
                            .colorMultiply(Color(UIColor.secondarySystemBackground))
                            .focused($isFocused)
                        Text(newDescription).opacity(0).padding(.all, 8)
                    }
                }
                
                
                
                Button (action: {
                    saveButtonPressed()
                    isFocused = false
                })
                {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                        .padding()
                    
                }
                
                
            }
            .padding(16)
            .navigationTitle("新增物品")
            .navigationBarTitleDisplayMode(.inline)
            .alert(isPresented: $showAlert, content: getAlert)
            .toolbar{
                ToolbarItemGroup(placement: .navigationBarLeading){
                    //                    closeView
                    Button(action: {
                        
                        isFocused = false
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.black)
                    }
                }
                ToolbarItemGroup(placement: .navigationBarTrailing){
                    //                    saveData
                    Button (action: {
                        saveButtonPressed()
                        isFocused = false
                    })
                    {
                        Image(systemName: "checkmark.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.black)
                        
                    }
                }
            }
        }
    }
    
    func saveButtonPressed() {
        if textIsExist() {
            if imgSelected.size.width == 0 {
                imgSelected = UIImage(systemName: "photo.fill")!
            }
            
//            let imageData = imgSelected.jpegData(compressionQuality: 0.01)
            let newEvent = EventModel(name: newName, description: newDescription, date: newDate, organiser: "a", type: newType, location: newLocation)
            eventListVM.create(newEvent)

            
            
//            itemViewModel.addItem(name: newName, type: newType, price: newPrice, purchaseDate:newPurchaseDate, haveExp: newhaveExp, exp: newExp, image: image)

        }
        
    }
    
    func textIsExist() -> Bool {
        if newName.count < 1 {
            alertTitle = "請輸入產品名稱"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title:  Text(alertTitle))
    }
}

struct AddingEventView_Previews: PreviewProvider {
    static var previews: some View {
        AddingEventView(eventListVM: EventListViewModel())
    }
}
