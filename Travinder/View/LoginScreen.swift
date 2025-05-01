//
//  LoginScreen.swift
//  Travinder
//
//  Created by Ramatoulaye Bah on 30/04/2025.
//

import SwiftUI
import SwiftUI
import GoogleSignIn
import GoogleSignInSwift
import FirebaseAuth
import FirebaseCore

struct LoginScreen: View {
    @EnvironmentObject var appState: AppState
    var body: some View {
        ZStack {
            // Background Gradient
            LinearGradient(gradient: Gradient(colors: [Color.orange.opacity(0.9), Color.pink.opacity(0.7)]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .ignoresSafeArea()

            VStack(spacing: 32) {
                // Logo
                Image("logo-icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .shadow(radius: 10)

                Text("Welcome to Travinder")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)

                Text("Match with your dream destination")
                    .font(.headline)
                    .foregroundColor(.white.opacity(0.85))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)

                // ✅ Google Sign-In Button
                GoogleSignInButton(action: handleSignIn)
                    .frame(height: 50)
                    .padding(.horizontal, 32)

                Spacer()
            }
            .padding(.top, 100)
        }
    }

    func handleSignIn() {
        guard let clientID = FirebaseApp.app()?.options.clientID else {
            print("❌ Missing Firebase client ID")
            return
        }

        let config = GIDConfiguration(clientID: clientID)

        // Get rootViewController for presenting Google Sign-In
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let rootViewController = windowScene.windows.first?.rootViewController else {
            print("❌ Could not find rootViewController")
            return
        }

        GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController) { result, error in
            if let error = error {
                print("❌ Google Sign-In error: \(error.localizedDescription)")
                return
            }

            guard let user = result?.user,
                  let idToken = user.idToken?.tokenString else {
                print("❌ Missing Google user or token")
                return
            }

            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                           accessToken: user.accessToken.tokenString)

            Auth.auth().signIn(with: credential) { authResult, error in
                if let error = error {
                    print("❌ Firebase auth error: \(error.localizedDescription)")
                } else {
                    DispatchQueue.main.async {
                        // Store login success
                        let firebaseUser = Auth.auth().currentUser
                            appState.userName = firebaseUser?.displayName ?? ""
                            appState.userEmail = firebaseUser?.email ?? ""

                            appState.isLoggedIn = true
                            appState.hasCompletedSignup = !appState.userPreferences.preferredLanguages.isEmpty
                    }


                    // TODO: Navigate to MainScreen or SignUp flow
                }
            }
        }
    }
}


#Preview {
    LoginScreen()
}
