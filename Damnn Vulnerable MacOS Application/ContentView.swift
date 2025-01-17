import SwiftUI
import WebKit
import Foundation
import LocalAuthentication
import SQLite3
import Network
import Firebase
import KeychainSwift
import os

struct ContentView: View {
    @State private var outputText: AnyView = AnyView(Text("Select an option.")) // Initialize with a default view
    @State private var isSidebarVisible: Bool = false
    @State private var selectedSidebarIndex: Int? = 0 // Track the selected sidebar item

    let buttonTitles = [
        "Home",
        "Excessive Permissions Granted",
        "Minimum OS Version Low",
        "Hardcoded API Keys",
        "Insecure SIP Detection",
        "Sensitive Information stored in Memory",
        "Insecure Data Leakage in Logs",
        "Insecure Data Storage in Keychain",
        "Insecure Firebase Database",
        "Insecure Local Data Storage in plist",
        "Insecure WebView Attacks",
        "SQL Injection Attack",
        "Command Injection Attack",
        "Insecure SSL Pinning",
        "Insecure Touch ID Implementation",
        "Network Layer Security"
    ]

    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                HStack {
                    Button(action: {
                        withAnimation(.easeInOut) {
                            isSidebarVisible.toggle()
                        }
                    }) {
                        Image(systemName: "line.horizontal.3")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 16)
                            .padding(6)
                            .foregroundColor(Color.primary)
                    }
                    .background(Color.gray) // Static background color for all modes
                    .cornerRadius(6)

                    Spacer()

                    Text("Damn Vulnerable MacOS Application (DVMA)")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)

                    Spacer()
                }
                .padding()
                .background(Color.blue)
                .frame(maxWidth: .infinity)

                HStack(spacing: 0) {
                    if isSidebarVisible {
                        VStack(spacing: 8) {
                            ScrollView {
                                ForEach(buttonTitles.indices, id: \.self) { index in
                                    SidebarButton(index: index, title: buttonTitles[index], action: {
                                        handleButtonAction(index: index)
                                        withAnimation(.easeInOut) {
                                            isSidebarVisible = false
                                        }
                                    })
                                }
                            }
                        }
                        .frame(width: min(200, geometry.size.width * 0.3)) // Sidebar width adjusts dynamically
                        .background(Color.gray.opacity(0.2))
                        .transition(.move(edge: .leading))
                        .zIndex(1)
                    }

                    ScrollView {
                        VStack {
                            Spacer()
                            if selectedSidebarIndex == 0 {
                                VStack(spacing: 20) {
                                    Image("Asset")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(maxWidth: min(geometry.size.width * 0.5, 200)) // Adjust image size dynamically
                                        .cornerRadius(10)

                                    Text("Damn Vulnerable MacOS Application")
                                        .font(.largeTitle)
                                        .fontWeight(.bold)

                                    Text("Explore and learn about common security vulnerabilities in macOS applications.")
                                        .font(.body)
                                        .multilineTextAlignment(.center)
                                        .padding(.horizontal, 30)
                                    
                                    Spacer()

                                    HStack(spacing: 20) {
                                        Link(destination: URL(string: "https://linkedin.com/in/vaibhav-lakhani")!) {
                                            Image("Linkedin")
                                                .resizable()
                                                .frame(width: 30, height: 30)
                                        }
                                        Link(destination: URL(string: "https://x.com/vlakhani28")!) {
                                            Image("X")
                                                .resizable()
                                                .frame(width: 30, height: 30)
                                        }
                                        Link(destination: URL(string: "https://github.com/vlakhani28")!) {
                                            Image("Github")
                                                .resizable()
                                                .frame(width: 30, height: 30)
                                        }
                                    }
                                }
                                .padding()
                            } else {
                                outputText
                                    .padding()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .background(Color.gray.opacity(0.1))
                                    .cornerRadius(10)
                                    .padding()
                                    .foregroundColor(.primary)
                                if selectedSidebarIndex == 1 {
                                    ExcessivePermissionsView()
                                }
                                else if selectedSidebarIndex == 2 {
                                    MinimumOSVersionView()
                                }
                                else if selectedSidebarIndex == 3 {
                                    WeatherAPIKeyDemoView()
                                }
                                else if selectedSidebarIndex == 4 {
                                    SIPDetectionView()
                                }
                                else if selectedSidebarIndex == 5 {
                                    SensitiveInformationInMemoryView()
                                }
                                else if selectedSidebarIndex == 6 {
                                    DataLeakageLogDemoView()
                                }
                                else if selectedSidebarIndex == 7 {
                                    KeychainExampleView()
                                }
                                else if selectedSidebarIndex == 8 {
                                    FirebaseInsecureDemoView()
                                }
                                else if selectedSidebarIndex == 9 {
                                    LocalDataStorageDemoView()
                                }
                                else if selectedSidebarIndex == 10 {
                                    WebViewXSSAttackView()
                                }
                                else if selectedSidebarIndex == 11 {
                                    SQLInjectionAttackView()
                                }
                                else if selectedSidebarIndex == 12 {
                                    CommandInjectionAttackView()
                                }
                                else if selectedSidebarIndex == 13 {
                                    SSLPinningView()
                                }
                                else if selectedSidebarIndex == 14 {
                                    TouchIDBypassView()
                                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                                }
                                else if selectedSidebarIndex == 15 {
                                    NetworkSecurityDemoView()
                                }
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color(NSColor.windowBackgroundColor))
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)

                Text("Made with ❤️ by Vaibhav Lakhani")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .padding(.bottom, 10)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(NSColor.windowBackgroundColor))
        }
    }

    func handleButtonAction(index: Int) {
        selectedSidebarIndex = index
        switch index {
        case 1:
            outputText = AnyView(
                VStack(alignment: .leading) {
                    Text("Excessive Permissions Granted")
                        .font(.title2)
                        .fontWeight(.bold).frame(maxWidth: .infinity, alignment: .center)
                    
                    Text("Description: This indicates that the application has been granted permissions that exceed what is necessary for its functionality.")
                        .font(.body).padding(.top)
                    
                    Text("OWASP Mapping: DA6 - Security Misconfiguration")
                        .font(.body).padding(.top)
                    
                    Text("Hint: Check the Info.plist file for more details.")
                        .font(.body).padding(.top)
                }
            )
        case 2:
            outputText = AnyView(
                VStack(alignment: .leading) {
                    Text("Minimum OS Version Low").font(.title2)
                        .font(.title2)
                        .fontWeight(.bold)
                        .fontWeight(.bold).frame(maxWidth: .infinity, alignment: .center)
                    Text("Description: The application requires a minimum version of the operating system that is lower than recommended.").font(.body).padding(.top)
                    Text("OWASP Mapping: DA6 - Security Misconfiguration").font(.body).padding(.top)
                    Text("Hint: Check the Info.plist file for more details.").font(.body).padding(.top)
                }
            )
        case 3:
            outputText = AnyView(
                VStack(alignment: .leading) {
                    Text("Hardcoded API Keys")
                        .font(.title2)
                        .fontWeight(.bold)
                        .fontWeight(.bold).frame(maxWidth: .infinity, alignment: .center)
                    Text("Description: API keys are hardcoded in the application, making them vulnerable to extraction.").font(.body).padding(.top)
                    Text("OWASP Mapping: DA3 - Sensitive Data Exposure").font(.body).padding(.top)
                    Text("Hint: Use strings or decompile the application to extract the API key.").font(.body).padding(.top)
                }
            )
        case 4:
            outputText = AnyView(
                VStack(alignment: .leading) {
                    Text("Insecure SIP Detection").font(.title2)
                        .font(.title2)
                        .fontWeight(.bold)
                        .fontWeight(.bold).frame(maxWidth: .infinity, alignment: .center)
                    Text("Description: System Integrity Protection (SIP) is a security feature on Apple Macs that prevents malicious software from modifying critical system files and folders by restricting even the root user's access to protected parts of the operating system The detection of SIP is not implemented securely.").font(.body).padding(.top)
                    Text("OWASP Mapping: DA6 - Security Misconfiguration").font(.body).padding(.top)
                    Text("Hint: Create a Frida script that modifies the return value of the SIP status.").font(.body).padding(.top)
                }
            )
        case 5:
            outputText = AnyView(
                VStack(alignment: .leading) {
                    Text("Sensitive Information stored in Memory")
                        .font(.title2)
                        .fontWeight(.bold)
                        .fontWeight(.bold).frame(maxWidth: .infinity, alignment: .center)
                    Text("Description: Sensitive data is stored in memory without proper protection.").font(.body).padding(.top)
                    Text("OWASP Mapping: DA3 - Sensitive Data Exposure").font(.body).padding(.top)
                    Text("Hint: Use gdb/lldb for memory analysis.").font(.body).padding(.top)
                }
            )
        case 6:
            outputText = AnyView(
                VStack(alignment: .leading) {
                    Text("Insecure Data Leakage in Logs")
                        .font(.title2)
                        .fontWeight(.bold)
                        .fontWeight(.bold).frame(maxWidth: .infinity, alignment: .center)
                    Text("Description: Sensitive information is logged, leading to potential data leakage.").font(.body).padding(.top)
                    Text("OWASP Mapping: DA3 - Sensitive Data Exposure").font(.body).padding(.top)
                    Text("Hint: Use the log command to view the logs or check the app_logs.txt file.").font(.body).padding(.top)
                }
            )
        case 7:
            outputText = AnyView(
                VStack(alignment: .leading) {
                    Text("Insecure Data Storage in Keychain")
                        .font(.title2)
                        .fontWeight(.bold)
                        .fontWeight(.bold).frame(maxWidth: .infinity, alignment: .center)
                    Text("Description: Sensitive data is stored insecurely in the Keychain.").font(.body).padding(.top)
                    Text("OWASP Mapping: DA3 - Sensitive Data Exposure").font(.body).padding(.top)
                    Text("Hint: Create a Frida script that grabs sensitive data from the Keychain.").font(.body).padding(.top)
                }
            )
        case 8:
            outputText = AnyView(
                VStack(alignment: .leading) {
                    Text("Insecure Firebase Database")
                        .font(.title2)
                        .fontWeight(.bold)
                        .fontWeight(.bold).frame(maxWidth: .infinity, alignment: .center)
                    Text("Description: The Firebase database is not secured properly, allowing unauthorized access.").font(.body).padding(.top)
                    Text("OWASP Mapping: DA3 - Sensitive Data Exposure").font(.body).padding(.top)
                    Text("Hint: Grab the Firebase URL and add /.json to it.").font(.body).padding(.top)
                }
            )
        case 9:
            outputText = AnyView(
                VStack(alignment: .leading) {
                    Text("Insecure Local Data Storage in plist")
                        .font(.title2)
                        .fontWeight(.bold)
                        .fontWeight(.bold).frame(maxWidth: .infinity, alignment: .center)
                    Text("Description: Sensitive data is stored insecurely in plist files.").font(.body).padding(.top)
                    Text("OWASP Mapping: DA3 - Sensitive Data Exposure").font(.body).padding(.top)
                    Text("Hint: Check the /Users/{username}/Library/Containers/DVMA.Damnn-Vulnerable-MacOS-Application/Data/Documents folder for the file.").font(.body).padding(.top)
                }
            )
        case 10:
            outputText = AnyView(
                VStack(alignment: .leading) {
                    Text("Insecure WebView Attacks")
                        .font(.title2)
                        .fontWeight(.bold)
                        .fontWeight(.bold).frame(maxWidth: .infinity, alignment: .center)
                    Text("Description: The application is vulnerable to attacks via WebViews.").font(.body).padding(.top)
                    Text("OWASP Mapping: DA8 - Poor Code Quality").font(.body).padding(.top)
                    Text("Hint: Simulate a usual XSS attack.").font(.body).padding(.top)
                }
            )
        case 11:
            outputText = AnyView(
                VStack(alignment: .leading) {
                    Text("SQL Injection Attack")
                        .font(.title2)
                        .fontWeight(.bold)
                        .fontWeight(.bold).frame(maxWidth: .infinity, alignment: .center)
                    Text("Description: The application is vulnerable to SQL injection attacks.").font(.body).padding(.top)
                    Text("OWASP Mapping: DA1 - Injections").font(.body).padding(.top)
                    Text("Hint: Use an SQLite Injection payload to dump the entire database.").font(.body).padding(.top)
                }
            )
        case 12:
            outputText = AnyView(
                VStack(alignment: .leading) {
                    Text("Command Injection Attack")
                        .font(.title2)
                        .fontWeight(.bold)
                        .fontWeight(.bold).frame(maxWidth: .infinity, alignment: .center)
                    Text("Description: The application is susceptible to command injection vulnerabilities.").font(.body).padding(.top)
                    Text("OWASP Mapping: DA1 - Injections").font(.body).padding(.top)
                    Text("Hint: Use a common OS Command Injection payload.").font(.body).padding(.top)
                }
            )
        case 13:
            outputText = AnyView(
                VStack(alignment: .leading) {
                    Text("Insecure SSL Pinning")
                        .font(.title2)
                        .fontWeight(.bold)
                        .fontWeight(.bold).frame(maxWidth: .infinity, alignment: .center)
                    Text("Description: SSL pinning is not implemented correctly, allowing for potential bypass.").font(.body).padding(.top)
                    Text("OWASP Mapping: DA7 - Insecure Communication").font(.body).padding(.top)
                    Text("Hint: Gear up your Burp and capture the request.").font(.body).padding(.top)
                }
            )
        case 14:
            outputText = AnyView(
                VStack(alignment: .leading) {
                    Text("Insecure Touch ID Implementation")
                        .font(.title2)
                        .fontWeight(.bold)
                        .fontWeight(.bold).frame(maxWidth: .infinity, alignment: .center)
                    Text("Description: Touch ID is implemented insecurely, risking user authentication.").font(.body).padding(.top)
                    Text("OWASP Mapping: DA2 - Broken Authentication & Session Management").font(.body).padding(.top)
                    Text("Hint: Create a Frida script that modifies the return value of the Touch ID status.").font(.body).padding(.top)
                }
            )
        case 15:
            outputText = AnyView(
                VStack(alignment: .leading) {
                    Text("Network Layer Security")
                        .font(.title2)
                        .fontWeight(.bold)
                        .fontWeight(.bold).frame(maxWidth: .infinity, alignment: .center)
                    Text("Description: The application lacks proper security measures at the network layer.").font(.body).padding(.top)
                    Text("OWASP Mapping: DA7 - Insecure Communication").font(.body).padding(.top)
                    Text("Hint: Gear up with your Wireshark to analyze the request.").font(.body).padding(.top)
                }
            )
        default:
            outputText = AnyView(Text("No valid selection made."))
        }
    }
}

struct SidebarButton: View {
    let index: Int
    let title: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.headline)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.gray.opacity(0.3))
                .foregroundColor(.primary)
                .cornerRadius(10)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct LocalDataStorageDemoView: View {
    @State private var name: String = ""
    @State private var ccNumber: String = ""
    @State private var cvv: String = ""
    @State private var statusMessage: String = ""

    var body: some View {
        VStack(spacing: 10) {
            Text("💾 Local Data Storage (Demo)")
                .font(.headline)
                .padding(.bottom, 10)

            TextField("👤 Name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 40)
                .frame(width: 250, height: 30)

            TextField("💳 Credit Card Number", text: $ccNumber)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 40)
                .frame(width: 250, height: 30)
                .onReceive(ccNumber.publisher.collect()) {
                    ccNumber = String($0.prefix(16).filter { $0.isNumber })
                }

            TextField("🔒 CVV", text: $cvv)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 40)
                .frame(width: 250, height: 30)
                .onReceive(cvv.publisher.collect()) {
                    cvv = String($0.prefix(3).filter { $0.isNumber })
                }

            Button(action: saveData) {
                Text("💾 Save Data")
                    .font(.subheadline)
                    .padding(.vertical, 5)
                    .padding(.horizontal, 10)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(5)
            }
            .frame(width: .infinity)

            if !statusMessage.isEmpty {
                Text(statusMessage)
                    .font(.footnote)
                    .foregroundColor(.green)
                    .padding(.top, 10)
            }

            Spacer()
        }
        .padding()
    }

    func saveData() {
        let plistPath = "\(NSHomeDirectory())/Documents/sensitiveData.plist"
        let data: [String: String] = [
            "👤 Name": name,
            "💳 CreditCardNumber": ccNumber,
            "🔒 CVV": cvv
        ]

        do {
            let plistData = try PropertyListSerialization.data(fromPropertyList: data, format: .xml, options: 0)
            try plistData.write(to: URL(fileURLWithPath: plistPath))
            statusMessage = "✅ Data has been saved."
        } catch {
            statusMessage = "❌ Failed to save data: \(error.localizedDescription)"
        }
    }
}

struct SIPDetectionView: View {
    @State private var sipStatus: String? = nil
    @State private var isLoading: Bool = true

    var body: some View {
        VStack {
            if isLoading {
                ProgressView("Checking SIP status...")
                    .padding()
            } else if let sipStatus = sipStatus {
                HStack {
                    Image(systemName: sipStatus.contains("enabled") ? "checkmark.circle" : "exclamationmark.triangle")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(sipStatus.contains("enabled") ? .green : .red)
                    Text(sipStatus.contains("enabled") ? "SIP is enabled." : "SIP is disabled.")
                        .font(.headline)
                        .foregroundColor(sipStatus.contains("enabled") ? .green : .red)
                }
                .padding()
            } else {
                HStack {
                    Image(systemName: "xmark.circle")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.gray)
                    Text("Unable to determine SIP status.")
                        .font(.headline)
                        .foregroundColor(.gray)
                }
                .padding()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .onAppear {
            checkSIPStatus()
        }
    }
    
    func checkSIPStatus() {
        DispatchQueue.global(qos: .background).async {
            self.sipStatus = sipDetection()
            self.isLoading = false
        }
    }

    func sipDetection() -> String? {
        let task = Process()
        task.launchPath = "/usr/bin/csrutil"
        task.arguments = ["status"]

        // Redirect standard output and error to temporary file
        let tempFileURL = FileManager.default.temporaryDirectory.appendingPathComponent(".sip_status.txt")
        
        // Create the file if it doesn't exist
        FileManager.default.createFile(atPath: tempFileURL.path, contents: nil, attributes: nil)

        let fileHandle = try? FileHandle(forWritingTo: tempFileURL)
        task.standardOutput = fileHandle
        task.standardError = fileHandle

        do {
            try task.run()
            task.waitUntilExit()
            
            // Read the output from the temporary file after execution
            let data = try Data(contentsOf: tempFileURL)
            if let output = String(data: data, encoding: .utf8) {
                print("SIP Status output: \(output)")

                // Check output for SIP status
                if output.contains("System Integrity Protection status: enabled") {
                    return "SIP is enabled."
                } else if output.contains("System Integrity Protection status: disabled") {
                    return "SIP is disabled."
                } else {
                    return "Unable to determine SIP status."
                }
            }
        } catch {
            print("Error running csrutil: \(error.localizedDescription)")
        }
        
        return "Unable to determine SIP status."
    }
}




struct ExcessivePermissionsView: View {
    var body: some View {
        VStack {
            Image(systemName: "exclamationmark.triangle.fill")
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundColor(.orange)
                .padding()
            
            Text("This application requires permissions to access Camera, Microphone, Location, and Photos.")
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding()

            Text("Please ensure these permissions are granted in System Preferences.")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }
}

struct MinimumOSVersionView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "exclamationmark.triangle")
                .resizable()
                .frame(width: 50, height: 50)
                .foregroundColor(.red)
                .padding()
            
            Text("Please check minimum OS version in Info.plist file.")
                .font(.headline)
                .foregroundColor(.blue)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }
}

struct TouchIDBypassView: View {
    @State private var authResult: String = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("🔒 Touch ID Authentication")
                .font(.headline)
                .padding()

            Button(action: authenticateWithTouchID) {
                Text("👉 Authenticate with Touch ID")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }

            if !authResult.isEmpty {
                HStack {
                    Image(systemName: authResult.contains("Successful") ? "checkmark.circle" : "xmark.circle")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(authResult.contains("Successful") ? .green : .red)
                    Text(authResult)
                        .font(.subheadline)
                        .foregroundColor(authResult.contains("Successful") ? .green : .red)
                }
                .padding()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    func authenticateWithTouchID() {
        let context = LAContext()
        var error: NSError?

        // Check if Touch ID is available
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Authenticate to bypass Touch ID check."

            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                DispatchQueue.main.async {
                    if success {
                        authResult = "Authentication Successful"
                    } else {
                        authResult = "Authentication Failed: \(authenticationError?.localizedDescription ?? "Unknown Error")"
                    }
                }
            }
        } else {
            authResult = "⚠️ Touch ID not available: \(error?.localizedDescription ?? "Unknown Error")"
        }
    }
}

struct SQLInjectionAttackView: View {
    @State private var usernameInput: String = ""
    @State private var resultMessage: String = ""

    let databasePath: String = "\(NSHomeDirectory())/Documents/DVMAData.sqlite"

    var body: some View {
        VStack(spacing: 20) {
            Text("💻 SQL Injection Attack Demo")
                .font(.headline)
                .padding()

            TextField("Enter Username or SQL Payload", text: $usernameInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 40)
                .frame(width: 300)

            Button(action: executeSQLInjection) {
                Text("Execute")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }

            Text(resultMessage)
                .font(.subheadline)
                .foregroundColor(resultMessage.contains("Error") ? .red : .green)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .onAppear(perform: setupDatabase)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    private func setupDatabase() {
        let fileManager = FileManager.default
        if !fileManager.fileExists(atPath: databasePath) {
            var db: OpaquePointer?
            if sqlite3_open(databasePath, &db) == SQLITE_OK {
                let createTableQuery = """
                CREATE TABLE IF NOT EXISTS Users (
                    id INTEGER PRIMARY KEY AUTOINCREMENT,
                    username TEXT,
                    password TEXT,
                    address TEXT,
                    role TEXT
                );
                """
                if sqlite3_exec(db, createTableQuery, nil, nil, nil) == SQLITE_OK {
                    let insertDataQuery = """
                    INSERT INTO Users (username, password, address, role) VALUES
                    ('admin', 'admin123', '123 Admin Lane', 'Administrator'),
                    ('user', 'user123', '456 User Blvd', 'Standard User');
                    """
                    sqlite3_exec(db, insertDataQuery, nil, nil, nil)
                }
                sqlite3_close(db)
            }
        }
    }

    private func executeSQLInjection() {
        var db: OpaquePointer?
        if sqlite3_open(databasePath, &db) == SQLITE_OK {
            // Dynamically building the query without sanitizing the input
            let query = "SELECT username, address, role FROM Users WHERE username = '\(usernameInput)';"
            var statement: OpaquePointer?
            if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {
                var results = [String]()
                while sqlite3_step(statement) == SQLITE_ROW {
                    let username = String(cString: sqlite3_column_text(statement, 0))
                    let address = String(cString: sqlite3_column_text(statement, 1))
                    let role = String(cString: sqlite3_column_text(statement, 2))
                    results.append("👤 \(username) 📍 \(address) 🔑 \(role)")
                }
                resultMessage = results.isEmpty ? "❌ No data found." : results.joined(separator: "\n")
                sqlite3_finalize(statement)
            } else {
                resultMessage = "❌ Query Error: \(String(cString: sqlite3_errmsg(db)))"
            }
            sqlite3_close(db)
        } else {
            resultMessage = "❌ Database Error: Could not open database."
        }
    }
}

struct CommandInjectionAttackView: View {
    @State private var username: String = ""
    @State private var outputText: String = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("💻 Command Injection Attack")
                .font(.headline)
                .padding()

            TextField("Enter your username", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 40)
                .frame(width: 300)

            Button(action: executeCommand) {
                Text("Submit Username")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }

            ScrollView {
                Text(outputText)
                    .font(.subheadline)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.horizontal, 40)
            .frame(maxHeight: 300)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear {
            outputText = "Welcome! Enter a username to see the result here."
        }
    }

    private func executeCommand() {
        guard !username.isEmpty else {
            outputText = "❌ Please enter a username."
            return
        }

        // Execute the command with user input
        let task = Process()
        task.launchPath = "/bin/bash"
        task.arguments = ["-c", "echo \(username)"]

        let pipe = Pipe()
        task.standardOutput = pipe
        task.standardError = pipe

        do {
            try task.run()
            let data = pipe.fileHandleForReading.readDataToEndOfFile()
            if let output = String(data: data, encoding: .utf8) {
                outputText = "✅ Command Output: \n\(output)"
            } else {
                outputText = "❌ Failed to read command output."
            }
        } catch {
            outputText = "❌ Error: \(error.localizedDescription)"
        }
    }
}

struct SensitiveInformationInMemoryView: View {
    @State private var sensitiveInput: String = ""
    @State private var displayedData: String = ""
    @State private var memoryLeak: Bool = false

    var body: some View {
        VStack(spacing: 20) {
            Text("🔒 Sensitive Information in Memory")
                .font(.headline)
                .padding(.top)

            SecureField("🔑 Enter Sensitive Data", text: $sensitiveInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
                .frame(width: 300)

            Toggle("📂 Simulate Memory Leak", isOn: $memoryLeak)
                .padding()

            Button(action: processSensitiveData) {
                HStack {
                    Image(systemName: "checkmark.shield.fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text("💾 Process Data")
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
            }

            if !displayedData.isEmpty {
                VStack(alignment: .leading) {
                    Text("📄 Processed Data:")
                        .font(.subheadline)
                        .padding(.bottom, 5)

                    Text(displayedData)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }

            Spacer()
        }
        .padding()
    }

    func processSensitiveData() {
        // Simulate processing the sensitive input
        displayedData = "🔍 You entered: \(sensitiveInput)"

        // Simulate a memory leak
        if memoryLeak {
            _ = sensitiveInput // Intentionally hold the data in memory
        }

        // Normally, sensitive data should be cleared after use
        // sensitiveInput = "" // Uncomment this to mitigate the issue
    }
}

struct NetworkSecurityDemoView: View {
    @State private var username: String = "admin@gmail.com"
    @State private var password: String = "Admin@123"
    @State private var responseText: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text("🌐 Network Security Demo")
                .font(.headline)
            
            HStack {
                Text("👤")
                TextField("Enter Username", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                    .frame(width: 200)
            }
            
            HStack {
                Text("🔒")
                SecureField("Enter Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                    .frame(width: 200)
            }
            
            Button(action: sendRequest) {
                HStack {
                    Text("🚀 Send Login Request")
                    Image(systemName: "paperplane.fill")
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
            }
            
            Text(responseText)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
        }
        .padding()
    }
    
    func sendRequest() {
        guard let url = URL(string: "https://brokencrystals.com/api/auth/login") else {
            responseText = "❌ Invalid URL"
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("HTTP/2", forHTTPHeaderField: "Protocol") // Optional if necessary for HTTP/2
        
        // JSON body
        let body: [String: Any] = [
            "user": "\(username)",
            "password": "\(password)",
            "op": "basic"
        ]
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: body, options: [])
        } catch {
            responseText = "❌ Error encoding JSON"
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    responseText = "❌ Error: \(error.localizedDescription)"
                }
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                DispatchQueue.main.async {
                    responseText = "✅ Request sent! HTTP Status: \(httpResponse.statusCode)"
                }
            }
            
            if let data = data, let responseString = String(data: data, encoding: .utf8) {
                DispatchQueue.main.async {
                    responseText = "✅ Response: \(responseString)"
                }
            }
        }
        task.resume()
    }
}

struct SSLPinningView: View {
    @State private var responseText: String = "No request made yet."
    
    var body: some View {
        VStack(spacing: 20) {
            Text("🔒 Weak SSL Pinning Demo")
                .font(.headline)
                .padding()
            
            Button(action: sendRequest) {
                Text("Send Request to Test Server")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            
            ScrollView {
                Text(responseText)
                    .font(.subheadline)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.horizontal, 40)
            .frame(maxHeight: 300)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
    }
    
    private func sendRequest() {
        let url = URL(string: "https://self-signed.badssl.com/")!
        let session = URLSession(configuration: .ephemeral, delegate: WeakSSLPinningDelegate(), delegateQueue: nil)
        
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    responseText = "Error: \(error.localizedDescription)"
                }
                return
            }
            
            if let data = data, let responseString = String(data: data, encoding: .utf8) {
                DispatchQueue.main.async {
                    responseText = "Response:\n\(responseString)"
                }
            }
        }
        
        task.resume()
    }
}

class WeakSSLPinningDelegate: NSObject, URLSessionDelegate {
    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        // Weak SSL pinning: Accept any certificate without validation
        completionHandler(.useCredential, URLCredential(trust: challenge.protectionSpace.serverTrust!))
    }
}


struct WebViewXSSAttackView: View {
    @State private var webViewHeight: CGFloat = 300 // Example height
    private let urlString: String = "https://xss-game.appspot.com/level1"

    var body: some View {
        VStack(spacing: 20) {
            Text("🌐 WebView XSS Attack Demo")
                .font(.headline)
                .padding(.top)
            
            Text("🛠️ JavaScript is enabled for this WebView.")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Spacer()

            WebViewContainer(urlString: urlString)
                .frame(height: webViewHeight)
                .cornerRadius(8)
                .shadow(radius: 5)
                .padding(.horizontal)

        }
        .padding()
    }
}

struct WebViewContainer: NSViewRepresentable {
    let urlString: String

    func makeNSView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.configuration.preferences.javaScriptEnabled = true
        webView.uiDelegate = context.coordinator // Assign the delegate for JavaScript alerts

        if let url = URL(string: urlString) {
            webView.load(URLRequest(url: url))
        }

        return webView
    }

    func updateNSView(_ nsView: WKWebView, context: Context) {
        // No update logic required
    }

    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    class Coordinator: NSObject, WKUIDelegate {
        func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
            // Handle JavaScript alerts
            let alert = NSAlert()
            alert.messageText = "JavaScript Alert"
            alert.informativeText = message
            alert.addButton(withTitle: "OK")
            alert.runModal()
            completionHandler()
        }
    }
}

struct WeatherAPIKeyDemoView: View {
    @State private var cityName: String = ""
    @State private var apiKey: String = "6b87a573d0a8c9c8c3f5d7bcfb595891" // Replace with your API key
    @State private var weatherInfo: String = "Weather data will appear here..."

    var body: some View {
        VStack(spacing: 20) {
            Text("🌍 Weather API Key Demo")
                .font(.headline)
                .padding()

            TextField("🏙️ Enter City Name", text: $cityName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding().frame(width: 300)

            Button(action: fetchWeather) {
                Text("🔍 Fetch Weather")
                    .font(.subheadline)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }

            Text("🌦️ Weather Info: \(weatherInfo)")
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
        }
        .padding()
    }

    func fetchWeather() {
        guard !apiKey.isEmpty else {
            weatherInfo = "❌ API Key is missing."
            return
        }

        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=\(apiKey)"
        guard let url = URL(string: urlString) else {
            weatherInfo = "❌ Invalid URL"
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    weatherInfo = "❌ Error: \(error.localizedDescription)"
                }
                return
            }

            if let data = data, let responseString = String(data: data, encoding: .utf8) {
                DispatchQueue.main.async {
                    weatherInfo = responseString
                }
            } else {
                DispatchQueue.main.async {
                    weatherInfo = "❌ No response data received."
                }
            }
        }

        task.resume()
    }
}

struct DataLeakageLogDemoView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var apiResponse: String = "No API request made yet."
    @State private var logs: [String] = []

    var body: some View {
        VStack(spacing: 20) {
            Text("🔒 Data Leakage in Logs Demo")
                            .font(.headline)
                            .padding()

            VStack(spacing: 10) {
                TextField("👤 Username", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 40)
                    .frame(width: 250, height: 30)

                SecureField("🔑 Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 40)
                    .frame(width: 250, height: 30)
            }

            Button(action: makeLoginRequest) {
                Text("🚀 Login")
                    .font(.subheadline)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }

            Text("📡 API Response: \(apiResponse)")
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
        }
        .padding()
    }

    func makeLoginRequest() {
        // Simulate an API request
        let simulatedApiResponse = "Welcome, \(username)!"
        apiResponse = simulatedApiResponse

        // Log sensitive data (intentionally insecure for demo purposes)
        logEvent("🟢 INFO: User attempted login with username: \(username) and password: \(password)")

        // Log API response
        logEvent("🟢 INFO: API Response: \(simulatedApiResponse)")
    }

    func logEvent(_ event: String) {
        // Append logs to in-memory array
        logs.append(event)
        os_log("%{public}@", event)
        // Optionally write logs to a file for a more realistic simulation
        writeLogToFile(event)
    }

    func writeLogToFile(_ log: String) {
        let fileURL = getLogFileURL()
        do {
            let logEntry = log + "\n"
            if FileManager.default.fileExists(atPath: fileURL.path) {
                let fileHandle = try FileHandle(forWritingTo: fileURL)
                fileHandle.seekToEndOfFile()
                fileHandle.write(logEntry.data(using: .utf8)!)
                fileHandle.closeFile()
            } else {
                try logEntry.write(to: fileURL, atomically: true, encoding: .utf8)
            }
        } catch {
            print("🔴 Failed to write log to file: \(error)")
        }
    }

    func getLogFileURL() -> URL {
        let fileManager = FileManager.default
        let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentsDirectory.appendingPathComponent("app_logs.txt")
    }
}

struct FirebaseInsecureDemoView: View {
    @State private var key: String = ""
    @State private var value: String = ""
    @State private var fetchedData: [String: Any] = [:]
    @State private var statusMessage: String = "Ready to interact with Firebase! 🚨"

    var body: some View {
        VStack(spacing: 20) {
            Text("🔥 Insecure Firebase Demo")
                .font(.headline)
                .padding()

            TextField("Key", text: $key)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 40)
                .frame(width: 300)

            TextField("Value", text: $value)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 40)
                .frame(width: 300)

            HStack(spacing: 20) {
                Button(action: writeData) {
                    Text("📤 Write Data")
                        .font(.subheadline)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }

            Text("Status: \(statusMessage)")
                .font(.footnote)
                .foregroundColor(.red)
                .padding()

            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(fetchedData.keys.sorted(), id: \.self) { key in
                        if let value = fetchedData[key] {
                            Text("🔑 \(key): \(value)")
                                .padding(.vertical, 2)
                        }
                    }
                }
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
            .frame(maxHeight: 200)

            Spacer()
        }
        .padding()
        .onAppear {
            FirebaseApp.configure()
        }
    }

    func writeData() {
        guard !key.isEmpty && !value.isEmpty else {
            statusMessage = "❌ Key and Value must not be empty."
            return
        }

        let ref = Database.database().reference()
        
        // Check the current number of entries
        ref.observeSingleEvent(of: .value) { snapshot in
            if let data = snapshot.value as? [String: Any], data.count >= 100 {
                // If there are already 100 entries, delete the oldest entry
                if let oldestKey = data.keys.sorted().first {
                    ref.child(oldestKey).removeValue { error, _ in
                        if let error = error {
                            statusMessage = "❌ Failed to delete oldest entry: \(error.localizedDescription)"
                        } else {
                            // After deleting, write the new data
                            self.writeNewData(ref: ref)
                        }
                    }
                }
            } else {
                // If there are less than 100 entries, write the new data
                self.writeNewData(ref: ref)
            }
        }
    }

    private func writeNewData(ref: DatabaseReference) {
        ref.child(key).setValue(value) { error, _ in
            if let error = error {
                statusMessage = "❌ Failed to write data: \(error.localizedDescription)"
            } else {
                statusMessage = "✅ Data written successfully!"
            }
        }
    }
}

struct KeychainExampleView: View {
    @State private var key: String = ""
    @State private var value: String = ""
    @State private var fetchedData: String = ""
    @State private var statusMessage: String = "Ready to interact with Keychain! 🔑"

    let keychain = KeychainSwift()

    var body: some View {
        VStack(spacing: 20) {
            Text("🔑 Keychain Example")
                .font(.headline)
                .padding()

            TextField("Key", text: $key)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 40)
                .frame(width: 300)

            TextField("Value", text: $value)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 40)
                .frame(width: 300)

            HStack(spacing: 20) {
                Button(action: saveData) {
                    Text("📤 Save Data to Keychain")
                        .font(.subheadline)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }

                Button(action: fetchData) {
                    Text("📥 Fetch Data")
                        .font(.subheadline)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }

            Text("Status: \(statusMessage)")
                .font(.footnote)
                .foregroundColor(.red)
                .padding()

            ScrollView {
                VStack(alignment: .leading) {
                    Text("🔑 Fetched Data: \(fetchedData)")
                        .padding(.vertical, 2)
                }
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
            .frame(maxHeight: 200)

            Spacer()
        }
        .padding()
    }

    func saveData() {
        guard !key.isEmpty && !value.isEmpty else {
            statusMessage = "❌ Key and Value must not be empty."
            return
        }

        // Save data to Keychain
        keychain.set(value, forKey: key, withAccess: .accessibleWhenUnlocked)
        statusMessage = "✅ Data saved successfully!"
    }

    func fetchData() {
        guard !key.isEmpty else {
            statusMessage = "❌ Key must not be empty."
            return
        }

        // Fetch data from Keychain
        if let fetchedValue = keychain.get(key) {
            fetchedData = fetchedValue
            statusMessage = "✅ Data fetched successfully!"
        } else {
            fetchedData = ""
            statusMessage = "❌ No data found for the given key."
        }
    }
}
