import createRouter from '@arangodb/foxx/router';

import { pipe } from '../utils';

const router: Foxx.Router = pipe(createRouter)();

export default router;
