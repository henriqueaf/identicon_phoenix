#!/usr/bin/env bash
curl --user ${CIRCLE_TOKEN}: \
    --request POST \
    --form revision=71626548deda632f9674b45cce34cc89085e38f8\
    --form config=@config.yml \
    --form notify=false \
        https://circleci.com/api/v1.1/project/github/henriqueaf/identicon_phoenix/tree/master
