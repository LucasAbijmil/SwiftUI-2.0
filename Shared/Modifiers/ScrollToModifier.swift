//
//  ScrollToModifier.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 04/07/2020.
//

import SwiftUI

/// Modifier scollTo qui permet de scroll une View en particulier
/// S'apparente un peu au delgeate du Scroll avec UIKit
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
/// Pour utiliser ce modifier :
///   • Ajouter un ScrollViewReader qui passe une value dans le ScrollView
///   • Donner un id à chaque View contenue dans le ScrollReader
///
/// Paramètres modifier via la value :
///   • id (de la View) : String, Int etc... ––> obligatoire
///   • anchor : UnitPoint ––> optionnel
///     ––> si pas d'anchor définie alors la value va scroll le "moins possible" pour afficher la view



struct ScrollToModifier: View {

  let colors: [Color] = [.red, .green, .blue]

  var body: some View {
    ScrollView {
      ScrollViewReader { value in
        Button(action: {
          /// Modifier pour id 5 avec une anchor .top
          value.scrollTo(5, anchor: .top)
        }, label: {
          Text("Scroll to position #5")
        })
        Button(action: {
          /// Modifier pour id 7 avec une anchor .center
          value.scrollTo(7, anchor: .center)
        }, label: {
          Text("Scroll to position #7")
        })
        ForEach(0...10, id: \.self) { item in
          Text("Example \(item)")
            .frame(height: 300)
            .frame(maxWidth: .infinity)
            .background(colors[item % colors.count])
            /// Donner un ID à chaque vue dans le scroll si on veut utiliser le modifier
            .id(item)
        }
      }
    }
  }
}

struct ScrollToModifier_Previews: PreviewProvider {
  static var previews: some View {
    ScrollToModifier()
  }
}
