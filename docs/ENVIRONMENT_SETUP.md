# Environment Variables Setup Guide

## 🔐 Security First!

This project now uses environment variables to manage sensitive configuration. **Never commit `.env` files to version control!**

## 📋 Quick Setup

### Backend (discord_server)

1. **Copy the example file:**
   ```bash
   cd discord_server
   cp .env.example .env
   ```

2. **Edit `.env` with your actual values:**
   ```bash
   nano .env  # or use your preferred editor
   ```

3. **Install dependencies:**
   ```bash
   dart pub get
   ```

4. **Generate environment code:**
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

5. **Start services:**
   ```bash
   # Start database and Redis
   docker-compose up -d
   
   # Apply migrations
   dart bin/main.dart --apply-migrations --role=maintenance
   
   # Generate Serverpod code
   serverpod generate
   
   # Run server
   dart run bin/main.dart
   ```

### Frontend (discord_flutter)

1. **Configure build-time variables (optional):**
   ```bash
   flutter run --dart-define=SERVER_URL=http://your-server:8080/
   flutter run --dart-define=LIVEKIT_URL=wss://your-livekit-server.com
   ```

2. **For production builds:**
   ```bash
   flutter build apk --dart-define=SERVER_URL=https://api.yourapp.com/
   flutter build ios --dart-define=SERVER_URL=https://api.yourapp.com/
   ```

## 🔑 Required Environment Variables

### Backend (.env)

| Variable | Description | Required | Default |
|----------|-------------|----------|---------|
| `LIVEKIT_API_KEY` | LiveKit API key | Yes* | - |
| `LIVEKIT_API_SECRET` | LiveKit API secret | Yes* | - |
| `LIVEKIT_URL` | LiveKit WebSocket URL | Yes* | - |
| `DATABASE_HOST` | PostgreSQL host | Yes | localhost |
| `DATABASE_PORT` | PostgreSQL port | Yes | 8090 |
| `DATABASE_NAME` | Database name | Yes | discord |
| `DATABASE_USER` | Database user | Yes | postgres |
| `DATABASE_PASSWORD` | Database password | Yes | - |
| `REDIS_ENABLED` | Enable Redis | No | false |
| `REDIS_HOST` | Redis host | No | localhost |
| `REDIS_PORT` | Redis port | No | 8091 |
| `REDIS_PASSWORD` | Redis password | No | - |
| `SERVER_HOST` | Server hostname | Yes | localhost |
| `SERVER_PORT` | Server port | Yes | 8080 |
| `SERVER_PUBLIC_SCHEME` | http or https | Yes | http |
| `ENVIRONMENT` | development/staging/production | Yes | development |

\* *Required if using video/audio features*

## 🚀 Deployment

### Development
Use the `.env` file with default values from `.env.example`.

### Staging/Production
Set environment variables through your hosting platform:

**Docker:**
```bash
docker run -e DATABASE_PASSWORD=xxx -e LIVEKIT_API_KEY=xxx ...
```

**Kubernetes:**
```yaml
apiVersion: v1
kind: Secret
metadata:
  name: discord-secrets
type: Opaque
data:
  database-password: <base64-encoded>
  livekit-api-key: <base64-encoded>
```

**Railway/Heroku:**
Use the platform's environment variables UI.

**AWS/GCP:**
Use Secret Manager or Parameter Store.

## 🔍 Troubleshooting

### Error: "env.g.dart not found"
Run: `dart run build_runner build --delete-conflicting-outputs`

### Error: "Missing environment variable"
Check that your `.env` file exists and has all required variables.

### Docker Compose not reading .env
Make sure `.env` is in the same directory as `docker-compose.yaml`.

## 🛡️ Security Best Practices

1. ✅ **Never commit `.env` files**
2. ✅ **Use strong, unique passwords**
3. ✅ **Rotate credentials regularly**
4. ✅ **Use different credentials per environment**
5. ✅ **Store production secrets in secure vaults**
6. ✅ **Limit access to production credentials**
7. ✅ **Use HTTPS in production**
8. ✅ **Enable audit logging**

## 📚 Additional Resources

- [Envied Documentation](https://pub.dev/packages/envied)
- [Twelve-Factor App - Config](https://12factor.net/config)
- [OWASP Secrets Management](https://cheatsheetseries.owasp.org/cheatsheets/Secrets_Management_Cheat_Sheet.html)
