//
//  Individual.swift
//  MyWarikan
//
//  Created by Koki on 2022/12/03.
//

import SwiftUI

struct Individual: View {
    @State var addingItems:[Any] = [""]
    @State var memos:[String] = [""]
    @State var howMuchs:[String] = [""]
    
    @State var memberArray:[String] = [""]
    @State var spentMoney: Int = 0
    
    @Binding var isPresentedIndividual: Bool
    
    var body: some View {
        NavigationView{
            ZStack{
                Color("Color3")
                    .ignoresSafeArea()
                VStack{
                    HStack {
                        Text("  ¥ : \(spentMoney)")
                            .font(.system(size:20))
                            .frame(width: 130,height: 30,alignment: .leading)
                            .border(Color.black,width: 3)
                            .background(Color.white)
                            .padding(.vertical)
                        
                        Spacer()
                        
                        
                        Button(action:{

                        }){
                            Image(systemName: "goforward.plus")
                                .font(.system(size:30))
                                .foregroundColor(Color.blue)
                                .bold()
                        }
                        
                        
                        Button(action:{
                            addingItems.append("")
                            memos.append("")
                            howMuchs.append("")
                            
                        }){
                            Image(systemName: "plus")
                                .font(.system(size:30))
                                .foregroundColor(Color.blue)
                                .bold()
                        }
                        Button(action:{
                            addingItems.removeLast()
                            memos.removeLast()
                            howMuchs.removeLast()
                        }){
                            Image(systemName: "minus")
                                .font(.system(size:30))
                                .foregroundColor(Color.blue)
                                .bold()
                        }
                        
                    }
                    .padding([.leading, .trailing])
                    
                    
                    List {
                        
                        ForEach(addingItems.indices, id: \.self){ addingItem in
                            
                            HStack {
                                TextField("メモ", text:$memos[addingItem])
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .border(Color.black,width: 2)
                                
                                
                                TextField("何円", text: $howMuchs[addingItem])
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .border(Color.black,width: 2)
                                
                                
                            }
                        }
                        .onDelete(perform: { indexSet in
                            addingItems.remove(atOffsets: indexSet)
                        })
                        .onMove(perform: { indices, newOffset in
                                            addingItems.move(fromOffsets: indices, toOffset: newOffset)
                                        })
                        .padding(.bottom,5)
                        .listRowBackground(Color.clear)
                    }
                    
                    
                }
            }
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button{
                        isPresentedIndividual = false
                    }label:{
                        Text("Close")
                            .font(.system(size:20))
                    }
                }
            }.toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    EditButton()
                        .font(.system(size:20))
                        
                }
            }
        }
    }
    
}




struct Individual_Previews: PreviewProvider {
    static var previews: some View {
        Individual(isPresentedIndividual: Binding.constant(false))
    }
}
