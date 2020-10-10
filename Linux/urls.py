from bs4 import BeautifulSoup

def get_urls():
    response = request.get('https://www.baidu.com')
    s = BeautufulSoup(response.content, 'lxml')
    urls = []
    for url in s.find_all('a'):
        urls.append(url['href'])

if __name__ == '__main__':
    get_urls()
