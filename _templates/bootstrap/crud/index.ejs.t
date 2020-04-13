---
sh: HYGEN_OVERWRITE=1 node_modules/.bin/hygen routes new --collection <%= collection %> && HYGEN_OVERWRITE=1 node_modules/.bin/hygen controllers new --collection <%= collection %>
---