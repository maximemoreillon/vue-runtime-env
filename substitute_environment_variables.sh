#!/bin/sh

ROOT_DIR=/app

# Replace env vars in files served by NGINX
for file in $ROOT_DIR/js/*.js* $ROOT_DIR/index.html $ROOT_DIR/precache-manifest*.js;
do
  sed -i 's|VUE_APP_MY_VARIABLE_PLACEHOLDER|'${VUE_APP_MY_VARIABLE}'|g' $file
  # Your other variables here...
done

exec "$@"
