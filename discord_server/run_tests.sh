#!/bin/bash

# Script para executar testes do Discord Server
# Uso: ./run_tests.sh [options]

set -e

# Cores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Diretório do projeto
PROJECT_DIR="discord_server"

echo -e "${BLUE}🧪 Discord Server Test Runner${NC}\n"

# Função para exibir ajuda
show_help() {
    echo "Uso: ./run_tests.sh [OPTIONS]"
    echo ""
    echo "Opções:"
    echo "  -h, --help              Exibir esta mensagem de ajuda"
    echo "  -a, --all               Executar todos os testes (padrão)"
    echo "  -u, --unit              Executar apenas testes unitários"
    echo "  -i, --integration       Executar apenas testes de integração"
    echo "  -c, --coverage          Executar testes com cobertura"
    echo "  -v, --verbose           Modo verbose"
    echo "  -w, --watch             Modo watch (re-executa ao detectar mudanças)"
    echo "  -f, --file FILE         Executar arquivo de teste específico"
    echo ""
    echo "Exemplos:"
    echo "  ./run_tests.sh                           # Todos os testes"
    echo "  ./run_tests.sh --unit                    # Apenas unitários"
    echo "  ./run_tests.sh --coverage                # Com cobertura"
    echo "  ./run_tests.sh -f test/utils/auth_helper_test.dart  # Arquivo específico"
}

# Verificar se Dart está instalado
check_dart() {
    if ! command -v dart &> /dev/null; then
        echo -e "${RED}❌ Dart não encontrado!${NC}"
        echo -e "${YELLOW}Por favor, instale o Dart SDK: https://dart.dev/get-dart${NC}"
        exit 1
    fi
}

# Instalar dependências
install_deps() {
    echo -e "${YELLOW}📦 Instalando dependências...${NC}"
    cd "$PROJECT_DIR"
    dart pub get
    echo -e "${GREEN}✅ Dependências instaladas${NC}\n"
}

# Gerar código (se necessário)
generate_code() {
    if [ -f "pubspec.yaml" ] && grep -q "build_runner" pubspec.yaml; then
        echo -e "${YELLOW}🔨 Gerando código...${NC}"
        dart run build_runner build --delete-conflicting-outputs
        echo -e "${GREEN}✅ Código gerado${NC}\n"
    fi
}

# Executar testes
run_tests() {
    local args="$1"
    local verbose="$2"
    
    echo -e "${BLUE}🚀 Executando testes...${NC}\n"
    
    if [ "$verbose" = "true" ]; then
        dart test $args --reporter=expanded
    else
        dart test $args
    fi
}

# Executar testes com cobertura
run_with_coverage() {
    echo -e "${BLUE}📊 Executando testes com cobertura...${NC}\n"
    
    # Verificar se coverage está instalado
    if ! command -v genhtml &> /dev/null; then
        echo -e "${YELLOW}⚠️  genhtml não encontrado. Instalando lcov...${NC}"
        if [[ "$OSTYPE" == "linux-gnu"* ]]; then
            sudo apt-get install -y lcov
        elif [[ "$OSTYPE" == "darwin"* ]]; then
            brew install lcov
        fi
    fi
    
    # Executar testes com cobertura
    dart test --coverage=coverage
    
    # Formatar cobertura
    dart pub global activate coverage
    dart pub global run coverage:format_coverage \
        --lcov \
        --in=coverage \
        --out=coverage/lcov.info \
        --packages=.dart_tool/package_config.json \
        --report-on=lib
    
    # Gerar HTML
    genhtml coverage/lcov.info -o coverage/html
    
    echo -e "\n${GREEN}✅ Relatório de cobertura gerado em: coverage/html/index.html${NC}"
    echo -e "${BLUE}Para abrir o relatório:${NC}"
    echo -e "  ${YELLOW}open coverage/html/index.html${NC}  # macOS"
    echo -e "  ${YELLOW}xdg-open coverage/html/index.html${NC}  # Linux"
    echo -e "  ${YELLOW}start coverage/html/index.html${NC}  # Windows"
}

# Main
main() {
    local test_type="all"
    local verbose="false"
    local coverage="false"
    local watch="false"
    local specific_file=""
    
    # Parse argumentos
    while [[ $# -gt 0 ]]; do
        case $1 in
            -h|--help)
                show_help
                exit 0
                ;;
            -a|--all)
                test_type="all"
                shift
                ;;
            -u|--unit)
                test_type="unit"
                shift
                ;;
            -i|--integration)
                test_type="integration"
                shift
                ;;
            -c|--coverage)
                coverage="true"
                shift
                ;;
            -v|--verbose)
                verbose="true"
                shift
                ;;
            -w|--watch)
                watch="true"
                shift
                ;;
            -f|--file)
                specific_file="$2"
                shift 2
                ;;
            *)
                echo -e "${RED}Opção desconhecida: $1${NC}"
                show_help
                exit 1
                ;;
        esac
    done
    
    # Verificar Dart
    check_dart
    
    # Instalar dependências
    install_deps
    
    # Gerar código
    generate_code
    
    # Construir argumentos de teste
    local test_args=""
    
    if [ -n "$specific_file" ]; then
        test_args="$specific_file"
    elif [ "$test_type" = "unit" ]; then
        test_args="test/utils test/endpoints"
    elif [ "$test_type" = "integration" ]; then
        test_args="test/integration"
    fi
    
    # Executar testes
    if [ "$coverage" = "true" ]; then
        run_with_coverage
    elif [ "$watch" = "true" ]; then
        echo -e "${BLUE}👀 Modo watch ativado (Ctrl+C para sair)${NC}\n"
        dart test $test_args --reporter=expanded --watch
    else
        run_tests "$test_args" "$verbose"
    fi
    
    echo -e "\n${GREEN}✅ Testes concluídos!${NC}"
}

# Executar main com todos os argumentos
main "$@"
