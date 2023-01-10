//
//  Type.swift
//  Warikan
//
//  Created by Koki on 2022/11/13.
//

import SwiftUI

struct TypeMoney: View {
    
    @Binding var isPresented: Bool
    @State var isTypedMoney: Bool = false
    @State var isResult: Bool = false
    @State var isIndividual: Bool = false
    @State var memberArray:[String]=[""]
    
    var body: some View {
        NavigationView{
            ZStack {
                Color("Color2")
                    .ignoresSafeArea()
                
                VStack{
                    ScrollView{
                        ForEach (memberArray,id: \.self){ i in
                            VStack {
                                Button(action:{
                                    isIndividual = true
                                }){
                                    Text(i)
                                        .font(.system(size:40))
                                        .frame(width: 200,height: 80)
                                        .border(Color.black,width: 3)
                                        .background(Color.white)
                                        .bold()
                                        .padding(.bottom,20)
                                }.fullScreenCover(isPresented: $isIndividual){
                                    Individual( isPresentedIndividual: $isIndividual)
                                }
                            }
                        }
                    }
                    .padding(.top, 80)
                    Spacer()
                    
                    Button(action:{
                        isResult.toggle()
                    }){
                        Text("結果の表示")
                            .font(.system(size:30))
                            .frame(width:250,height: 100)
                            .border(Color.pink,width: 10)
                            .background(Color.yellow)
                            .foregroundColor(Color.black)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .bold()
                            .padding(.bottom)
                    }.sheet(isPresented: $isResult){
                        Result()
                    }
                    
                }.onAppear(){
                    guard let defaultItem = UserDefaults.standard.array(forKey: "SaveMembers") as? [String] else{
                        return
                    }
                    self.memberArray = defaultItem
                }
            }
        }
    }
}

struct Type_Previews: PreviewProvider {
    static var previews: some View {
        TypeMoney(isPresented: Binding.constant(false))
    }
}
