//
//  ToolBarItemPlacementModifier.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 27/06/2020.
//

import SwiftUI

/// ToolBarItemPlacement modifier
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
/// 
/// Enum ToolBarItemPlacement : propre à chaque placement mais c'est l'intention qui compte plus que le placement en lui même
///   • automatique : propre à la plateforme
///      - macOS / Mac Catalyst : leading to trailing
///      - i•Pad•OS / tvOS : trailing de la navigationBar
///      - watchOS : uniquement le premier élément apparaitra, pinné sous la barre de navigation
///   • bottomBar : bottom toolbar (uniquement pour i•Pad•OS et Mac Catalyst)
///   • cancellationAction : représente l'annulation d'une action dans une modale (pour dismiss la modale sans drag de la part de l'utilisateur)
///      - macOS / Mac Catalyst : trailing (placé avant un confirmAction s'il y en a)
///      - i•Pad•OS / watchOS / tvOS : leading de la navigationBar
///   • confirmationAction : représente la confirmation d'une action dans une modale (ajouter un event au calendrier par exemple)
///      - macOS / Mac Catalyst : trailing most (le + en trailing possible) et l'accent color de l'app sera son background
///      - i•Pad•OS / tvOS : même placement que celui du primaryAction
///      - watchOS : trailing de la navigationBar
///   • destructiveAction : représente la destruction d'une action dans une modale (boutton ne pas enregistrer par exemple)
///      - macOS / Mac Catalyst : leading + apparence spéciale pour prévenir d'un usage accidentel
///      - i•(Pad?)•OS / watchOS / tvOs : trailing de la navigationBar
///   • navigation : représente une action de navigation (du style suivant / précédent dans Safari par exemple)
///      - macOS / Mac Catalyst : leading avant le titre (si présent dans la toolbar)
///      - i•Pad•OS / tvOS : leading de la navigationBar (si compactWidth alors seront placé pareil que la primaryAction)
///   • navigationBarLeading : leading de la navigationBar (uniquement pour i•Pad•OS, tvOS & Mac Catalyst)
///   • navigationBarTrailing : trailing de la navigationBar (uniquement pour i•Pad•OS, tvOS & Mac Catalyst)
///   • primaryAction : représente l'action principale la plus utilisé dans un context donné (nouveau message dans l'app Message par exemple)
///      - macOS / Mac Catalyst : leading
///      - i•Pad•OS / tvOS : trailing de la navigationBar
///      - watchOS : sous la navigationBar, révélée lors d'un scroll
///   • principal : l'item est placé dans la section principal
///      - macOS / Mac Catalyst : centre de la toolbar
///      - i•Pad•OS / tvOS : centre de la navigationBar et prendra le pas sur le titre de la NavigationView (setter via .navigationTitle)
///   • status : représente un changement de staut pour le context actuel de la View (représente une information et non une action, indication sur le dernier refresh par exemple)
///      - macOS / Mac Catalyst : centre de la toolbar
///      - i•Pad•OS : centre bottom de la toolbar

// MARK: - Utilisation : Indiquer l'utilité d'un ToolbarItem (et donc son placement , géré nativement 😇)

struct AutomaticPlacement: View {
  var body: some View {
    NavigationView {
      List(0...50, id: \.self) { item in
        Text("Hello row n°\(item)")
          .font(.title3)
          .fontWeight(.bold)
      }
      .navigationBarTitle("Automatic")
      .toolbar {
        ToolbarItem(placement: .automatic) {
          Text("Automatic placement")
        }
      }
    }
  }
}

struct BottomBarPlacement: View {
  var body: some View {
    NavigationView {
      List(0...50, id: \.self) { item in
        Text("Hello row n°\(item)")
          .font(.title3)
          .fontWeight(.bold)
      }
      .navigationBarTitle("BottomBar")
      .toolbar {
        ToolbarItem(placement: .bottomBar) {
          Text("BottomBar placement")
        }
      }
    }
  }
}

struct CancellationAction: View {

  @State private var show = false

  var body: some View {
    VStack {
      Button { show.toggle() } label: { Text("Toggle me") }
    }
    .sheet(isPresented: $show) {
      ModalNavigationView(title: "CancellationAction")
    }
  }
}

struct ConfirmationAction: View {

  @State private var show = false

  var body: some View {
    VStack {
      Button { show.toggle() } label: { Text("Toggle me") }
    }
    .sheet(isPresented: $show) {
      ModalNavigationView(title: "ConfirmationAction")
    }
  }
}

struct DestructiveAction: View {

  @State private var show = false

  var body: some View {
    VStack {
      Button { show.toggle() } label: { Text("Toggle me") }
    }
    .sheet(isPresented: $show) {
      ModalNavigationView(title: "DestructiveAction")
    }
  }
}

struct Navigation: View {
  var body: some View {
    NavigationView {
      List(0...50, id: \.self) { item in
        Text("Hello row n°\(item)")
          .font(.title3)
          .fontWeight(.bold)
      }
      .navigationBarTitle("Navigation")
      .toolbar {
        ToolbarItem(placement: .navigation) {
          Text("Navigation placement")
        }
      }
    }
  }
}

struct NavigationBarLeading: View {
  var body: some View {
    NavigationView {
      List(0...50, id: \.self) { item in
        Text("Hello row n°\(item)")
          .font(.title3)
          .fontWeight(.bold)
      }
      .navigationBarTitle("NavigationBarLeading")
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {
          Text("NavigationBarLeading placement")
        }
      }
    }
  }
}

struct NavigationBarTrailing: View {
  var body: some View {
    NavigationView {
      List(0...50, id: \.self) { item in
        Text("Hello row n°\(item)")
          .font(.title3)
          .fontWeight(.bold)
      }
      .navigationBarTitle("NavigationBarTrailing")
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Text("NavigationBarTrailing placement")
        }
      }
    }
  }
}

struct PrimaryAction: View {
  var body: some View {
    NavigationView {
      List(0...50, id: \.self) { item in
        Text("Hello row n°\(item)")
          .font(.title3)
          .fontWeight(.bold)
      }
      .navigationBarTitle("PrimaryAction")
      .toolbar {
        ToolbarItem(placement: .primaryAction) {
          Text("PrimaryAction placement")
        }
      }
    }
  }
}

struct Principal: View {
  var body: some View {
    NavigationView {
      List(0...50, id: \.self) { item in
        Text("Hello row n°\(item)")
          .font(.title3)
          .fontWeight(.bold)
      }
      .navigationBarTitle("Principal")
      .toolbar {
        ToolbarItem(placement: .principal) {
          Text("Principal placement")
        }
      }
    }
  }
}

struct Status: View {
  var body: some View {
    NavigationView {
      List(0...50, id: \.self) { item in
        Text("Hello row n°\(item)")
          .font(.title3)
          .fontWeight(.bold)
      }
      .navigationBarTitle("Status")
      .toolbar {
        ToolbarItem(placement: .status) {
          Text("Status placement")
        }
      }
    }
  }
}

fileprivate struct ModalNavigationView: View {

  @Environment(\.presentationMode) var presentation
  let title: String

  var body: some View {
    NavigationView {
      List(0...50, id: \.self) { item in
        Text("Hello row n°\(item)")
          .font(.title3)
          .fontWeight(.bold)
      }
      .navigationBarTitle(title)
        .toolbar {
          ToolbarItem(placement: .cancellationAction) {
            Button { presentation.wrappedValue.dismiss() } label: {
              Text("Action here")
            }
          }
        }
    }
  }
}


struct ToolBarItemPlacementModifier_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      AutomaticPlacement()
      BottomBarPlacement()
      CancellationAction()
      ConfirmationAction()
      DestructiveAction()
      Navigation()
      NavigationBarLeading()
      NavigationBarTrailing()
      PrimaryAction()
      Group {
        Principal()
        Status()
      }
    }
  }
}
