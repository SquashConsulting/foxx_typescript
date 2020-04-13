---
arbitrary: <% if ( typeof namespace === 'undefined') { ns = '/' } else { ns = namespace } %>
to: src/routes/<%= collection %>.ts
sh: HYGEN_OVERWRITE=1 node_modules/.bin/hygen routes inject:import --collection <%= collection %> --namespace <%= ns %>
---
<%
  const controller = `${h.capitalize(collection)}Controller`;
-%>
import joi from 'joi';
import { createRouter } from '@arangodb/foxx';

import * as <%= controller %> from '../controllers/<%= collection %>';

const <%= collection %>Router = createRouter();

<%= collection %>Router
  .get('/', (_req: Foxx.Request, res: Foxx.Response) => {
    const data: ArangoDB.Document[] = <%= controller %>.list();

    res.send({ data });
  })
  .response(
    joi
      .object({
        // TBD
      })
      .required(),
    'result',
  )
  .summary('Lists all <%= collection %>.');

<%= collection %>Router
  .get('/:key', (req: Foxx.Request, res: Foxx.Response) => {
    const { key } = req.pathParams;

    const data: ArangoDB.Document = <%= controller %>.find(key, res);

    res.send({ data });
  })
  .pathParam(
    'key',
    joi.string().required(),
    'Key of the <%= collection %> to be retrieved.',
  )
  .response(
    joi
      .object({
        // TBD
      })
      .required(),
    'result',
  )
  .summary('finds a single entity from <%= collection %>');

<%= collection %>Router
  .post('/', (req: Foxx.Request, res: Foxx.Response): void => {
    const { body } = req.body;

    const data = <%= controller %>.create(body, res);

    res.send({ data });
  }).body(
    joi
      .object({
        body: joi.object().required(),
      })
      .required(),
    'Body to be inserted into <%= collection %>',
  );

<%= collection %>Router
  .put('/:key', (req: Foxx.Request, res: Foxx.Response): void => {
    const { body } = req.body;
    const { key } = req.pathParams;

    const data = <%= controller %>.edit(key, body, res);

    res.send({ data });
  })
  .pathParam(
    'key',
    joi.string().required(),
    'Key of the <%= collection %> to be updated.',
  )
  .body(
    joi
      .object({
        body: joi.object().required(),
      })
      .required(),
    'Body to be inserted into <%= collection %>',
  );

<%= collection %>Router
  .delete('/:key', (req: Foxx.Request, res: Foxx.Response) => {
    const { key } = req.pathParams;

    <%= controller %>.remove(key);

    res.send({ data: null });
  })
  .pathParam(
    'key',
    joi.string().required(),
    'Key of the <%= collection %> to be deleted.',
  )
  .response(
    joi
      .object({
        // TBD
      })
      .required(),
    'result',
  )
  .summary('deletes a single entity from <%= collection %>');

export default <%= collection %>Router;
