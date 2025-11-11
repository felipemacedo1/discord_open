# Discord Server Tests

Este diretório contém os testes unitários e de integração para o backend do Discord Open.

## 📁 Estrutura de Testes

```
test/
├── utils/
│   ├── auth_helper_test.dart       # Testes de autenticação e autorização
│   ├── rate_limiter_test.dart      # Testes de rate limiting
│   └── app_logger_test.dart        # Testes de logging
├── endpoints/
│   └── message_endpoint_test.dart  # Testes do endpoint de mensagens
└── integration/
    └── ... (testes de integração)
```

## 🧪 Tipos de Testes

### Testes Unitários

#### **AuthHelper Tests** (`utils/auth_helper_test.dart`)
- ✅ Validação de autenticação de usuário
- ✅ Verificação de propriedade de recursos
- ✅ Exceções (UnauthorizedException, ForbiddenException)
- ✅ Checagem de status de autenticação

**Cobertura:** 100% do AuthHelper

#### **RateLimiter Tests** (`utils/rate_limiter_test.dart`)
- ✅ Algoritmo token bucket
- ✅ Limites por operação (messages, auth, api, channels, servers)
- ✅ Rastreamento por identificador
- ✅ Cleanup de memória
- ✅ Reset de limites
- ✅ Contagem de requisições e limites restantes

**Cobertura:** 100% do RateLimiter

#### **AppLogger Tests** (`utils/app_logger_test.dart`)
- ✅ Níveis de log (debug, info, warning, error, fatal)
- ✅ Logs categorizados (endpoint, auth, database, websocket)
- ✅ Consciência de ambiente (production/development)

**Cobertura:** Métodos principais do AppLogger

### Testes de Integração

#### **MessageEndpoint Tests** (`endpoints/message_endpoint_test.dart`)
- ✅ Autenticação obrigatória
- ✅ Validação de propriedade de mensagens
- ✅ Rate limiting em envio de mensagens
- ✅ Autorização para deletar mensagens
- ✅ Autorização para editar mensagens
- ✅ Tratamento de exceções

**Cobertura:** Cenários críticos do MessageEndpoint

## 🚀 Como Executar os Testes

### Pré-requisitos

```bash
# 1. Instalar dependências
cd discord_server
dart pub get

# 2. Gerar código necessário (se ainda não foi feito)
dart run build_runner build
```

### Executar Todos os Testes

```bash
dart test
```

### Executar Testes Específicos

```bash
# Apenas testes de autenticação
dart test test/utils/auth_helper_test.dart

# Apenas testes de rate limiting
dart test test/utils/rate_limiter_test.dart

# Apenas testes de logger
dart test test/utils/app_logger_test.dart

# Apenas testes do endpoint de mensagens
dart test test/endpoints/message_endpoint_test.dart
```

### Executar com Cobertura

```bash
# Instalar ferramenta de cobertura (se ainda não tiver)
dart pub global activate coverage

# Executar testes com cobertura
dart test --coverage=coverage

# Gerar relatório HTML
genhtml coverage/lcov.info -o coverage/html

# Abrir relatório
open coverage/html/index.html  # macOS
xdg-open coverage/html/index.html  # Linux
start coverage/html/index.html  # Windows
```

### Executar em Modo Verbose

```bash
dart test --reporter=expanded
```

## 📊 Cobertura de Testes

### Meta de Cobertura
- **Objetivo:** 50%+ de cobertura de código
- **Prioridade:** Endpoints críticos, autenticação, segurança

### Status Atual (Sprint 1)

| Módulo | Arquivos Testados | Cobertura Estimada |
|--------|-------------------|-------------------|
| **Utils** | auth_helper, rate_limiter, app_logger | ~90% |
| **Endpoints** | message_endpoint | ~70% |
| **Total** | 4 arquivos | ~60% |

### Próximos Passos
- [ ] Testes para `health_endpoint.dart`
- [ ] Testes para `discord_user_endpoint.dart`
- [ ] Testes para `discord_server_endpoint.dart`
- [ ] Testes para `discord_channel_endpoint.dart`
- [ ] Testes de integração end-to-end

## 🔧 Tecnologias Utilizadas

- **test** (^1.24.2): Framework de testes Dart
- **mocktail** (^1.0.0): Biblioteca de mocking
- **serverpod_test** (2.6.0): Utilitários de teste Serverpod

## 📝 Convenções de Teste

### Estrutura de Teste
```dart
void main() {
  group('NomeDaClasse', () {
    late ClasseEmTeste instance;
    
    setUp(() {
      // Configuração antes de cada teste
      instance = ClasseEmTeste();
    });
    
    tearDown(() {
      // Limpeza após cada teste
    });
    
    group('nomeDoMetodo', () {
      test('deve fazer algo quando condição', () {
        // Arrange (preparar)
        
        // Act (executar)
        
        // Assert (validar)
      });
    });
  });
}
```

### Nomenclatura
- **Descrição clara:** "deve fazer X quando Y"
- **Arrange-Act-Assert:** Padrão AAA
- **Um conceito por teste:** Cada teste valida uma única coisa

### Mocking
```dart
// Criar mock
class MockSessao extends Mock implements Session {}

// Configurar comportamento
when(() => mock.metodo()).thenReturn(valor);
when(() => mock.metodo()).thenAnswer((_) async => valor);

// Verificar chamadas
verify(() => mock.metodo()).called(1);
verifyNever(() => mock.metodo());
```

## 🐛 Debugging de Testes

### Teste Individual Falhando
```bash
# Executar apenas um teste
dart test test/caminho/para/arquivo_test.dart --name "nome do teste"

# Modo verbose para ver detalhes
dart test --reporter=expanded test/caminho/para/arquivo_test.dart
```

### Problemas Comuns

1. **Mock não configurado:** Verifique se todos os métodos chamados têm `when()` configurado
2. **Async não aguardado:** Use `async/await` para operações assíncronas
3. **State compartilhado:** Use `setUp()` e `tearDown()` para limpar estado

## 📚 Recursos Adicionais

- [Dart Testing Documentation](https://dart.dev/guides/testing)
- [Mocktail Documentation](https://pub.dev/packages/mocktail)
- [Serverpod Testing Guide](https://docs.serverpod.dev/testing)
- [Test Coverage Best Practices](https://martinfowler.com/bliki/TestCoverage.html)

## ✅ Checklist de PR

Antes de abrir um PR, certifique-se de:

- [ ] Todos os testes passando (`dart test`)
- [ ] Cobertura adequada (50%+ para novos códigos)
- [ ] Testes seguem convenções do projeto
- [ ] Sem warnings do linter (`dart analyze`)
- [ ] Documentação atualizada (se necessário)

---

**Última atualização:** Sprint 1 - Security Foundation  
**Mantido por:** Felipe Macedo (@felipemacedo1)
