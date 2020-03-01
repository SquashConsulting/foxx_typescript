import createRouter from '@arangodb/foxx/router';

import hello from './hello';
import { pipe } from '../utils';

const router: Foxx.Router = pipe(createRouter, hello)();

export default router;
