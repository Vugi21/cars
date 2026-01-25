#!/usr/bin/env bash
set -o errexit

# 1) Install dependencies first
pip install -r requirements.txt

# 2) Collect static + migrate
python manage.py collectstatic --noinput

# python manage.py migrate

# 3) Optional: create superuser (ONLY if env vars exist)
if [[ -z "${SUPERUSER_CREATED}" ]]; then
  if [[ -n "${DJANGO_SUPERUSER_USERNAME}" && -n "${DJANGO_SUPERUSER_EMAIL}" && -n "${DJANGO_SUPERUSER_PASSWORD}" ]]; then
    python manage.py createsuperuser --noinput || true
    export SUPERUSER_CREATED=1
  fi
fi
