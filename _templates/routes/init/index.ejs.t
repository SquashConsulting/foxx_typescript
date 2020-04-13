---
to: src/routes/index.ts
---
<%
  const cols = collections.split(',');
-%>
import createRouter from '@arangodb/foxx/router';

import { pipe } from '../utils';

<% cols.forEach(collection => { -%>
import <%= collection %>Router from './<%= collection %>';
<% }) -%>

const rootRouter: Foxx.Router = createRouter();

export default rootRouter;
