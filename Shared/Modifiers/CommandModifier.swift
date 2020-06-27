//
//  CommandModifier.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 27/06/2020.
//

import SwiftUI

/// Modifier commands : rajout de fonctionnalité à l'App
/// - commands ––> i•Pad•OS / macOS / Mac Catalyst / tvOS
///   • EmptyCommands ––> sert à rien 😅:
///     - i•Pad•OS / macOS / Mac Catalyst / tvOS
///   • CommandGroup(before: CommandGroupPlacement) | CommandGroup(after: CommandGroupPlacement) | CommandGroup(replacing: CommandGRoupPlacement)
///     - macOS / Mac Catalyst : forme de collections d'éléments dans un menu ???
///     - i•Pad•OS / tvOS : "commandes clés" pour chaque commande ayant un keyboardShortcut
///   • CommandMenu("String"):
///     - macOS / Mac Catalyst : rajoute un menu déroulant entre View et Window dans l'ordre de déclaration
///     - i•Pad•OS / tvOS : "commandes clés" pour chaque commande ayant un keyboardShortcut
///   • SidebarCommands:
///     - macOS / Mac Catalyst : ensemble de commandes pour manipuler les barres latérales des fenêtres
///     - i•Pad•OS : ???
///   • TextEditingCommands:
///     - macOS / Mac Catalyst : ensemble de commandes pour la recherche, l'édition et la transformation d'un texte selectionné
///     - i•Pad•OS : ??
///   • TextFormattingCommands:
///     - macOS / Mac Catalyst : ensemble de commandes pour transformer les styles appliqués à des textes selectionnés
///     - i•Pad•OS : ??
///   • ToolbarCommands:
///     - macOS / Mac Catalyst : ensemble de commandes pour manipuler les barres d'outils des fenêtres
///     - i•Pad•OS : ??
///
///   CommandGroupPlacement cf: https://developer.apple.com/documentation/swiftui/commandgroupplacement
///   Penser à rajouter des keyboardShortcut

#warning("Essayer pour remplacer l'inconnu")

struct TestCommand: App {
  var body: some Scene {
    WindowGroup {
      LabelView()
    }
    /// Ajout de commandes
    .commands {
      /// Création d'un menu Shape entre View et Windows
      CommandMenu("Shape") {
        /// Bouton n°1
        Button("Add Shape...", action: {})
          /// Raccourci clavier : shift (car maj) + cmd + n
          .keyboardShortcut("N")

        // Bouton n°2
        Button("Add Text", action: {})
          /// Raccourci clavier :  shift (car maj) + cmd + t
          .keyboardShortcut("T")
      }

      /// Création d'un menu Hey entre View et Windows (et donc juste après Shape)
      CommandMenu("Hey") {
        /// Bouton n°1
        Button("Hey", action: {})
      }

      /// Création d'un CommandGroup placé avant la sidebar
      CommandGroup(before: .sidebar) {
        /// Bouton n°1
        Button("Previous View", action: {})
          /// Raccourci clavier
          .keyboardShortcut("[")
        
        Button("Next View", action: {})
          /// Raccourci clavier
          .keyboardShortcut("]")
      }
    }
  }
}
