# Docker Frappe (Multi-container)

Frappe, ERPNext, Schools - Dockerized on Alpine

## Start a local version of ERPNext

1. `docker-compose run web`
2. Enter `y` when asked to reset the database.
3. `docker-compose up -d`
4. `docker-compose logs -f`

You should be able to log in to the server at `http://localhost`. The username is `Administrator` and the password is `frappe`.
