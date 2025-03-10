

def main():
    import requests

    url = "https://servicodados.ibge.gov.br/api/v1/localidades/municipios"

    try:
        resposta = requests.get(url, timeout=30)

        print("Status code:", resposta.status_code)
        print("Tipo de resposta:", resposta.headers.get("Content-Type"))
        print("Primeiros 500 caracteres:")
        print(resposta.text[:500])

    except requests.exceptions.Timeout:
        print("Erro: a API demorou demais para responder.")

    except requests.exceptions.ConnectionError:
        print("Erro: problema de conexão com a internet ou com a API.")

    except Exception as erro:
        print("Erro inesperado:", erro)



if __name__ == "__main__":    
    main()