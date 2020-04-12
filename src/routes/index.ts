import createRouter from '@arangodb/foxx/router';

import { pipe } from '../utils';

import usersRouter from './users';

const router: Foxx.Router = pipe(
  createRouter,
    usersRouter,
  )();

export default router;
