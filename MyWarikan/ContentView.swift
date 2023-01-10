//
//  ContentView.swift
//  Warikan
//
//  Created by Koki on 2022/11/13.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            
            ZStack {
                Color("Color1")
                    .ignoresSafeArea()
                VStack {
                    
                    NavigationLink(destination: AddMember()){
                        Text("メンバー追加")
                            .font(.system(size:30))
                            .fontWeight(.bold)
                            .frame(width: 300,height: 80)
                            .foregroundColor(Color.white)
                            .background(Color.yellow)
                            .cornerRadius(30)
                            .padding()
                            
                    }
                    NavigationLink(destination: TypeMoney(isPresented: Binding.constant(false))){
                        Text("金額入力")
                            .font(.system(size:30))
                            .fontWeight(.bold)
                            .frame(width: 300,height: 80)
                            .foregroundColor(Color.white)
                            .background(Color.yellow)
                            .cornerRadius(30)
                            .padding()
                    }
                    NavigationLink(destination: Result()){
                        Text("結果確認")
                            .font(.system(size:30))
                            .fontWeight(.bold)
                            .frame(width: 300,height: 80)
                            .foregroundColor(Color.white)
                            .background(Color.yellow)
                            .cornerRadius(30)
                            .padding()
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
