# Discord Clone - Full Stack Application

A modern Discord-like application built with Flutter, Serverpod, and LiveKit for real-time communication and live streaming capabilities. This project is based on the Discord redesign concept by [Juxtopposed](https://www.youtube.com/@juxtopposed).

## 🔗 Links

- **YouTube Video**: https://youtu.be/byOv5MXwN58
- **Medium Article**: https://medium.com/@rawahamuhammad8/i-built-a-redesigned-discord-with-flutter-serverpod-e8f3bf3e6d42

## 📖 Explainer Resources

### Layout Explainer (8K)
<img src="assets/layout_explainer.png" alt="Layout Explainer" width="800"/>

### Routing Explainer (8K)
<img src="assets/routing_explainer_8k.png" alt="Routing Explainer" width="800"/>

### State Management Explainer (8K)
<img src="assets/state_management_explainer.png" alt="State Management Explainer" width="800"/>

## 🚀 Features

### Core Features
- **Real-time Chat**: Instant messaging with support for text channels
- **Voice & Video Calls**: Live streaming with WebRTC technology
- **Server Management**: Create and manage Discord-like servers
- **User Authentication**: Secure email-based authentication system
- **Cross-platform**: Works on mobile (iOS/Android), desktop (macOS), and web
- **Modern UI**: Dark theme with Discord-inspired design
- **Live Streaming**: High-quality video calls with screen sharing
- **Channel Management**: Text and voice channels within servers
- **Responsive Design**: Optimized for all screen sizes

## 📸 Project Images

### Chat Section on Android
<img src="assets/android_chat.png" alt="Chat section on Android" width="300"/>

### Server and Channel Section on Android
<img src="assets/android_main.png" alt="Server and Channel Section on Android" width="300"/>

### Chat Section on iOS
<img src="assets/iOS_chat.png" alt="Chat Section on iOS" width="300"/>

### Server and Channel Section on iOS
<img src="assets/iOS_main.png" alt="Server and Channel Section on iOS" width="300"/>

### Voice Call on macOS
<img src="assets/both_users_joined_mac.png" alt="Voice call on macOS" width="800"/>

### Video Call on macOS
<img src="assets/camera_on_mac.png" alt="Video call on macOS" width="800"/>

### Screen Share on macOS
<img src="assets/screen_share_mac.png" alt="Screen Share on macOS" width="800"/>

### Voice Call on Web
<img src="assets/both_users_joine_web.png" alt="Voice call on Web" width="800"/>

### Video Call on Web
<img src="assets/camera_on_web.png" alt="Video call on Web" width="800"/>

### Screen Share on Web
<img src="assets/screen_share_web.png" alt="Screen Share on Web" width="800"/>

## 🏗️ Architecture

This project follows a clean architecture pattern with three main components:

### 1. **discord_flutter** - Frontend Application
- **Framework**: Flutter with Dart
- **State Management**: BLoC (Business Logic Component) pattern
- **Navigation**: Auto Route for type-safe navigation
- **UI**: Custom Discord-inspired components
- **Dependencies**: 
  - `flutter_bloc` for state management
  - `auto_route` for navigation
  - `livekit_client` for video calls
  - `flutter_webrtc` for WebRTC functionality
  - `freezed` for immutable data classes

### 2. **discord_server** - Backend Server
- **Framework**: Serverpod (Dart-based backend)
- **Authentication**: Serverpod Auth with email
- **Real-time**: WebSocket connections for live updates
- **Live Streaming**: LiveKit integration for video calls & screen share
- **API**: RESTful endpoints with type-safe client generation

### 3. **discord_client** - Generated Client
- **Purpose**: Type-safe client for server communication
- **Generation**: Auto-generated from Serverpod backend
- **Features**: Automatic serialization/deserialization

## 📋 Prerequisites

Before running this project, ensure you have the following installed:

- **Dart SDK**: `>=3.3.0 <4.0.0`
- **Flutter SDK**: `>=3.19.0`
- **LiveKit Server**: For video calling functionality

## 🛠️ Installation & Setup

### 1. Clone the Repository
```bash
git clone <repository-url>
cd discord_open
```

### 2. Setup Backend Server

First, start the backend server as it's required for the Flutter app to function:

```bash
cd discord_server

# Install dependencies
dart pub get

# Start database
docker-compose up --build --detach

# Create migration
serverpod create-migration

# Apply migrations on server
dart bin/main.dart --apply-migrations --role=maintenance

# After every change you make to the server-side code, you need to run 
serverpod generate

# Run the server
dart run bin/main.dart
```

The server will start on `http://localhost:8080` by default.

### 3. Setup Flutter Application

```bash
cd discord_flutter

# Install Flutter dependencies
flutter pub get

# Generate freezed files (required for cubit states)
dart run build_runner build -d

# Run the application
flutter run
```

### 4. Environment Configuration

#### Frontend Configuration (`discord_flutter/lib/configs.dart`)
```dart
class Configs {
  static const String serverUrl = 'http://localhost:8080';
  static const String liveKitUrl = 'wss://your_livekit_server.com';
}
```

## 🚀 Quick Start Guide

### For Developers

1. **Start the Backend**:
   ```bash
   cd discord_server
   //run docker
   docker-compose up --build --detach
   //apply migrations on server
   dart bin/main.dart --apply-migrations --role=maintenance
   //generate 
   serverpod generate
   //run server
   dart run bin/main.dart
   ```

2. **Start the Frontend**:
   ```bash
   cd discord_flutter
   flutter pub get
   dart run build_runner build -d
   flutter run
   ```

3. **Access the Application**:
   - Mobile: Use Flutter's hot reload for development
   - Web: Open the provided link from the Debug Console
   - macOS: The app will open in a native window

### For Users

1. **Create an Account**: Use email authentication to sign up
2. **Join/Create Servers**: Start by creating your first server
3. **Create Channels**: Add text and voice channels to your server
4. **Start Chatting**: Send messages in text channels
5. **Join Voice Calls**: Click on voice channels to start video calls

## 📱 Supported Platforms

- ✅ **iOS** (iPhone/iPad)
- ✅ **Android** (Phone/Tablet)
- ✅ **macOS** (Desktop)
- ✅ **Web** (Browser)

## 🔧 Development

### Project Structure

```
discord_open/
├── discord_flutter/          # Flutter frontend application
│   ├── lib/
│   │   ├── application/      # Business logic (BLoC)
│   │   ├── infrastructure/   # Data layer (repositories)
│   │   ├── presentation/     # UI layer (screens, widgets)
│   │   └── configs.dart      # Configuration
│   └── assets/              # Images, icons, mock data
├── discord_server/           # Serverpod backend
│   ├── lib/
│   │   ├── src/
│   │   │   ├── endpoints/    # API endpoints
│   │   │   ├── models/       # Data models
│   │   │   └── generated/    # Auto-generated code
│   │   └── server.dart       # Server configuration
│   └── migrations/          # Database migrations
└── discord_client/          # Generated client code
```

### Key Technologies

- **Frontend**: Flutter, BLoC, Auto Route, LiveKit Client
- **Backend**: Serverpod, PostgreSQL, LiveKit Server
- **Real-time**: WebSockets, WebRTC
- **State Management**: BLoC pattern
- **Code Generation**: Freezed, Build Runner

### Development Commands

```bash
# Database Management
docker-compose down -v          # Clear database
docker-compose up --build --detach  # Start database

# Server Management
dart bin/main.dart --apply-migrations --role=maintenance  # Apply migrations on server
serverpod create-migration      # Create migration
serverpod generate             # Generate server code
dart run bin/main.dart         # Run server

# Flutter Development
dart run build_runner build -d  # Generate freezed files
dart run build_runner watch     # Watch for changes and regenerate
dart run build_runner clean     # Clean generated files

# Testing & Code Quality
flutter test                    # Run tests
dart format .                   # Format code
dart analyze                    # Analyze code
```

## 🧪 Testing

```bash
# Run Flutter tests
cd discord_flutter
flutter test

# Run server tests
cd discord_server
dart test
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🆘 Support

If you encounter any issues or have questions:

1. Check the [Issues](https://github.com/your-repo/issues) page
2. Create a new issue with detailed information
3. Join our Discord server for community support

## 💬 Join Our Discord Community

Have questions, need support, or want to collaborate and discuss future ideas? Join our Discord community!

[Click here to join the Discord server](https://discord.gg/XgS4KmgRRN)

I'm actively providing support for this project and am open to collaboration and new ideas from the community.

## ☕ Support Me

If you find this project helpful or want to support my work, you can buy me a coffee!

[Buy Me a Coffee](https://buymeacoffee.com/rawaha)

---

## 🙏 Acknowledgments

- **Serverpod** team for the amazing backend framework
- **LiveKit** for real-time video calling capabilities
- **Flutter** team for the cross-platform framework
- **Juxtopposed** for the UI/UX inspiration

---

**Note**: This is a Discord clone for educational purposes. Please respect Discord's terms of service and trademarks. 