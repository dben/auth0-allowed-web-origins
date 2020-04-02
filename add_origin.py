import os
import sys

from auth0.v3.authentication import GetToken
from auth0.v3.management import Auth0

# export AUTH0_DOMAIN=https://domain.auth0.com
# export AUTH0_MANAGEMENT_CLIENT_ID=client_id
# export AUTH0_MANAGEMENT_CLIENT_SECRET=client_secret
# python3 add_origin <app_id> <origin>

domain = os.environ['AUTH0_DOMAIN']
non_interactive_client_id = os.environ['AUTH0_MANAGEMENT_CLIENT_ID']
non_interactive_client_secret = os.environ['AUTH0_MANAGEMENT_CLIENT_SECRET']

app_id = sys.argv[2]
origin = sys.argv[3]

get_token = GetToken(domain)
token = get_token.client_credentials(non_interactive_client_id,
    non_interactive_client_secret, 'https://{}/api/v2/'.format(domain))
mgmt_api_token = token['access_token']

# Get the app
auth0 = Auth0(domain, mgmt_api_token)
app = auth0.clients.get(app_id)

# Append our new web_allowed_origin
web_origins = app['web_origins']
web_origins.append(origin)

print('Adding {} to app {}'.format(origin, app['name']))
# Update the app
auth0.clients.update(app_id, { 'web_origins': web_origins })
