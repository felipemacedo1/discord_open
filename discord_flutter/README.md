# Discord Flutter

A modern Flutter application implementing Discord-like features with real-time communication and live streaming capabilities.

## 🌟 Features

- 🔐 User Authentication
- 💬 Real-time Chat
- 🎥 Live Streaming
- 🖥️ Cross-platform Support (iOS, Android, Web, Desktop)
- 🎨 Modern Material Design UI
- 🌐 Serverpod Integration

## 🛠️ Tech Stack

- **Framework**: Flutter 3.29.0+
- **Language**: Dart 3.7.0+
- **State Management**: flutter_bloc
- **Dependency Injection**: get_it
- **Navigation**: auto_route
- **API Integration**: Serverpod
- **Live Streaming**: LiveKit
- **Code Generation**: freezed, json_serializable

## 📋 Prerequisites

- Flutter SDK (3.27.0 or higher)
- Dart SDK (3.7.0 or higher)
- Discord Server running (see discord_server directory)
- IDE with Flutter support (VS Code, Android Studio, or IntelliJ)

## 🚀 Getting Started

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd discord_flutter
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run code generation**
   ```bash
   flutter pub run build_runner build --d
   ```

4. **Start the Serverpod server**
   Navigate to the discord_server directory and start the server

5. **Run the application**
   ```bash
   flutter run
   ```

## 📱 Supported Platforms

- ✅ Android
- ✅ iOS
- ✅ Web
- ✅ Windows
- ✅ macOS
- ✅ Linux

## 🏗️ Project Structure

lib/
├── application/ # Business Logic and State Management
├── infrastructure/ # Data Layer and External Services
├── presentation/ # UI Components and Screens
│ ├── auth/ # Authentication UI
│ ├── core/ # Core UI Components
│ └── home/ # Main App UI
├── main.dart # Entry Point
└── locator.dart # Dependency Injection Setup

## 🔧 Configuration

The application requires several configuration steps:

1. Server Configuration
   - Update the server endpoint in `configs.dart`
   - Configure authentication settings

2. LiveKit Setup (for streaming)
   - Set up LiveKit credentials
   - Configure streaming endpoints

## 🧪 Testing

Run the tests using:
```bash
flutter test
```

## 📦 Building for Production

1. **Android**
   ```bash
   flutter build apk --release
   ```

2. **iOS**
   ```bash
   flutter build ios --release
   ```

3. **Web**
   ```bash
   flutter build web --release
   ```

4. **Desktop**
   ```bash
   flutter build windows/macos/linux --release
   ```

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📄 License

This project is licensed under the [LICENSE_TYPE] - see the LICENSE file for details.

## 🙏 Acknowledgments

- Flutter Team for the amazing framework
- Serverpod for the backend solution
- LiveKit for streaming capabilities