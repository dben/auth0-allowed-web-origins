#!/bin/bash
set -eo pipefail

if [ -z "${AUTH0_DOMAIN}" ]; then echo "AUTH0_DOMAIN is unset"; else echo "AUTH0_DOMAIN: ${AUTH0_DOMAIN}"; fi
if [ -z "${AUTH0_MANAGEMENT_CLIENT_ID}" ]; then echo "AUTH0_MANAGEMENT_CLIENT_ID is unset"; else echo "AUTH0_MANAGEMENT_CLIENT_ID: ${AUTH0_MANAGEMENT_CLIENT_ID}"; fi
if [ -z "${AUTH0_MANAGEMENT_CLIENT_SECRET}" ]; then echo "AUTH0_MANAGEMENT_CLIENT_SECRET is unset"; else echo "AUTH0_MANAGEMENT_CLIENT_SECRET: ${AUTH0_MANAGEMENT_CLIENT_SECRET}"; fi
if [ -z "${APP_ID}" ]; then echo "APP_ID is unset"; else echo "APP_ID: ${APP_ID}"; fi
if [ -z "${ORIGIN}" ]; then echo "ORIGIN is unset"; else echo "ORIGIN: ${ORIGIN}"; fi

if [ -z "${REMOVE}" ]; then echo "Calling Add!"; else echo "Calling Remove!"; fi

exit 0
