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

# Construct API request
repository <- GET(url = paste0(url_git,'users/', username, '/repos'))

# Let’s check the status_code of request
#status_code(repository)

# Take action on http error
stop_for_status(repository)

# Extract content from a request
content = content(repository)

# Convert to a data.frame
json = fromJSON(toJSON(content))

# Show some columns
json[, c("name", "html_url", "git_commits_url")]