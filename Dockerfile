# syntax=docker/dockerfile:1.2

FROM alpine

ARG owner
ARG repo

RUN apk add --update --no-cache git

RUN --mount=type=secret,id=github_token \
    git clone "https://$(cat /run/secrets/github_token):x-oauth-basic@github.com/$owner/$repo"
