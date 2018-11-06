# Nikita Ushakov | ID: 15313300
# Load the API packages
install.packages(c("jsonlite", "httpuv", "httr"))
library(jsonlite)
library(httpuv)
library(httr)

# Save username as variable
username <- 'qubka'

# Save base enpoint as variable
url_git <- 'https://api.github.com/'

# Can be github, linkedin etc depending on application
oauth_endpoints("github")

# Change based on what you 
myapp <- oauth_app(appname = "RGitHub_Access", key = "6141c2c391718b210db8", secret = "d9248f312fbd73f3cbbf3f4cdb54807fbfc6118d")

# Get OAuth credentials
auth <- oauth2.0_token(oauth_endpoints("github"), myapp)

# Construct API request
token <- config(token = auth)
repos <- GET(url = paste0(url_git, 'users/', username, '/repos'), token)

# Take action on http error
stop_for_status(repos)

# Extract content from a request
content = content(repos)

# Convert to a data.frame
json = fromJSON(toJSON(content))

# Show some columns
json[, c("name", "html_url", "git_commits_url")]