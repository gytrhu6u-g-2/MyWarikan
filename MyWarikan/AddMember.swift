//
//  AddMember.swift
//  Warikan
//
//  Created by Koki on 2022/11/13.
//

import SwiftUI

struct AddMember: View {
    
    @FocusState var isImputActive: Bool
    @State var memberArray:[String]=[""]
    @State var isMemberCheck: Bool = true
    
    @State var TypeView = false
    
    var body: some View {
        
        ZStack {
            Color("Color2")
                .ignoresSafeArea()
            VStack{
                Image(systemName: "person.fill")
                    .font(.system(size:40))
                    .padding(.top,50)
                ScrollView{
                    ForEach(memberArray.indices, id: \.self) { i in
                        TextField("メンバー\(i+1)", text:$memberArray[i])
                            .frame(width: 220,height: 40)
                            .border(Color.black,width: 2)
                            .background(Color.white)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .focused($isImputActive)
                            .padding(.bottom)
                        
                    }
                }
                .toolbar{
                    ToolbarItemGroup(placement: .keyboard){
                        Spacer()
                        Button("Done"){
                            isImputActive.toggle()
                        }
                    }
                }
                
                HStack {
                    Button(action:{
                        memberArray.append("")
                        
                    }){
                        Text("追加")
                            .font(.system(size:40))
                            .bold()
                            .foregroundColor(Color.black)
                            .frame(width: 150,height: 100)
                            .border(Color.black,width: 4)
                            .background(Color.yellow)
                        
                    }
                    Button(action:{
                        memberArray.removeLast()
                    }){
                        Text("削除")
                            .font(.system(size:40))
                            .bold()
                            .foregroundColor(Color.white)
                            .frame(width: 150,height: 100)
                            .border(Color.black,width: 4)
                            .background(Color.red)
                    }
                }
                
                VStack{
                    Button(action:{
                        UserDefaults.standard.set(self.memberArray,forKey:"SaveMembers")
                        self.TypeView.toggle()
                    }){
                        Text("セット")
                            .font(.system(size:30))
                            .bold()
                            .frame(width: 150,height: 50)
                            .foregroundColor(Color.white)
                            .background(Color.black)
                            .cornerRadius(30)
                            .padding(.bottom)
                    }
                    .sheet(isPresented: self.$TypeView){
                        TypeMoney(isPresented: $TypeView)
                    }
                }
                
            }
            .ignoresSafeArea(.keyboard, edges: .bottom)
            .onAppear(){
                guard let defaultItem = UserDefaults.standard.array(forKey: "SaveMembers") as? [String] else{
                    return
                }
                self.memberArray = defaultItem
        }
        }
    }
}





struct AddMember_Previews: PreviewProvider {
    static var previews: some View {
        AddMember()
        TypeMoney(isPresented: .constant(false))
    }
}
