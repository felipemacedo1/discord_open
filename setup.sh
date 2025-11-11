#!/bin/bash

# Discord Open - Setup Script
# This script helps you set up the development environment

set -e

echo "🚀 Discord Open - Development Setup"
echo "===================================="
echo ""

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check if .env exists
if [ ! -f "discord_server/.env" ]; then
    echo -e "${YELLOW}⚠️  .env file not found${NC}"
    echo "Creating .env from .env.example..."
    cp discord_server/.env.example discord_server/.env
    echo -e "${GREEN}✅ .env file created${NC}"
    echo -e "${YELLOW}⚠️  Please edit discord_server/.env with your actual values${NC}"
    echo ""
    read -p "Press Enter to continue once you've configured .env..."
else
    echo -e "${GREEN}✅ .env file found${NC}"
fi

# Check Dart installation
if ! command -v dart &> /dev/null; then
    echo -e "${RED}❌ Dart is not installed${NC}"
    echo "Please install Dart SDK: https://dart.dev/get-dart"
    exit 1
fi
echo -e "${GREEN}✅ Dart is installed${NC}"

# Check Flutter installation
if ! command -v flutter &> /dev/null; then
    echo -e "${RED}❌ Flutter is not installed${NC}"
    echo "Please install Flutter SDK: https://flutter.dev/docs/get-started/install"
    exit 1
fi
echo -e "${GREEN}✅ Flutter is installed${NC}"

# Check Docker installation
if ! command -v docker &> /dev/null; then
    echo -e "${RED}❌ Docker is not installed${NC}"
    echo "Please install Docker: https://docs.docker.com/get-docker/"
    exit 1
fi
echo -e "${GREEN}✅ Docker is installed${NC}"

echo ""
echo "📦 Installing backend dependencies..."
cd discord_server
dart pub get

echo ""
echo "🔨 Generating environment code..."
dart run build_runner build --delete-conflicting-outputs

echo ""
echo "🐳 Starting Docker services..."
docker-compose up -d

echo ""
echo "⏳ Waiting for database to be ready..."
sleep 5

echo ""
echo "🗄️  Applying database migrations..."
dart bin/main.dart --apply-migrations --role=maintenance

echo ""
echo "⚙️  Generating Serverpod code..."
serverpod generate

cd ..

echo ""
echo "📱 Installing Flutter dependencies..."
cd discord_flutter
flutter pub get

echo ""
echo "🔨 Generating Flutter code..."
dart run build_runner build -d

cd ..

echo ""
echo -e "${GREEN}========================================${NC}"
echo -e "${GREEN}✅ Setup complete!${NC}"
echo -e "${GREEN}========================================${NC}"
echo ""
echo "To start the backend server:"
echo "  cd discord_server && dart run bin/main.dart"
echo ""
echo "To start the Flutter app:"
echo "  cd discord_flutter && flutter run"
echo ""
echo "📖 For more information, see docs/ENVIRONMENT_SETUP.md"
