//
//  RuleView.swift
//  Werewolves
//
//  Created by User09 on 2020/1/12.
//  Copyright © 2020 Claudio. All rights reserved.
//

import SwiftUI

struct RuleView: View {
    var detail = ["每晚可以查驗一個玩家的身份，看他是好人還是狼人。","每晚可以選擇救活一名玩家，或使用毒藥使一名玩家出局。","白天可以隨時翻牌，選擇場上一位玩家決鬥。如果對方是狼人，則對方出局並立即進入夜晚；如果對方是好人，則騎士出局並繼續發言流程。","每晚可以襲擊一名玩家。","無特殊技能"]
    var role = ["預言家","女巫","騎士","狼人","平民"]
    var body: some View {
                List(0..<5){(index) in

                    Image(self.role[index]).resizable().scaledToFill().frame(width:107,height: 107).cornerRadius(25)
                        
                    
                    Text(self.detail[index]).frame(width: UIScreen.main.bounds.width*4/5 - 107, height: 200)
                            }
        }
    
}

struct RuleView_Previews: PreviewProvider {
    static var previews: some View {
        RuleView()
    }
}
