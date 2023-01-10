//
//  Result.swift
//  MyWarikan
//
//  Created by Koki on 2022/11/16.
//

import SwiftUI

struct Result: View {
    @State var memberArray:[String]=[""]
    @State var howMuchs:[String] = [""]
    
    var body: some View {
            
        ZStack {
            Color("Color3")
                .ignoresSafeArea()
            
            VStack {
                    Spacer()
                    
                    List{
                        
                        Section(header: Text("支出").font(.largeTitle),footer: Text("総額  :  〇〇〇〇〇円").font(.system(size:20)).foregroundColor(Color.red).bold().padding(.bottom,50)){
                            ForEach(memberArray, id:\.self){ item in
                                VStack {
                                    HStack {
                                        Text(item)
                                            .frame(width:100,height: 30)
                                            .border(Color.black,width: 2)
                                            .background(Color.white)
                                        
                                        Text("〇〇〇〇円")
                                            .frame(width:200,height: 30)
                                            .border(Color.black,width: 2)
                                            .background(Color.white)
                                    }
                                }
                            }
                            .listRowBackground(Color.clear)
                        }
                        
                        Section(header: Text("精算").font(.largeTitle)){
                            ForEach(memberArray, id:\.self){ item in
                                VStack {
                                    HStack {
                                        Text(item)
                                            .frame(width:100,height: 30)
                                            .border(Color.black,width: 2)
                                            .background(Color.white)
                                        
                                        Text("〇〇〇〇円払う")
                                            .frame(width:200,height: 30)
                                            .border(Color.black,width: 2)
                                            .background(Color.white)
                                    }
                                }
                            }
                        }
                        .listRowBackground(Color.clear)
                    }
                    .listStyle(SidebarListStyle())
                    .onAppear(){
                        guard let defaultItem = UserDefaults.standard.array(forKey: "SaveMembers") as? [String] else{
                            return
                        }
                        self.memberArray = defaultItem
                    }
            }
        }
    }
}
struct Result_Previews: PreviewProvider {
    static var previews: some View {
        Result()
    }
}
