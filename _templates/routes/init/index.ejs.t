---
to: src/routes/index.ts
unless_exists: false
---
<%
  const { collections } = JSON.parse(config);
-%>
import createRouter from '@arangodb/foxx/router';

import { pipe } from '../utils';

<% collections.forEach(collection => { -%>
import <%= collection %>Router from './<%= collection %>';
<% }) -%>

const router: Foxx.Router = pipe(
  createRouter,
  <% collections.forEach(collection => { -%>
  <%= collection %>Router,
  <% }) -%>
)();

export default router;
