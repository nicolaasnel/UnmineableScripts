
import http.client
import json
import sys

value = sys.argv[1]
server = sys.argv[2]
token = sys.argv[3]

conn = http.client.HTTPSConnection(server)
payload = {
  'state': value
}
headers = {
  'Content-Type': 'application/json',
  'Authorization': 'Bearer ' + token
}
conn.request("POST", "/api/states/input_text.windows_action",  json.dumps(payload), headers)
res = conn.getresponse()
json_data = res.read()
data = json.loads(json_data)
state = data['state']
print(state, end='')
