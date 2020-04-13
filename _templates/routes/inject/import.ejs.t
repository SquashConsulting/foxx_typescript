---
inject: true
to: src/routes/index.ts
after: "import createRouter"
sh: HYGEN_OVERWRITE=1 node_modules/.bin/hygen routes inject:use --collection <%= collection %> --namespace <%= namespace %>
---
import <%= collection %>Router from './<%= collection %>';