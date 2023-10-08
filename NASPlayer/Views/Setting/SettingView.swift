//
//  SettingView.swift
//  NASPlayer
//
//  Created by 宋睿 on 19/9/2023.
//

import SwiftUI

struct SettingView: View {
    
    @ObservedObject var user = UserStore.shared
    @Environment(\.colorScheme) var colorScheme
    
    private var accountBackground: Color {
        if self.colorScheme == .dark {
            return .lightGray
        } else {
            return .paleGray
        }
    }
    
    var body: some View {
        List {
            AccountView()
            AppearanceSectionView()
            CacheSectionView()
        }
        .navigationTitle("Setting")
    }
    
    @ViewBuilder
    func AccountView() -> some View {
        HStack(spacing: 20) {
            Image(systemName: "person.crop.circle")
                .font(.system(size: 64))
                .foregroundStyle(.accent)
            VStack(alignment: .leading) {
                Text(self.user.account)
                    .font(.title)
                    .fontWeight(.semibold)
                Text("View Profiles")
                    .font(.footnote)
                    .fontWeight(.regular)
                    .foregroundStyle(.accent)
            }
            Spacer()
        }
    }
    
    @ViewBuilder
    func AppearanceSectionView() -> some View {
        Section("Appearances") {
            Picker(selection: .constant(1), label: Text("Color Scheme")) {
                Text("Dark mode").tag(1)
                Text("Light mode").tag(2)
                Text("Sync with System").tag(3)
            }
            .pickerStyle(.menu)
            Toggle(isOn: .constant(true), label: {
                Text("Big Cover Mode")
            })
        }
    }
    
    @ViewBuilder
    func CacheSectionView() -> some View {
        Section("Cache") {
            Stepper(value: .constant(1), in: 1...10) {
                Text("Cache Limit")
            }
            Text("Clear Cache")
        }
    }
}

#Preview {
    SettingView()
}
