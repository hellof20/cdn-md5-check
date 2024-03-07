import hashlib
import requests
import functions_framework

@functions_framework.http
def md5_check(request):
    request_json = request.get_json(silent=True)
    url = request_json['url']
    md5 = request_json['md5']
    r = requests.get(url)
    with open('temp', 'wb') as f:
        f.write(r.content)
    current_md5 = hashlib.md5(open('temp','rb').read()).hexdigest()
    response = requests.get("http://ipinfo.io")
    # country = response.json()['country']
    # region = response.json()['region']
    ip = response.json()['ip']
    print(response.json())
    if current_md5 == md5:
        return "{}: yes".format(ip)
    else:
        return "{}: no".format(ip)