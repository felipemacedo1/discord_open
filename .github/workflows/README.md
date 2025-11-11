# GitHub Actions Workflows

Este diretório contém todos os workflows do GitHub Actions para CI/CD, segurança e qualidade de código.

## 📋 Workflows Disponíveis

### 1. 🔄 CI/CD Pipeline (`ci.yml`)

**Trigger:** Push em branches principais, Pull Requests

**Jobs:**
- 🔍 **Analyze Server** - Análise estática do código Dart do servidor
- 🧪 **Test Server** - Testes unitários com cobertura (PostgreSQL + Redis)
- 🔍 **Analyze Client** - Análise estática do código Dart do cliente
- 🏗️ **Build Flutter** - Build do app Flutter para Android
- 🔒 **Security Scan** - Varredura de vulnerabilidades com Trivy
- 🔍 **Dependency Review** - Revisão de dependências (apenas PRs)
- 📋 **Build Summary** - Resumo de todos os checks

**Características:**
- ✅ Testes com cobertura de código
- ✅ Upload para Codecov
- ✅ Artifact do APK Android
- ✅ Resumo visual no GitHub

**Secrets Necessários:**
- `CODECOV_TOKEN` (opcional) - Para upload de cobertura

### 2. 🚀 Deploy (`deploy.yml`)

**Trigger:** Push em develop/main, Tags, Manual

**Jobs:**
- 🐳 **Build & Push** - Constrói e publica imagem Docker no GitHub Container Registry
- 🚀 **Deploy Staging** - Deploy automático para staging (develop)
- 🌟 **Deploy Production** - Deploy para produção (main/tags) com aprovação manual
- 🧪 **Smoke Tests** - Testes pós-deploy no staging
- ⏮️ **Rollback** - Rollback automático em caso de falha

**Ambientes:**
- **Staging:** `https://staging.discord-open.com`
- **Production:** `https://discord-open.com`

**Secrets Necessários (AWS):**
- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`
- `AWS_REGION`

**Secrets Necessários (GCP):**
- `GCP_PROJECT_ID`
- `GCP_SA_KEY`

**Características:**
- ✅ Multi-cloud (AWS ECS + GCP Cloud Run)
- ✅ Aprovação manual para produção
- ✅ Smoke tests automáticos
- ✅ Rollback em caso de falha
- ✅ Criação automática de releases

### 3. 🔒 Security & Quality (`security.yml`)

**Trigger:** Push, Pull Requests, Schedule (diário às 2 AM UTC)

**Jobs:**
- 🔍 **CodeQL Analysis** - Análise de segurança de código
- 🔒 **Dependency Scan** - Varredura de dependências vulneráveis
- 🛡️ **SAST** - Static Application Security Testing com Semgrep
- 🔐 **Secret Scan** - Detecção de segredos com Gitleaks
- 📜 **License Check** - Verificação de conformidade de licenças
- 📊 **Code Metrics** - Métricas de qualidade de código
- 🐳 **Docker Scan** - Varredura de vulnerabilidades em imagens Docker
- 📋 **Security Summary** - Resumo consolidado de segurança

**Características:**
- ✅ Execução diária automática
- ✅ Múltiplas ferramentas de segurança
- ✅ Upload para GitHub Security
- ✅ Relatórios detalhados

**Secrets Necessários:**
- `GITLEAKS_LICENSE` (opcional) - Para versão premium do Gitleaks

### 4. ✅ PR Checks (`pr-checks.yml`)

**Trigger:** Pull Requests (opened, synchronize, reopened, ready_for_review)

**Jobs:**
- ✅ **PR Validation** - Validação de título e descrição
- 📏 **PR Size Check** - Análise de tamanho do PR
- 🔀 **Conflict Check** - Detecção de conflitos
- 🚨 **Breaking Changes** - Detecção de mudanças breaking
- 📊 **Coverage Comparison** - Comparação de cobertura de testes
- 👥 **PR Assignment** - Verificação de assignees e reviewers
- 🏷️ **Auto Label** - Aplicação automática de labels

**Características:**
- ✅ Validação semântica de título (feat, fix, docs, etc.)
- ✅ Alertas para PRs grandes (>1000 linhas)
- ✅ Comentários automáticos com cobertura
- ✅ Auto-labeling baseado em arquivos modificados

## 🚀 Como Usar

### Executar Manualmente um Workflow

1. Vá para **Actions** no GitHub
2. Selecione o workflow desejado
3. Clique em **Run workflow**
4. Escolha a branch e parâmetros (se aplicável)

### Secrets Necessários

Configure os seguintes secrets no GitHub:

**Repositório → Settings → Secrets and variables → Actions**

#### Essenciais (CI/CD):
- `CODECOV_TOKEN` - Token do Codecov (opcional, para cobertura)

#### Deploy AWS:
- `AWS_ACCESS_KEY_ID` - AWS Access Key
- `AWS_SECRET_ACCESS_KEY` - AWS Secret Key
- `AWS_REGION` - Região AWS (ex: us-east-1)

#### Deploy GCP:
- `GCP_PROJECT_ID` - ID do projeto GCP
- `GCP_SA_KEY` - Chave da Service Account (JSON)

#### Segurança:
- `GITLEAKS_LICENSE` - Licença Gitleaks (opcional)

### Ambientes do GitHub

Configure os ambientes em **Settings → Environments**:

1. **staging**
   - URL: https://staging.discord-open.com
   - Deploy automático de `develop`
   - Sem aprovação necessária

2. **production**
   - URL: https://discord-open.com
   - Deploy de `main` ou tags
   - **Requer aprovação manual**
   - Reviewers: adicionar mantenedores

## 📊 Badges

Adicione badges ao README.md:

```markdown
[![CI/CD](https://github.com/felipemacedo1/discord_open/actions/workflows/ci.yml/badge.svg)](https://github.com/felipemacedo1/discord_open/actions/workflows/ci.yml)
[![Security](https://github.com/felipemacedo1/discord_open/actions/workflows/security.yml/badge.svg)](https://github.com/felipemacedo1/discord_open/actions/workflows/security.yml)
[![codecov](https://codecov.io/gh/felipemacedo1/discord_open/branch/main/graph/badge.svg)](https://codecov.io/gh/felipemacedo1/discord_open)
```

## 🔧 Configuração Avançada

### Branch Protection Rules

Configure em **Settings → Branches → Branch protection rules** para `main` e `develop`:

- ✅ Require a pull request before merging
- ✅ Require approvals (1-2 reviewers)
- ✅ Require status checks to pass before merging
  - ✅ Analyze Server Code
  - ✅ Test Server
  - ✅ Build Flutter App
  - ✅ Security Scan
- ✅ Require branches to be up to date before merging
- ✅ Require conversation resolution before merging
- ✅ Include administrators

### Notification Settings

Configure notificações do Slack/Discord (opcional):

```yaml
- name: 📢 Notify Slack
  uses: slackapi/slack-github-action@v1
  with:
    payload: |
      {
        "text": "Deployment completed to ${{ github.ref_name }}"
      }
  env:
    SLACK_WEBHOOK_URL: ${{ secrets.SLACK_WEBHOOK_URL }}
```

## 📈 Monitoramento

### Métricas de CI/CD

- **Build Time:** ~5-10 minutos
- **Test Coverage:** Objetivo 50%+ (atual: ~60%)
- **Deploy Time:** ~3-5 minutos

### Dashboards

1. **GitHub Actions**: https://github.com/felipemacedo1/discord_open/actions
2. **Codecov**: https://codecov.io/gh/felipemacedo1/discord_open
3. **Security**: https://github.com/felipemacedo1/discord_open/security

## 🐛 Troubleshooting

### Build Falhando

1. Verificar logs no GitHub Actions
2. Executar localmente: `./discord_server/run_tests.sh`
3. Verificar se dependências estão atualizadas

### Deploy Falhando

1. Verificar secrets configurados
2. Verificar permissões IAM (AWS/GCP)
3. Verificar health checks

### Testes Falhando

1. Verificar se PostgreSQL/Redis estão rodando
2. Verificar variáveis de ambiente
3. Executar `dart test --reporter=expanded` para detalhes

## 📚 Recursos

- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [Dart CI/CD](https://dart.dev/tools/continuous-integration)
- [Flutter CI/CD](https://docs.flutter.dev/deployment/cd)
- [Serverpod Deployment](https://docs.serverpod.dev/deployment)

## 🎯 Próximos Passos

- [ ] Configurar notificações Slack/Discord
- [ ] Adicionar testes E2E
- [ ] Configurar performance testing
- [ ] Adicionar iOS build
- [ ] Configurar automated dependency updates (Dependabot)
- [ ] Adicionar canary deployments
- [ ] Configurar blue-green deployment

---

**Autor:** Felipe Macedo (@felipemacedo1)  
**Última atualização:** 11 de Novembro de 2025
