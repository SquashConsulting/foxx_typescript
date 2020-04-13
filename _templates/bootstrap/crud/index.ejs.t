---
arbitrary: <% if ( typeof namespace === 'undefined') { ns = '/' } else { ns = namespace } %>
sh: HYGEN_OVERWRITE=1 node_modules/.bin/hygen routes new --collection <%= collection %> --namespace <%= ns %> && HYGEN_OVERWRITE=1 node_modules/.bin/hygen controllers new --collection <%= collection %>
---