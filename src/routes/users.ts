import joi from 'joi';

import * as UsersController from '../controllers/users';

export default function usersRouter(router: Foxx.Router): Foxx.Router {
  router
    .get('/', (_req: Foxx.Request, res: Foxx.Response) => {
      const data: ArangoDB.Document[] = UsersController.list();

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
    .summary('Lists all users.');

  router
    .get('/:key', (req: Foxx.Request, res: Foxx.Response) => {
      const { key } = req.pathParams;

      const data: ArangoDB.Document = UsersController.find(key);

      res.send({ data });
    })
    .pathParam(
      'key',
      joi.string().required(),
      'Key of the users to be retrieved.',
    )
    .response(
      joi
        .object({
          // TBD
        })
        .required(),
      'result',
    )
    .summary('finds a single entity from users');

  router
    .post('/', (req: Foxx.Request, res: Foxx.Response): void => {
      const { body } = req.body;

      const data = UsersController.create(body);

      res.send({ data });
    })
    .body(
      joi
        .object({
          body: joi.object().required(),
        })
        .required(),
      'Body to be inserted into users',
    );

  router
    .put('/:key', (req: Foxx.Request, res: Foxx.Response): void => {
      const { body } = req.body;
      const { key } = req.pathParams;

      const data = UsersController.edit(key, body);

      res.send({ data });
    })
    .pathParam(
      'key',
      joi.string().required(),
      'Key of the users to be updated.',
    )
    .body(
      joi
        .object({
          body: joi.object().required(),
        })
        .required(),
      'Body to be inserted into users',
    );

  router
    .delete('/:key', (req: Foxx.Request, res: Foxx.Response) => {
      const { key } = req.pathParams;

      UsersController.delete(key);

      res.send({ data: null });
    })
    .pathParam(
      'key',
      joi.string().required(),
      'Key of the users to be deleted.',
    )
    .response(
      joi
        .object({
          // TBD
        })
        .required(),
      'result',
    )
    .summary('deletes a single entity from users');

  return router;
}
