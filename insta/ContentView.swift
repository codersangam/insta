//
//  ContentView.swift
//  insta
//
//  Created by Sangam Singh on 20/07/2024.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    TabView {
      HomeView().navigationBarHidden(true).tabItem {
        Label(title: { Text("Home") }, icon: { Image(systemName: "house") })
      }
      Text("Favorite").tabItem {
        Label(title: { Text("Favorite") }, icon: { Image(systemName: "heart") })
      }
      Text("Person").tabItem {
        Label(title: { Text("Profile") }, icon: { Image(systemName: "person") })
      }
      Text("Settings").tabItem {
        Label(title: { Text("Settings") }, icon: { Image(systemName: "gear") })
      }
    }
  }
}

struct HomeView: View {
  @State private var count: Int = 0
  var body: some View {
    VStack(spacing: 24) {
      ScrollView(.horizontal, showsIndicators: false) {
        HStack {
          ForEach(1..<10) {
            a in
            Image("user").resizable()
              .scaledToFit()
              .frame(width: 50, height: 50)
              .clipShape( /*@START_MENU_TOKEN@*/Circle() /*@END_MENU_TOKEN@*/)
          }

        }.padding(.horizontal, 10)
      }

      ScrollView {
        ForEach(1..<4) { _ in
          InstaBodyView()
        }

      }
    }
  }
}

struct InstaBodyView: View {
    @State private var likesCount: Int = 0
    @State private var isLiked: Bool = false
  var body: some View {
    VStack(alignment: .leading) {

      // Header
      HStack {
        Image("user").resizable()
          .scaledToFit()
          .frame(width: 36, height: 36)
          .clipShape( /*@START_MENU_TOKEN@*/Circle() /*@END_MENU_TOKEN@*/)
        Text("Ronnie").font(.subheadline).bold()
        Spacer()
        Image(systemName: "ellipsis")
      }.padding(.horizontal, 10)

      // Body Image
      Image("user1").resizable().frame(height: 350)

      // Actions Btn
      HStack(spacing: 16) {
        Button(
          action: {
            if isLiked {
              likesCount -= 1
              isLiked = false
            } else {
              likesCount += 1
              isLiked = true
            }
          },
          label: {
            Image(systemName: isLiked ? "heart.fill" : "heart").font(
              .system(size: 15, weight: .semibold)
            ).imageScale(.large).foregroundColor(isLiked ? .red : .black)
          })
        Button(
          action: {},
          label: {
            Image(systemName: "bubble.right").font(.system(size: 15, weight: .semibold))
              .imageScale(.large).foregroundColor(.black)
          })
        Button(
          action: {},
          label: {
            Image(systemName: "paperplane").font(.system(size: 15, weight: .semibold))
              .imageScale(
                .large
              ).foregroundColor(.black)
          })

        Spacer()
      }.padding(.horizontal, 10)
        .padding(.top, 2)

      VStack(alignment: .leading) {

        // Likes Count Section
        Text("\(likesCount) Like").font(.footnote).fontWeight(.semibold)

        // Comments Section

        HStack(spacing: 10) {
          Text("Ronnie").font(.footnote).fontWeight(.semibold)
          Text("This is my post description.").font(.footnote)
        }
      }.padding(.horizontal, 10)
        .padding(.top, 2)
    }
  }
}

#Preview {
  ContentView()
}
