---
sh: HYGEN_OVERWRITE=1 node_modules/.bin/hygen scripts setup --collections <%= collections %> --edges <%= edges %> && HYGEN_OVERWRITE=1 node_modules/.bin/hygen routes init --collections <%= collections %>
---