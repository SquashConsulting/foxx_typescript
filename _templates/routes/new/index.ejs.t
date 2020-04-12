---
to: src/routes/<%= JSON.parse(config).collection %>.ts
unless_exists: false
---
<%
  const { collection } = JSON.parse(config);
  const controller = `${h.capitalize(collection)}Controller`;
-%>
import joi from 'joi';

import * as <%= controller %> from '../controllers/<%= collection %>';

export default function <%= collection %>Router(router: Foxx.Router): Foxx.Router {
  router
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

  router
    .get('/:key', (req: Foxx.Request, res: Foxx.Response) => {
      const { key } = req.pathParams;

      const data: ArangoDB.Document = <%= controller %>.find(key);

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

  router
    .post('/', (req: Foxx.Request, res: Foxx.Response): void => {
      const { body } = req.body;

      const data = <%= controller %>.create(body);

      res.send({ data });
    }).body(
      joi
        .object({
          body: joi.object().required(),
        })
        .required(),
      'Body to be inserted into <%= collection %>',
    );

  router
    .put('/:key', (req: Foxx.Request, res: Foxx.Response): void => {
      const { body } = req.body;
      const { key } = req.pathParams;

      const data = <%= controller %>.edit(key, body);

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

  router
    .delete('/:key', (req: Foxx.Request, res: Foxx.Response) => {
      const { key } = req.pathParams;

      <%= controller %>.delete(key);

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

  return router;
}
