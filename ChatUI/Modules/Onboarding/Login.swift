//
//  Login.swift
//  ChatUI
//
//  Created by Nishant sethi on 11/01/2024.
//

import SwiftUI

struct Login: View {
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color(red: 0.42, green: 0.75, blue: 0.73), Color(red: 0, green: 0.15, blue: 0.33).opacity(0.8)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                logoView
//                Spacer()
                welcomeText
                Spacer()
                credentialsInput
                Spacer()
                socialLoginOptions
                termsAndConditions
                loginActions
                signUpSuggestion
                pageIndicator
            }
            .padding()
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
    }
    
    private var logoView: some View {
        HStack {
            // Replace the empty ZStack with the actual logo if you have one
            Image(systemName: "circle.fill") // Placeholder for logo image
                .frame(width: 36, height: 36)
            Spacer()
            Text("Mindmate")
                .font(Font.custom("Satoshi", size: 14).weight(.black))
                .foregroundColor(.white)
        }
        .offset(y: -50) // Adjust this value to position the logo as needed
    }
    
    private var welcomeText: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Welcome back!")
                .font(Font.custom("Satoshi", size: 64))
                .foregroundColor(Color(red: 0.65, green: 0.73, blue: 0.53))
            Text("Don't worry, Mindmate takes the security of your information seriously and keeps it safe.")
                .font(Font.custom("Satoshi", size: 12))
                .foregroundColor(Color(red: 0.88, green: 0.88, blue: 0.88))
        }
    }
    
    private var credentialsInput: some View {
        VStack(alignment: .leading, spacing: 12) {
            TextField("Enter your Email", text: .constant("")) // Binding should be replaced with actual state variable
                .textFieldStyle(CustomTextFieldStyle())
            SecureField("Enter your password", text: .constant("")) // Binding should be replaced with actual state variable
                .textFieldStyle(CustomTextFieldStyle())
            rememberMeAndForgotPassword
        }
    }
    
    private var loginActions: some View {
        Button(action: {
            // Handle login action
        }) {
            Text("Login")
                .font(Font.custom("Satoshi", size: 14).weight(.medium))
                .tracking(0.10)
                .foregroundColor(Color(red: 0.09, green: 0.09, blue: 0.09))
                .frame(maxWidth: .infinity)
                .padding(EdgeInsets(top: 14, leading: 12, bottom: 14, trailing: 12))
                .background(.white)
                .cornerRadius(55)
                .shadow(color: Color(red: 0.81, green: 0.82, blue: 0.78, opacity: 0.50), radius: 16)
        }
        .padding(.vertical)
    }
    
    private var socialLoginOptions: some View {
        HStack(spacing: 24) {
            // Add actual images and actions for social login buttons
            socialButtonPlaceholder
            socialButtonPlaceholder
            socialButtonPlaceholder
        }
        .offset(y: -20) // Adjust this value to position the social buttons as needed
    }
    
    private var termsAndConditions: some View {
        Text("By logging in, you agree to our Terms & Conditions and Privacy Policy.")
            .font(Font.custom("Satoshi", size: 12))
            .foregroundColor(Color(red: 0.88, green: 0.88, blue: 0.88))
            .multilineTextAlignment(.center)
    }
    
    private var signUpSuggestion: some View {
        Text("Don’t have an account? Sign Up")
            .font(Font.custom("Satoshi", size: 12))
            .foregroundColor(Color(red: 0.88, green: 0.88, blue: 0.88))
            .multilineTextAlignment(.center)
    }
    
    private var rememberMeAndForgotPassword: some View {
        HStack {
            Button(action: {
                // Handle remember me action
            }) {
                HStack {
                    // Replace with actual remember me checkbox
                    Image(systemName: "checkmark.square.fill") // Placeholder for checkbox image
                        .foregroundColor(.green)
                    Text("Remember me")
                        .font(Font.custom("Satoshi", size: 12))
                        .foregroundColor(Color.gray)
                }
            }
            
            Spacer()
            
            Button(action: {
                // Handle forgot password action
            }) {
                Text("Forgot Password?")
                    .font(Font.custom("Satoshi", size: 12).weight(.medium))
                    .foregroundColor(Color(red: 0.65, green: 0.73, blue: 0.53))
            }
        }
    }
    
    private var pageIndicator: some View {
        Rectangle()
            .fill(Color.white)
            .frame(width: 134, height: 4.81)
            .cornerRadius(96.15)
            .offset(y: 30) // Adjust this value to position the page indicator as needed
    }
    
    private var socialButtonPlaceholder: some View {
        // Replace the Rectangle with an actual image and action
        Rectangle()
            .fill(Color.gray.opacity(0.2))
            .frame(width: 46, height: 46)
            .cornerRadius(23)
    }
}

struct CustomTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding()
            .background(Color.gray.opacity(0.6))
            .cornerRadius(45)
            .overlay(
                RoundedRectangle(cornerRadius: 45)
                    .stroke(Color.gray, lineWidth: 0.5)
            )
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
