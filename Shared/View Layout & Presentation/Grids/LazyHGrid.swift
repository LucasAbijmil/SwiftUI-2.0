//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI
import Combine

/// Plateformes : i•Pad•OS 14.0, watchOS 7.0, tvOS 14.0, macOS 11.0, Mac Catalyst 14.0
/// Description : Une `View` qui arrange ses subviews dans une grille de manière horizontale, créant chaque subview à la volée et si nécessaire (d'où le lazy)
///
/// 1 init pour une `LazyHGrid` :
///   - init(rows: [GridItem], alignment: VerticalAlignment = .center, spacing: CGFloat? = nil,
///          pinnedViews: PinnedScrollableViews = .init(), content: () -> Content) where Content : View
///
/// Paramètres :
///   - rows : `[GridItem]` ––> un array de `GridItem` pour dimensionner et positionner chaque colonne de la grille
///   - alignment: `VerticalAlignment` = .center ––> l'alignement vertical de chaque subview
///       - top
///       - center
///       - bottom
///       - firstTextBaseline
///       - lastTextBaseline
///   - spacing: `CGFloat?` = nil ––> la distance horizontal entre chaque subview, `nil` pour une valeur par défaut
///   - pinnedViews: `PinnedScrollableViews` = .init() ––> les types de subviews qui vont être épinglés
///       - sectionHeaders : rend le header d'une `Section` sticky
///       - sectionFooters : rend le footer d'une `Section` sticky
///   - @ViewBuilder content: () -> Content : un ensemble de `View` (maximum 10 subviews)
///
/// Remarques :
///   - Une `LazyHGrid` place un ensemble de cellules horizontalement, les cellules disposées en columns (cf vidéo)
///   - `onAppear` & `onDisappear` bien appellé à chaque fois (et pas qu'à la création de la cellule)
///   - À 99.99% du temps précédée par une `ScrollView`, puis suivie d'un `ForEach`
///
/// Vidéo : https://swiftui-lab.com/wp-content/uploads/2020/07/layouts.mp4


struct LazyHGridWithNAdaptiveRows: View {

  /// Définition du layout :
  ///   - `GridItem` : .adaptative(minimum: 80, maximum: .infinity), spacing: nil, alignment: nil
  ///   - rows : x rows d'au moins 80 points en height (x s'adapte en fonction de l'orientation du device)
  let rows = [GridItem(.adaptive(minimum: 80))]

  @State private var gridHeight: CGFloat = 500

  var body: some View {
    NavigationView {
      ScrollView(.horizontal) {
        LazyHGrid(rows: rows, spacing: 20) {
          ForEach(0...250, id: \.self, content: LazyGridsCell.init)
        }
        .frame(height: gridHeight)
      }
      .toolbar {
        ToolbarItem(placement: .principal) {
          VStack {
            Text("Grid Height : " + String(format: "%.0f", gridHeight))
            Slider(value: $gridHeight, in: 80...(UIScreen.main.bounds.height - 125))
          }
        }
      }
      .navigationBarTitleDisplayMode(.inline)
      .background(Color.mint.opacity(0.25))
    }
    .navigationViewStyle(.stack)
  }
}

struct LazyHGridWithOneFlexibleRow: View {

  /// Définition du layout :
  ///   - `GridItem` : .flexible(minimum: 10, maximum = .infinity), spacing: nil, alignment: nil
  ///   - rows : 1 seule row qui prend toute la height de la `LazyHGrid`
  let rows = [GridItem(.flexible())]

  @State private var gridHeight: CGFloat = 500

  var body: some View {
    NavigationView {
      ScrollView(.horizontal) {
        LazyHGrid(rows: rows, spacing: 20) {
          ForEach(1...250, id: \.self, content: LazyGridsCell.init)
        }
        .frame(height: gridHeight)
      }
      .toolbar {
        ToolbarItem(placement: .principal) {
          VStack {
            Text("Grid Height : " + String(format: "%.0f", gridHeight))
            Slider(value: $gridHeight, in: 50...(UIScreen.main.bounds.height - 125))
          }
        }
      }
      .navigationBarTitleDisplayMode(.inline)
      .background(Color.mint.opacity(0.25))
    }
    .navigationViewStyle(.stack)
  }
}

struct LazyHGridWithThreeFlexibleRows: View {

  /// Définition du layout :
  ///   - `GridItem` : .flexible(minimum: 10, maximum: .infinity), spacing: nil, alignment: nil
  ///   - rows : 3 rows qui font ± 1/3 de la height de `LazyHGrid`
  let rows = Array(repeating: GridItem(.flexible()), count: 3)

  @State private var gridHeight: CGFloat = 500

  var body: some View {
    NavigationView {
      ScrollView(.horizontal) {
        LazyHGrid(rows: rows, spacing: 20) {
          ForEach(1...250, id: \.self, content: LazyGridsCell.init)
        }
        .frame(height: gridHeight)
      }
      .toolbar {
        ToolbarItem(placement: .principal) {
          VStack {
            Text("Grid Height : " + String(format: "%.0f", gridHeight))
            Slider(value: $gridHeight, in: 50...(UIScreen.main.bounds.height - 125))
          }
        }
      }
      .navigationBarTitleDisplayMode(.inline)
      .background(Color.mint.opacity(0.25))
    }
    .navigationViewStyle(.stack)
  }
}

struct LazyHGridWithThreeFixedRows: View {

  /// Définition du layout :
  ///   - `GridItem` : .fixed(200), spacing: nil, alignment: nil
  ///   - rows : 3 rows qui font précicément 200 points de height chacunes
  let rows = Array(repeating: GridItem(.fixed(200)), count: 3)

  @State private var gridHeight: CGFloat = 610

  var body: some View {
    NavigationView {
      ScrollView(.horizontal) {
        LazyHGrid(rows: rows, spacing: 20) {
          ForEach(1...250, id: \.self, content: LazyGridsCell.init)
        }
        .frame(height: gridHeight)
      }
      .toolbar {
        ToolbarItem(placement: .principal) {
          VStack {
            Text("Grid Height : " + String(format: "%.0f", gridHeight))
            Slider(value: $gridHeight, in: 610...(UIScreen.main.bounds.height - 125))
          }
        }
      }
      .navigationBarTitleDisplayMode(.inline)
      .background(Color.mint.opacity(0.25))
    }
    .navigationViewStyle(.stack)
  }
}


struct LazyHGridWithOneFixedßAdaptativeOneFlexible: View {

  /// Définition du layout :
  ///   - `GridItem` :
  ///       - .fixed(200), spacing: nil, alignment: nil
  ///       - .adaptive(minimum: 100, maximum: 250), spacing: nil, alignment: nil – xß
  ///       - .flexible(minimum: 10, maximum = .infinity), spacing: nil, alignment: nil
  ///   - rows : 2 + ß rows qui vont faire :
  ///       - fixe 200 points de height
  ///       - entre 100 et 250 point de height x ß
  ///       - entre 10 et toute la height restante
  let row = [
    GridItem(.fixed(200)),
    GridItem(.adaptive(minimum: 100, maximum: 250)),
    GridItem(.flexible())
  ]

  @State private var gridHeight: CGFloat = 500

  var body: some View {
    NavigationView {
      ScrollView(.horizontal) {
        LazyHGrid(rows: row, spacing: 20) {
          ForEach(1...250, id: \.self, content: LazyGridsCell.init)
        }
        .frame(height: gridHeight)
      }
      .toolbar {
        ToolbarItem(placement: .principal) {
          VStack {
            Text("Grid Height : " + String(format: "%.0f", gridHeight))
            Slider(value: $gridHeight, in: 410...(UIScreen.main.bounds.height - 125))
          }
        }
      }
      .navigationBarTitleDisplayMode(.inline)
      .background(Color.mint.opacity(0.25))
    }
    .navigationViewStyle(.stack)
  }
}

fileprivate enum TabItem {
  case settings
  case grid
}

struct LazyHGridDemoView: View {

  @StateObject private var viewModel = LzayHGridDemoViewModel()

  var body: some View {
    TabView {
      LazyHGridConfiguratorView()
        .tag(TabItem.settings)
        .tabItem { Label("Config", systemImage: "gear") }

      LzayHGridDemo()
        .tag(TabItem.grid)
        .tabItem { Label("Grid", systemImage: "square.grid.3x2") }
    }
    .environmentObject(viewModel)
  }
}


struct LazyHGrid_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      LazyHGridWithNAdaptiveRows()
      LazyHGridWithOneFlexibleRow()
      LazyHGridWithThreeFlexibleRows()
      LazyHGridWithThreeFixedRows()
      LazyHGridWithOneFixedßAdaptativeOneFlexible()
      LazyHGridDemoView()
    }
  }
}

struct LazyGridsCell: View {

  let item: Int
  
  var body: some View {
    ZStack {
      Rectangle()
        .fill(randomColor())
      Text("Item\n n°\(item)")
        .fontWeight(.bold)
        .foregroundColor(.white)
        .padding(.horizontal)
    }
  }
}
